require "./config/environment"
use Rack::MethodOverride

use UsersController 
use LessonsController
run ApplicationController