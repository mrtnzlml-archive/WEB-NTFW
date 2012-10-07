<?php

/**
 * Options database model.
 *
 * @author Martin Zlámal
 */
class Options {

	public $dibi;

	/**
	 * Constructor for the table options.
	 * First argument is name of table.
	 * @param  Nette\Database\Connection
	 */
	public function __construct(\DibiConnection $connection) {
		$this->dibi = $connection;
	}

	public function setMena($mena) {
		$this->dibi->query('UPDATE options SET mena=%s', $mena);
	}

	public function getMena() {
		return $this->dibi->query('SELECT mena FROM options')->fetch();
	}

}