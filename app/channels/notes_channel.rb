# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotesChannel < ApplicationCable::Channel

  # The #subscribed callback is invoked when a client-side
  # subscription is initiated (i.e. when App.cable.subscriptions.create('notes')
  # is invoked).
  def subscribed
    #stream_for starts streaming from the 'notes' broadcasting pubsub queue.
    stream_from "notes"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
