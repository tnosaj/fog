module Fog
  module Compute
    class OCA

      class Mock
      end

      class Real

        def list_virtual_machines(filterflag)
          result = nil

          case filterflag
          when OpenNebula::Pool::INFO_ALL
            @pools[:vm].info_all
          when OpenNebula::Pool::INFO_GROUP
            @pools[:vm].info_group
          when OpenNebula::Pool::INFO_MINE
            @pools[:vm].info_mine
          else
            @pools[:vm].info(filterflag)
          end
          vms = @pools[:vm].to_hash["VM_POOL"]["VM"]
          if vms.kind_of?(::Array) then
            result = vms 
          else
            result = [vms]
          end

          return result
        end

      end
      
    end
  end
end
