<?php

use Nette\Application\UI;

/**
 * Basket presenter.
 *
 * @author Martin Zlámal
 */
class BasketPresenter extends BasePresenter {

	private $books;

	public function startup() {
		parent::startup();
		$this->books = $this->context->books;
	}

	public function renderDefault() {
		$basket = $this->getSession('basket');
		if(isset($basket->id)) {
			foreach($basket->id as $id) {
				$books[] = $this->books->getBookByID($id);
			}
			$this->template->books = $books;
		}
	}

	public function handleUnset() {
		$basket = $this->getSession('basket');
		$basket->remove();
	}

}