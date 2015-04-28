
# ***** GEMS *****
require 'bundler/setup'
Bundler.require

# ***** CONNECTION *****
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'fivestar'
)

# ***** HELPERS *****
require './helpers/session_helpers'

# ***** MODELS *****
require './models/party'
require './models/food'
require './models/order'
require './models/user'

# ***** CONTROLLERS *****
require './controllers/foods_controller'
require './controllers/parties_controller'
require './controllers/orders_controller'
require './controllers/sessions_controller'
require './controllers/welcome_controller'

# ***** ROUTING *****
map('/api/foods') { run FoodsController.new() }
map('/api/parties') { run PartiesController.new() }
map('/api/orders') { run OrdersController.new() }
map('/sessions') { run SessionsController.new() }

map('/') { run WelcomeController.new() }
