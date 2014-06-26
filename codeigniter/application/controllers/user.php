<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Example
 *
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array.
 *
 * @package		CodeIgniter
 * @subpackage	Rest Server
 * @category	Controller
 * @author		Phil Sturgeon
 * @link		http://philsturgeon.co.uk/code/
*/

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH.'/libraries/REST_Controller.php';

class user extends REST_Controller
{
	// Get user data
    function profile_get() {

        if (!$this->get('id') || is_numeric($this->get('id')) == false) {
            $this->response(array('error' => 'Bad Request'), 400);
        } else {
            $user = $this->user_model->getUserById($this->get('id'));
        }

        if ($user) {
            $this->response($user, 200); // 200 being the HTTP response code
        } else {
            $this->response(array('error' => 'User not found'), 404);
        }
    }

}
