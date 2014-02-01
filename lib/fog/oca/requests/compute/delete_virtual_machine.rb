module Fog
  module Compute
    class OCA

      class Mock
      end

      class Real

        def delete_virtual_machine(id)
          @client.call(OpenNebula::VirtualMachine::VM_METHODS[:action], 'finalize', id.to_i)
        end

      end
      
    end
  end
end
