require 'fog/core'
require 'opennebula'
module Fog
  module OCA 

    extend Fog::Provider

    module Errors
      class ServiceError < Fog::Errors::Error; end
      class SecurityError < ServiceError; end
      class NotFound < ServiceError; end
    end

    service(:compute, 'oca/compute', 'Compute')

  end
end
