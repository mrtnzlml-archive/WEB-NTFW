<?php

use Nette\Security\Permission;

class Authorizator implements Nette\Security\IAuthorizator {

	/**
	 * @var Nette\Security\Permission
	 */
	private $acl;

	public function __construct() {
		$acl = new Nette\Security\Permission();
		// definujeme role
		$acl->addRole('guest');
		$acl->addRole('member', 'guest'); // member dědí od guest
		$acl->addRole('admin', 'member'); // a od něj dědí admin
		// seznam zdrojů, ke kterým mohou uživatelé přistupovat
		$acl->addResource('shop');
		$acl->addResource('administration');
		$acl->addResource('setting');
		// pravidla, určující, kdo co může s čím dělat
		$acl->allow('member', 'setting', 'enter'); // může vstoupit do administrace
		$acl->allow('member', 'shop', 'use');
		$acl->allow('admin', Permission::ALL, Permission::ALL);
		// ACTION
		$this->acl = $acl;
	}

	function isAllowed($role, $resource, $privilege) {
		return $this->acl->isAllowed($role, $resource, $privilege);
	}

}