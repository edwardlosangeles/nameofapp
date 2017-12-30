# 20171224 6.13: Real-Time Updates with ActionCable
class ProductChannel < ApplicationCable::Channel
  def subscribed

    # 20171228 6.14: ActiveJob and Advanced ActionCable
  	# Comment this out
    # stream_from "product_channel"
 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # 20171228 6.14: ActiveJob and Advanced ActionCable
  def listen(data)
  	stop_all_streams
  	stream_for data["product_id"]
  end


end
