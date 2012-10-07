<?php

/**
 * Books database model.
 *
 * @author Martin Zlámal
 */
class Books {

	public $dibi;

	/**
	 * Constructor for the table books.
	 * First argument is name of table.
	 * @param  Nette\Database\Connection
	 */
	public function __construct(\DibiConnection $connection) {
		$this->dibi = $connection;
	}

	public function saveNewBook($values) {
		$this->dibi->query('INSERT INTO books', $values);
	}

	public function getBookByID($id) {
		return $this->dibi->query('SELECT * FROM books WHERE id=%i', $id)->fetch();
	}

	public function getBooks($offset, $limit) {
		return $this->dibi->query('SELECT * FROM books ORDER BY datumPridani DESC %ofs %lmt', $offset, $limit);
	}

	public function getBooksID() {
		return $this->dibi->query('SELECT id FROM books');
	}

}