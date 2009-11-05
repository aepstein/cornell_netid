module CornellNetid
  VALID_NET_ID = /^[a-z]{2,3}\d+$/
  PARSEABLE_NET_ID = /^([A-Za-z]{2,3}\d+)(@cornell\.edu)?$/i
  class InvalidNetidError < RuntimeError; end
end

require 'core_extensions/string'

