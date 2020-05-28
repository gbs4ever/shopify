class ApiController < ApplicationController

    def welcome
        render  :json => {status: "loaded shopify app dev"}
    end
end  