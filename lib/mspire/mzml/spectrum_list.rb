require 'delegate'
#require 'mspire/mzml/spectrum'

module Mspire
  class Mzml
    class SpectrumList < SimpleDelegator

      # a DataProcessing object
      attr_reader :default_data_processing

      # arg may be an array of spectrum objects or an IOIndex style object
      def initialize(default_data_processing, arg)
        @default_data_processing = default_data_processing
        __setobj__(arg)
      end

      def to_xml(builder)
        builder.spectrumList(count: self.size, defaultDataProcessingRef: @default_data_processing.id) do |spl_n|
          self.each_with_index do |spectrum,i|
            spectrum.index = i unless spectrum.index
            spectrum.to_xml(spl_n)
          end
        end
        builder
      end

    end
  end
end
