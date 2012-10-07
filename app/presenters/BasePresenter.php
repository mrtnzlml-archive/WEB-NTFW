<?php

use Nette\Security\Permission,
	Nette\Application\UI;

/**
 * Base class for all application presenters.
 *
 * @author Martin Zlámal
 */
abstract class BasePresenter extends Nette\Application\UI\Presenter {

	private $options;

	public function startup() {
		parent::startup();
		$this->options = $this->context->options;
	}

	public function beforeRender() {
		$this->template->mena = $this->options->getMena()->mena;
		$this->template->basket = $this->getSession('basket');
		$this->template->menuItems = array(
			'Bestsellery' => '#',
			'Novinky' => '#',
		);
	}

	public function handleAdd($id) {
		$basket = $this->getSession('basket');
		$basket->id[] = $id;
	}

	/**
	 * Add form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSearchForm() {
		$form = new UI\Form;
		$form->addText('searchString');
		//$form->addSubmit('searchButton', 'Hledat');
		$form->onSuccess[] = callback($this, 'searchFormSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function searchFormSubmitted($form) {
		$values = $form->getValues();
		$this->flashMessage('TODO');
	}

}