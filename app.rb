# coding: utf-8

module Project
  class App < Sinatra::Base

    configure :development do
      Bundler.require :development
      register Sinatra::Reloader
      Slim::Engine.set_default_options :pretty => true
      set :scss, :views => 'assets/scss', :style => :expanded
    end

    configure :production do
      set :scss, :views => 'assets/scss', :style => :compressed
    end

    before do
      @site_title = 'Site Title'
    end

    get '/css/:name.css' do
      scss params[:name].to_sym
    end

    get '/' do
      slim :index
    end
  end

end
