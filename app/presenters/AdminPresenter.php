<?php

use Nette\Application\UI,
	Nette\Image;

/**
 * Admin presenter.
 *
 * @author Martin Zlámal
 */
class AdminPresenter extends BasePresenter {

	private $books;
	private $options;

	public function startup() {
		parent::startup();
		$this->books = $this->context->books;
		$this->options = $this->context->options;
	}

	/**
	 * Add form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentAddForm() {
		$form = new UI\Form;
		$form->addText('nazevKnihy', 'Název knihy:')
			->setRequired('Vyplňte prosím název knihy.');
		$form->addTextArea('popisKnihy', 'Popis knihy:')
			->setRequired('Napište prosím popis knihy.');
		$form->addText('cenaKnihy', 'Cena knihy bez DPH:')
			->setType('number')
			->setRequired('Vyplňte prosím cenu knihy.');
		$form->addUpload('nahledKnihy', 'Náhled knihy:'); // TODO validační pravidla MAX_FILE_SIZE, IMAGE
		$form->addSubmit('save', 'Uložit a publikovat');
		$form->onSuccess[] = callback($this, 'addFormSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function addFormSubmitted($form) {
		$values = $form->getValues();
		$arr = array(
			'nazevKnihy' => $values->nazevKnihy,
			'popisKnihy' => $values->popisKnihy,
			'cenaKnihy' => $values->cenaKnihy,
			'datumPridani' => new DateTime(),
			'md5obrazku' => md5($values->nazevKnihy.$values->popisKnihy),
		);
		$image = Image::fromFile($values->nahledKnihy);
		$image->resize(350, 250, Image::FIT | Image::SHRINK_ONLY);
		$image->sharpen();
		$image->save('books/big/'.md5($values->nazevKnihy.$values->popisKnihy).'_b.png', Image::PNG);
		$image->resize(140, 100, Image::FIT | Image::SHRINK_ONLY);
		$image->sharpen();
		$image->save('books/small/'.md5($values->nazevKnihy.$values->popisKnihy).'_s.png', Image::PNG);
		try {
			$this->books->saveNewBook($arr);
			$this->flashMessage('Uloženo.');
		} catch(DibiException $exc) {
			$this->flashMessage('Error '.$exc->getCode().': '.$exc->getMessage(), 'error');
		}
	}

	/**
	 * Setting form component factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentSettingForm() {
		$form = new UI\Form;
		$mena = array(
			'Kč' => 'Kč',
			'&euro;' => 'Euro',
			'&#36;'  => 'Dolar',
		);
		$form->addSelect('mena', 'Měna eshopu:', $mena);
		$form->addSubmit('save', 'Uložit');
		$form->onSuccess[] = callback($this, 'settingSubmitted');

		$renderer = $form->getRenderer();
		$renderer->wrappers['controls']['container'] = 'dl';
		$renderer->wrappers['pair']['container'] = NULL;
		$renderer->wrappers['label']['container'] = 'dt';
		$renderer->wrappers['control']['container'] = 'dd';

		return $form;
	}

	public function settingSubmitted($form) {
		try {
			$this->options->setMena($form->getValues()->mena);
			$this->flashMessage('Uloženo.');
		} catch(DibiException $exc) {
			$this->flashMessage('Error '.$exc->getCode().': '.$exc->getMessage(), 'error');
		}
	}

}
