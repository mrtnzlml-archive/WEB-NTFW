<?php

use Nette\Application\UI;

/**
 * Single presenter.
 *
 * @author Martin Zlámal
 */
class SinglePresenter extends BasePresenter {

	private $books;
	private $users;

	public function startup() {
		parent::startup();
		$this->books = $this->context->books;
		$this->users = $this->context->users;
	}

	public function renderCategory($category) {
		/* select from, podle param category */
		$this->template->category = $category;
	}

	public function renderBook($id)	{
		$this->template->book = $this->books->getBookByID($id);
	}

	/**
	 * Setting form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSettingForm() {
		$form = new UI\Form;
		$userID = $this->getUser()->getID();
		$user = $this->users->getUserByID($userID);
		$form->addText('name', 'Jméno:')->setValue($user->name);
		$form->addText('surname', 'Příjmení:')->setValue($user->surname);
		$form->addText('mail', 'Email:')
			->setRequired('Vyplňte prosím email.')
			->setValue($user->mail);
		$form->addPassword('password', 'Nové heslo:')
			->setAttribute('autocomplete', 'off')
			->addCondition(UI\Form::FILLED)
			->addRule(UI\Form::MIN_LENGTH, 'Heslo musí mít alespoň %d znaky.', 3);
		$form->addPassword('passwordVerify', 'Nové heslo znova:')
			->setAttribute('autocomplete', 'off')
			->addConditionOn($form['password'], UI\Form::FILLED)
			->addRule(UI\Form::EQUAL, 'Hesla se neshodují', $form['password']);
		$form->addSubmit('save', 'Uložit změny');
		$form->onSuccess[] = callback($this, 'settingFormSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function settingFormSubmitted($form) {
		$values = $form->getValues();
		$arr = array(
			'name' => $values->name,
			'surname' => $values->surname,
			'mail' => $values->mail,
		);
		if(!empty($values->password)) {
			$arr['password'] = hash('sha512', $values->password).str_repeat('KJRp4*qS!!Zm=WgP@ZM5SSN-whjMejpkY8aST!MRFJ)6_U2YXFc# $6#nPqH=a', 6);
		} 
		try {
			$this->users->updateUserByID($this->getUser()->getID(), $arr);
			$this->flashMessage('Uloženo.');
		} catch(DibiException $exc) {
			$this->flashMessage('Error '.$exc->getCode().': '.$exc->getMessage(), 'error');
		}
	}

}