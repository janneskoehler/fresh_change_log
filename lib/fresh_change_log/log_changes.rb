module FreshChangeLog
  module LogChanges
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def log_changes(options = {})
        after_create :log_create
        after_update :log_update
        after_destroy :log_destroy
      end
    end
    
    protected
    
    def log_create
      log_change("create")
    end

    def log_update
      log_change("update")
    end

    def log_destroy
      log_change("destroy")
    end

    def log_change(action)
      change_log = ChangeLog.create(:action => action, 
                                    :model => self.class.model_name,
                                    :record_id => self.id)
      if action == "update"
        attrs = changed_attributes.delete_if { |k,v| ["updated_at", "created_at"].include?(k) }
      elsif action == "destroy"
        attrs = attributes.delete_if { |k,v| ["id", "updated_at", "created_at"].include?(k) }
                          .map { |k,v| [k.dup, v]  }
      else
        attrs = {}
      end
      attrs.each do |k,v|
        change_log.details.create(:attribute_name => k, 
                                  :old_value => v)
      end
    end
    
  end
end
ActiveRecord::Base.send :include, FreshChangeLog::LogChanges