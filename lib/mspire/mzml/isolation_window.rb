require 'mspire/cv/paramable'

module Mspire
  class Mzml

    # MUST supply a *child* term of MS:1000792 (isolation window attribute) one or more times
    #
    #     e.g.: MS:1000827 (isolation window target m/z)
    #     e.g.: MS:1000828 (isolation window lower offset)
    #     e.g.: MS:1000829 (isolation window upper offset)
    #
    # MUST supply a *child* term of MS:1000792 (isolation window attribute) one or more times
    #
    #     e.g.: MS:1000827 (isolation window target m/z)
    #     e.g.: MS:1000828 (isolation window lower offset)
    #     e.g.: MS:1000829 (isolation window upper offset)
    class IsolationWindow
      include Mspire::CV::Paramable
      def self.from_xml(xml)
        obj = self.new
        [:cvParam, :userParam].each {|v| obj.describe! xml.xpath("./#{v}") }
        obj
      end
    end
  end
end
