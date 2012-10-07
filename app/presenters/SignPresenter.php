<?php

use Nette\Application\UI,
	Nette\Security as NS;


/**
 * Sign in/out presenters.
 *
 * @author     John Doe
 * @package    MyApplication
 */
class SignPresenter extends BasePresenter {

	/**
	 * Sign in form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSignInForm() {
		$form = new UI\Form;
		$form->addText('username', 'Email nebo přihlašovací jméno:')
			->setRequired('Vyplňte prosím login.');
		$form->addPassword('password', 'Heslo:')
			->setRequired('Vyplňte prosím heslo.');
		$form->addCheckbox('remember', 'Zapamatovat si mě na tomto počítači');
		$form->addSubmit('send', 'Přihlásit');
		$form->onSuccess[] = callback($this, 'signInFormSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function signInFormSubmitted($form) {
		try {
			$values = $form->getValues();
			if ($values->remember) {
				$this->getUser()->setExpiration('+ 14 days', FALSE);
			} else {
				$this->getUser()->setExpiration('+ 20 minutes', TRUE);
			}
			$this->getUser()->login($values->username, $values->password);
			$this->flashMessage('Byli jste přihlášeni.');
			$this->redirect('Homepage:');
		} catch (NS\AuthenticationException $e) {
			$form->addError($e->getMessage());
			//$this->flashMessage($e->getMessage());
		}
	}

	/**
	 * Sign in form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentRegisterForm() {
		$form = new UI\Form;
		$form->addText('name', 'Jméno:');
		$form->addText('surname', 'Příjmení:');
		$form->addText('username', 'Přihlašovací jméno:')
			->setRequired('Vyplňte prosím login.');
		$form->addText('mail', 'Email:')
			->setRequired('Vyplňte prosím email.')
			->addRule(UI\Form::EMAIL, 'Zadejte prosím platný email.');
		$form->addPassword('password', 'Heslo:')
			->setAttribute('autocomplete', 'off')
			->setRequired('Zvolte si prosím heslo.')
    		->addRule(UI\Form::MIN_LENGTH, 'Heslo musí mít alespoň %d znaky.', 3);
		$form->addPassword('passwordVerify', 'Heslo znova:')
			->setAttribute('autocomplete', 'off')
			->setRequired('Zadejte prosím heslo ještě jednou pro kontrolu.')
    		->addRule(UI\Form::EQUAL, 'Hesla se neshodují', $form['password']);
		$form->addSubmit('send', 'Registrovat');
		$form->onSuccess[] = callback($this, 'registerFormSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function registerFormSubmitted($form) {
		$this->flashMessage('TODO');
	}

	public function actionOut() {
		$this->getUser()->logout();
		$this->flashMessage('Byli jste odhlášeni.');
		$this->redirect('in');
	}

}
