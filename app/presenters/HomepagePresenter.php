<?php

/**
 * Homepage presenter.
 *
 * @author Martin Zlámal
 */
class HomepagePresenter extends BasePresenter {

	private $books;
	private $categories;

	public function startup() {
		parent::startup();
		$this->books = $this->context->books;
		$this->categories = $this->context->categories;
	}

	public function renderDefault($page = 1) {
		$vp = new VisualPaginator($this, 'vp');
		$paginator = $vp->getPaginator();
		$paginator->itemsPerPage = 10;
		$paginator->itemCount = $this->books->getBooksID()->count();

		$this->template->lastBooks = $this->books->getBooks($paginator->offset, $paginator->itemsPerPage);
		$this->template->categories = $this->categories->getTopCategories();
	}

}