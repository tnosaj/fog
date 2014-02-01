require 'fog/oca'

module Fog
  module Compute
    class OCA
      class Real
        def filterflag_to_i(flag)
          result = nil
          
          case flag
          when 'a', 'all'
            result = OpenNebula::Pool::INFO_ALL
          when 'm', 'mine'
            result = OpenNebula::Pool::INFO_MINE
          when 'g', 'group'
            result = OpenNebula::Pool::INFO_GROUP
          else
            if flag.match(/^[0123456789]+$/)
              result = flag.to_i
            else
              result = rname_to_id(flag, :user)
            end
          end

          return result
        end

        def rname_to_id(name, pool)
          result = nil
          
          if name.match(/^[0123456789]+$/)
            result = name.to_i
          else
            @pools[pool].info
            result = name_to_id(name, pool)
          end

          return result
        end

        def name_to_id(name, pool)
          result = nil
          
          objects = @pools[pool].select { |object| object.name == name }
          result = objects.first.id if objects.length > 0
          
          return result
        end
      end
    end
  end
end
