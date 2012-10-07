<?php

use Nette\Security as NS;

/**
 * Users authenticator.
 *
 * @author Martin Zlámal
 */
class Authenticator extends Nette\Object implements NS\IAuthenticator {

	/** @var Nette\Database\Table\Selection */
	private $users;

	/** @var \DibiConnection */
	private $dibi;

	public function __construct(\DibiConnection $connection) {
		$this->dibi = $connection;
	}

	/**
	 * Performs an authentication.
	 * @param  array
	 * @return Nette\Security\Identity
	 * @throws Nette\Security\AuthenticationException
	 */
	public function authenticate(array $credentials) {
		list($username, $password) = $credentials;
		$row = $this->dibi->query('SELECT * FROM users WHERE login = %s OR mail = %s', $username, $username)->fetch();

		if (!$row) {
			throw new NS\AuthenticationException("User '$username' not found.", self::IDENTITY_NOT_FOUND);
		}

		if ($row->password !== $this->calculateHash($password)) {
			throw new NS\AuthenticationException("Invalid password.", self::INVALID_CREDENTIAL);
		}

		unset($row->password);
		return new NS\Identity($row->id, $row->role, $row->toArray());
	}

	/**
	 * Computes salted password hash.
	 * @param  string
	 * @return string
	 */
	public function calculateHash($password) {
		return (hash('sha512', $password).str_repeat('KJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=a', 6));
	}

}