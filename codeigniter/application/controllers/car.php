<?php defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class car extends REST_Controller
{
	function profile_get() {
            
            if ($this->get('id') == TRUE & is_numeric($this->get('id')) == TRUE)
            {
              $car = $this->car_model->getCarProfilebyId($this->get('id'));
            } 
            else if ($this->get('make') == TRUE & is_numeric($this->get('make')) == FALSE)
            {
              $car = $this->car_model->getCarProfilesbyMake($this->get('make'));
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

    }
}