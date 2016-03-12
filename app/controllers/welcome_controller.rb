class WelcomeController < ApplicationController
  def index
    @post = Post.last
  end
end
