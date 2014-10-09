class Api::BaseController < ApplicationController
  respond_to :json, :xml
end
