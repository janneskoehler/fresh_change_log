class InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  generate('scaffold', 'ChangeLog::Protocol action:string model:string internal_id:integer')
  generate('model', 'ChangeLog::Detail protocol:references attribute_name:string old_value:string')
end
