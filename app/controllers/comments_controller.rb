# 20171017 5.8 Comments Controller & Views

class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		# old
		#@comment.save
		#redirect_to product_path(@product)

		#20171022 5.9 Validation & Pagination
		#user must be logged in and write a comment and input star rating to save a comment
		respond_to do |format|
			if @comment.save
				
				# 20171224 6.13: Real-Time Updates with ActionCable
				ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating

				format.html { redirect_to @product, notice: 'Review was created successfully.' }
				format.json { render :show, status: :created, location: @product }
				# 20171215 6.10: AJAX
				format.js
			else
				format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	# 20171029 5.10 Admin Role & Moderating User Comments
	def destroy
		@comment = Comment.find(params[:id])
		product = @comment.product
		@comment.destroy
		redirect_to product
	end

	private

		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end

end
