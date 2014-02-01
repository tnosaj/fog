require 'fog/oca'

module Fog
  module Compute
    class OCA

      class Mock
      end

      class Real

        def instantiate_template(id, name = '')
          @client.call(OpenNebula::Template::TEMPLATE_METHODS[:instantiate], id.to_i, name)
        end

      end
      
    end
  end
end
