<?php

/**
 * Users database model.
 *
 * @author Martin Zlámal
 */
class Users {

	public $dibi;

	/**
	 * Constructor for the table users.
	 * First argument is name of table.
	 * @param  Nette\Database\Connection
	 */
	public function __construct(\DibiConnection $connection) {
		$this->dibi = $connection;
	}

	public function getUserByID($id) {
		return $this->dibi->query('SELECT * FROM users WHERE id=%i', $id)->fetch();
	}

	public function updateUserByID($id, $arr) {
		$this->dibi->query('UPDATE users SET ', $arr, ' WHERE id=%i', $id);
	}

}