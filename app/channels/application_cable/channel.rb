# Your channels inherit from this class.
# This is where we place shared logic among any additional channels
# that we define.

module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end
