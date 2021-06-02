class MutterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "mutter_channel"
    puts 'MutterChannel#subscribed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
