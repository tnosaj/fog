require 'fog/core/model'

module Fog
  module Compute
    class OCA

      class Template < Fog::Model

        identity :id,               :aliases => 'ID'

        attribute :uid,             :aliases => 'UID'
        attribute :gid,             :aliases => 'GID'
        attribute :uname,           :aliases => 'UNAME'
        attribute :gname,           :aliases => 'GNAME'
        attribute :name,            :aliases => 'NAME'
        attribute :permissions,     :aliases => 'PERMISSIONS'
        attribute :regtime,         :aliases => 'REGTIME'
        attribute :template,        :aliases => 'TEMPLATE'

        def instantiate(name = '')
          connection.instantiate_template(id, name)
        end

      end

    end
  end
end
