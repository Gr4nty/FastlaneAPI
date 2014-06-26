<?php defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class car extends REST_Controller
{
	function profile_get() {
            
            if ($this->get('id') == TRUE & is_numeric($this->get('id')) == true)
            {
              $car = $this->car_model->getCarProfile($this->get('id'));
            } 
            else if ($this->get('make') == TRUE)
            {
              $car = $this->car_model->getCarProfile($this->get('make'));
            }
            else 
            {
            $this->response(array('error' => 'Bad Request'), 400);
            }
            
            if ($car) {
            $this->response($car, 200); // 200 being the HTTP response code
            } else {
            $this->response(array('error' => 'Car type not found'), 404);
            }
//        if (!$this->get('id') || is_numeric($this->get('id')) == false) 
//            {
//            $this->response(array('error' => 'Bad Request'), 400);
//            } 
//        else 
//            {
//            $user = $this->car_model->getUserById($this->get('id'));
//            }
//
//        if ($user) 
//            {
//            $this->response($user, 200); // 200 being the HTTP response code
//            } 
//        else 
//            {
//            $this->response(array('error' => 'Car Type not found'), 404);
//            }
    }
}