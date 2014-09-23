#api_doc_server.rb
require 'sinatra/base'
require 'json'
require 'yaml'




class DocServer < Sinatra::Base


  set :public_folder, 'swagger-ui/dist'

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end




  get '/' do

    redirect '/index.html'

  end




  get '/api/api-docs' do

    content_type :json

    File.read('api/v1/info.json')

  end




  get '/api/api-docs/nodes' do

    content_type :json

    nodes = File.read('api/v1/nodes.json')

    nodes = JSON.parse(nodes)

    nodes['basePath'] = @@basepath

    nodes.to_json

  end




  get '/api/api-docs/channels' do

    content_type :json

    channels = File.read('api/v1/channels.json')

    channels = JSON.parse(channels)

    channels['basePath'] = @@basepath

    channels.to_json

  end




  get '/api/api-docs/leases' do

    content_type :json

    leases = File.read('api/v1/leases.json')

    leases = JSON.parse(leases)

    leases['basePath'] = @@basepath

    leases.to_json

  end




  get '/api/api-docs/cmc' do

    content_type :json

    cmc = File.read('api/v1/cmc.json')

    cmc = JSON.parse(cmc)

    cmc['basePath'] = @@basepath

    cmc.to_json

  end




  get '/api/api-docs/openflow' do

    content_type :json

    openflow = File.read('api/v1/openflow.json')

    openflow = JSON.parse(openflow)

    openflow['basePath'] = @@basepath

    openflow.to_json

  end




  get '/api/api-docs/lte' do

    content_type :json

    lte = File.read('api/v1/lte.json')

    lte = JSON.parse(lte)

    lte['basePath'] = @@basepath

    lte.to_json

  end




  get '/api/api-docs/wimax' do

    content_type :json

    wimax = File.read('api/v1/wimax.json')

    wimax = JSON.parse(wimax)

    wimax['basePath'] = @@basepath

    wimax.to_json

  end



  def self.run!
    @config = YAML.load_file(File.dirname(__FILE__) + '/configuration.yaml')
    @@basepath = @config[:basepath]
    ssl = @config[:ssl]
  	ssl_options = {
      :cert_chain_file => ssl[:cert_chain_file],
      :private_key_file => ssl[:private_key_file],
      :verify_peer => false
    }
    rack_handler_config = {Port: @config[:port]}

    Rack::Handler::Thin.run(self, rack_handler_config) do |server|
      server.ssl = ssl[:enabled]
      server.ssl_options = ssl_options
    end
  end

end


DocServer.run!
