# The Connection class is where we authorize the incoming connections.
# For example, establishing a channel to a give user's inbox, which requires
# user authorization. Leave this class alone if any user can join the connection
# at any time.

module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end
