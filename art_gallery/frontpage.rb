require('pry')
require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/admin_controller')
require_relative('controllers/visitor_controller')
require_relative('models/time')
also_reload('./models/*')


get '/' do
  erb(:index)
end
# binding.pry
# nil
