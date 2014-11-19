class RequestsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@requests = Request.all
	end

	def new
		@request = Request.new
	end

	def edit
	end

	def create
		@request = Request.new(request_params)

		@request.save
		redirect_to @request
	end

	def show
		@request = Request.find(params[:id])
	end

	def update
	end

	def destroy
		@request = Request.find(params[:id])
		@request.destroy

		redirect_to @request
	end

	def change_shift
		@request = Request.new(change_shift_params)

		@request.save
		redirect_to root_path
	end

	def make_shift_available
		@request = Request.new(make_shift_available_params)

		@request.save
		redirect_to root_path
	end

	def pick_up_shift
		@request = Request.find(params[:id])
		@request.update(pick_up_shift_params)

		redirect_to root_path
	end

	def give_shift
		@request = Request.find(params[:id])
		@request.update(give_shift_params)

		redirect_to root_path
	end

	def approve_shift
		@request = Request.find(params[:id])
		@request.update(approve_shift_params)

		redirect_to root_path
	end

	private
	def pick_up_shift_params
		params.require(:request).permit(:accepter_id)
	end

	def give_shift_params
		params.require(:request).permit(:requester_id)
	end

	def approve_shift_params
		params.require(:request).permit(:admin_id)
	end

	def change_shift_params
		params.require(:request).permit(:shift_id, :requester_id, :reason, :availability)
	end

	def make_shift_available_params
		shift = Shift.create(date: params[:date], time: params[:time])
		params[:request][:shift_id] = shift.id
		params.require(:request).permit(:shift_id, :accepter_id, :availability)
	end
end
