module Fog
  module Compute
    class OCA

      class Mock
      end

      class Real

        def list_templates(filterflag)
          result = nil

          @pools[:template].info
          templates = @pools[:template].to_hash["VMTEMPLATE_POOL"]["VMTEMPLATE"]
          if templates.kind_of?(::Array) then
            result = templates 
          else
            result = [templates]
          end

          return result
        end

      end
      
    end
  end
end
