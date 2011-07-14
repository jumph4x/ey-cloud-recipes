if node[:instance_role] == "solo" || node[:instance_role] == "app" || node[:instance_role] == "app_master"
  node[:applications].each do |app_name,data|
    
    template "/data/#{app_name}/shared/config/env.custom" do
      source "env.custom.erb"
      owner "deploy"
      group "deploy"
      mode 0644
      variables({
        :app_name => app_name,
      })
    end
    
    template "/data/#{app_name}/shared/config/custom_unicorn.rb" do
      source "custom_unicorn.rb.erb"
      owner "deploy"
      group "deploy"
      mode 0644
      variables({
        :app_name => app_name,
      })
    end
          
  end
end
