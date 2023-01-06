class PagesController < ApplicationController

  def home
   render 'pages/home' # 可有可無
  end

  def about
		
  end

  def math
    @numbers = (1..46).to_a.sample(6)
  end

end
