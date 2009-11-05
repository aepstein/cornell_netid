module CornellNetid::CoreExtensions
  module String

    # Returns an array of strings representing valid netids contained in the
    # source string.  The source string may contain multiple netids or
    # netid@cornell.edu addresses separated by any of these characters:
    #
    # * , ; \ / : whitespace
    def to_net_ids
      ids = self.split(/[\,\;\\\/\s\:]+/)
      ids.map! { |part| part.to_net_id }
      ids.reject! { |part| part.nil? }
      ids.uniq
    end

    # Returns a string representing a valid net id parsed out of the string
    def to_net_id
      self.strip.downcase[CornellNetid::PARSEABLE_NET_ID,1]
    end

    # Converts the string to a valid netid if it contains one
    # Throws InvalidNetidError if no valid net id is contained in string
    def to_net_id!
      id = self.to_net_id
      raise CornellNetid::InvalidNetidError if id.nil?
      self[self] = id unless self == id
    end

    # Returns true if the string is a valid net id
    def valid_net_id?
      self.match(CornellNetid::VALID_NET_ID) ? true : false
    end
  end
end

class String
  include CornellNetid::CoreExtensions::String
end

