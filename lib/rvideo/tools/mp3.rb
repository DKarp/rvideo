module RVideo
  module Tools
    class Mp3
      include AbstractTool::InstanceMethods
      attr_reader :raw_metadata
      
      def tool_command
        'MP3'
      end
      
      private
      
      def parse_result(result)        
        if m = /terminate called throwing an exceptionAbort/.match(result)
          raise TranscoderError::UnexpectedResult, "Undefined error"
        end

        @raw_metadata = result.empty? ? "No Results" : result
        return true
      end
      
    end
  end
end
