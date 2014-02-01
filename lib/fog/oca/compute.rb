require 'fog/oca'
require 'fog/compute'

module Fog
  module Compute
    class OCA < Fog::Service

      requires :oca_one_auth, :oca_xml_rpc_endpoint

      model_path 'fog/oca/models/compute'
      model :template
      collection :templates
      model :virtual_machine
      collection :virtual_machines

      request_path 'fog/oca/requests/compute'
      request :list_templates
      request :instantiate_template
      request :list_virtual_machines
      request :delete_virtual_machine

      class Real
        
        require 'fog/oca/compute_helpers'

        def initialize(options={})
          @xml_rpc_endpoint = options[:oca_xml_rpc_endpoint]
          @one_auth = options[:oca_one_auth]

          @client = OpenNebula::Client.new(@one_auth, @xml_rpc_endpoint)
          @pools = Hash.new
          @pools[:template] = OpenNebula::TemplatePool.new(@client)
          @pools[:host] = OpenNebula::HostPool.new(@client)
          @pools[:group] = OpenNebula::GroupPool.new(@client)
          @pools[:user] = OpenNebula::UserPool.new(@client)
          @pools[:vm] = OpenNebula::VirtualMachinePool.new(@client)
        end

      end

    end
  end
end
