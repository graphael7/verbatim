class MemorizeController < ApplicationController
	def index
		@speeches = current_user.speeches
	end

	def new
		@speech = Speech.new
	end

	def create
		@user = current_user
		@speech = @user.speeches.new(speech_params)

		if @speech.save
			number_of_sections = (@speech.body.length/50.to_f).ceil
			sects = []
			x = 0
			number_of_sections.times{
			if @speech.body.length < 100
				sects << @speech.body[x..x+100]
			else
				sects << @speech.body[x..x+100]
				x += 100
			end
			}
			sects.each do |sect|
				@speech.sections.create!(body: sect)
			end
			binding.pry

			redirect_to memorize_index_path
  			# success
		else
  			# error handling
  			@errors = @speech.errors.full_messages
  			redirect_to new_memorize_path
		end

	end

	def speech_params
    params.require(:speech).permit(:title, :body, :user_id)
  end


end
