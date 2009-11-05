module CornellNetid
  VALID_NET_ID = /^\w{2,3}\d+$/i
  VALID_NET_ID_WITH_EMAIL = /^(\w{2,3}\d+)(@cornell\.edu)?$/i
  class InvalidNetidError < RuntimeError; end
end

require 'core_extensions/string'

