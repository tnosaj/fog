require 'fog/core/model'

module Fog
  module Compute
    class OCA

      class VirtualMachine < Fog::Model
        identity :id,               :aliases => 'ID'

        attribute :uid,             :aliases => 'UID'
        attribute :gid,             :aliases => 'GID'
        attribute :uname,           :aliases => 'UNAME'
        attribute :gname,           :aliases => 'GNAME'
        attribute :name,            :aliases => 'NAME'
        attribute :permissions,     :aliases => 'PERMISSIONS'
        attribute :last_poll,       :aliases => 'LAST_POLL'
        attribute :state,           :aliases => 'STATE'
        attribute :lcm_state,       :aliases => 'LCM_STATE'
        attribute :stime,           :aliases => 'STIME'
        attribute :etime,           :aliases => 'ETIME'
        attribute :deploy_id,       :aliases => 'DEPLOY_ID'
        attribute :memory,          :aliases => 'MEMORY'
        attribute :cpu,             :aliases => 'CPU'
        attribute :net_tx,          :aliases => 'NET_TX'
        attribute :net_rx,          :aliases => 'NET_RX'
        attribute :template,        :aliases => 'TEMPLATE'
        attribute :history_records, :aliases => 'HISTORY_RECORDS'

        VM_STATE=%w{INIT PENDING HOLD ACTIVE STOPPED SUSPENDED DONE FAILED}

        LCM_STATE=%w{LCM_INIT PROLOG BOOT RUNNING MIGRATE SAVE_STOP SAVE_SUSPEND
            SAVE_MIGRATE PROLOG_MIGRATE PROLOG_RESUME EPILOG_STOP EPILOG
            SHUTDOWN CANCEL FAILURE CLEANUP UNKNOWN}

        SHORT_VM_STATES={
            "INIT"      => "init",
            "PENDING"   => "pend",
            "HOLD"      => "hold",
            "ACTIVE"    => "actv",
            "STOPPED"   => "stop",
            "SUSPENDED" => "susp",
            "DONE"      => "done",
            "FAILED"    => "fail"
        }

        SHORT_LCM_STATES={
            "PROLOG"        => "prol",
            "BOOT"          => "boot",
            "RUNNING"       => "runn",
            "MIGRATE"       => "migr",
            "SAVE_STOP"     => "save",
            "SAVE_SUSPEND"  => "save",
            "SAVE_MIGRATE"  => "save",
            "PROLOG_MIGRATE"=> "migr",
            "PROLOG_RESUME" => "prol",
            "EPILOG_STOP"   => "epil",
            "EPILOG"        => "epil",
            "SHUTDOWN"      => "shut",
            "CANCEL"        => "shut",
            "FAILURE"       => "fail",
            "CLEANUP"       => "clea",
            "UNKNOWN"       => "unkn"
        }

        MIGRATE_REASON=%w{NONE ERROR STOP_RESUME USER CANCEL}

        SHORT_MIGRATE_REASON={
            "NONE"          => "none",
            "ERROR"         => "erro",
            "STOP_RESUME"   => "stop",
            "USER"          => "user",
            "CANCEL"        => "canc"
        }      

        def finalize
          connection.delete_virtual_machine(id)
        end

        def ready?
          lcm_state == '3'
        end
      end
    end
  end
end
