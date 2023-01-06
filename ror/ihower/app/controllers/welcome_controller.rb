class WelcomeController < ApplicationController
    def say
        @name = "#{params[:name]}"
    end

    def index
    end

    def math
       @numbers = (1..46).to_a.sample(6)
    end
end
