class User < ActiveRecord::Base
  attr_accessible :name, :avatar

  has_attached_file :avatar,
    {storage: :s3,
     bucket: "rails-test-avatars",
     s3_permissions: :public_read,
     url: ':s3_domain_url',
     path: "/:class/avatars/:id_:basename.:style.:extension",
     s3_credentials: 
       {access_key_id: "amazon key", 
        secret_access_key: "amazon secret"}}
end
