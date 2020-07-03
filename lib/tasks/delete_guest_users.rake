desc 'Delete guest users'
task :delete_guest_users do
    guest_users = User.where("username like ?", "%Guest%")

        guest_users.each do |guest| 
            guest.stores.each do |store|
                store.items.delete_all
            end
        end

        guest_users.each do |guest| 
            guest.stores.delete_all
        end

        guest_users.delete_all
end