require 'fog/core/collection'
require 'fog/oca/models/compute/virtual_machine'

module Fog
  module Compute
    class OCA
      class VirtualMachines < Fog::Collection
        
        model Fog::Compute::OCA::VirtualMachine

        # * filterflag
        #    a, all       all the known VMTEMPLATEs
        #    m, mine      the VMTEMPLATE belonging to the user in ONE_AUTH
        #    g, group     'mine' plus the VMTEMPLATE belonging to the groups
        #                     the user is member of
        #    uid          VMTEMPLATE of the user identified by this uid
        #    user         VMTEMPLATE of the user identified by the username
        def all(filterflag = 'a')
          filterflag = connection.filterflag_to_i(filterflag)
          data = connection.list_virtual_machines(filterflag)
          load(data)
        end

        # * vmid
        #    OpenNebula VM name or id
        def get(vm_id)
          id = connection.rname_to_id(vm_id, :vm)
          all.select { |vm| vm.id == String(id) }.first
        end

      end
    end
  end
end
