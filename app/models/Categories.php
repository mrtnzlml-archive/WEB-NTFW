<?php

/**
 * Categories database model.
 *
 * @author Martin Zlámal
 */
class Categories {

	public $dibi;

	/**
	 * Constructor for the table books.
	 * First argument is name of table.
	 * @param  Nette\Database\Connection
	 */
	public function __construct(\DibiConnection $connection) {
		$this->dibi = $connection;
	}

	public function getTopCategories() {
		return $this->dibi->query('SELECT category FROM categories WHERE parentID=0 ORDER BY category ASC');
	}

}