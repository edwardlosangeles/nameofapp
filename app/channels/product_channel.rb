# 20171224 6.13: Real-Time Updates with ActionCable
class ProductChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
