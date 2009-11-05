module CornellNetid::CoreExtensions
  module String
    # Return an array of net_id strings from an input string
    def to_net_ids
      ids = self.split(/[\,\;\\\/\s]+/)
      ids.map! { |part| part.to_net_id }
      ids.reject! { |part| part.nil? }
      ids.uniq
    end

    def to_net_id
      self[CornellNetid::VALID_NET_ID_WITH_EMAIL,1]
    end

    def to_net_id!
      return true if self.valid_net_id?
      self.strip!
      begin
        self[CornellNetid::VALID_NET_ID_WITH_EMAIL,2] = ''
      rescue IndexError
        raise CornellNetid::InvalidNetidError unless self.valid_net_id?
      end
      true
    end

    def valid_net_id?
      self.match(CornellNetid::VALID_NET_ID) ? true : false
    end
  end
end

class String
  include CornellNetid::CoreExtensions::String
end
