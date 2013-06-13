# coding: utf-8

module Project
  class App < Sinatra::Base

    configure :development do
      Bundler.require :development
      register Sinatra::Reloader
      Slim::Engine.set_default_options :pretty => true
    end

    before do
      @site_title = 'Site Title'
    end

    get '/' do
      slim :index
    end
  end

end
