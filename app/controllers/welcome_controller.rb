class WelcomeController < ApplicationController
	def index
		flash[:notice] = "你好！这个神奇的世界！O(∩_∩)O~~"
	end
end
