require './config/environment'

#remember to USE all other controllers here dumbass!
use Rack::MethodOverride
use UserController
use GuitarController
use SessionController
run ApplicationController
