<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ecommerce extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index()
	{
		$this->load->view("Format/header");
		$this->load->view('Ecommerce/ecommerceView');
		$this->load->view("Format/footer");
	}
}
