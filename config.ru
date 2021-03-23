require "./config/environment"

# use Rack::MethodOverride

use UserController 
use TopicController
run ApplicationController