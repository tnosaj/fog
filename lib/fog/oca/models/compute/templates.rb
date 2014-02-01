require 'fog/core/collection'
require 'fog/oca/models/compute/template'

module Fog
  module Compute
    class OCA
      class Templates < Fog::Collection
        
        model Fog::Compute::OCA::Template

        # * filterflag
        #    a, all       all the known VMTEMPLATEs
        #    m, mine      the VMTEMPLATE belonging to the user in ONE_AUTH
        #    g, group     'mine' plus the VMTEMPLATE belonging to the groups
        #                     the user is member of
        #    uid          VMTEMPLATE of the user identified by this uid
        #    user         VMTEMPLATE of the user identified by the username
        def all(filterflag = 'a')
          filterflag = connection.filterflag_to_i(filterflag)
          data = connection.list_templates(filterflag)
          load(data)
        end

        # * templateid
        #    OpenNebula VMTEMPLATE name or id
        def get(template_id)
          id = connection.rname_to_id(template_id, :template)
          all.select { |template| template.id == String(id) }.first
        end

      end
    end
  end
end
