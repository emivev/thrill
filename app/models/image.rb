class Image < ActiveRecord::Base
 belongs_to :trips
 has_attached_file :image, :styles => { :large => "640x480", :medium => "300x300>", :thumb => "100x100" },
    :storage => :s3,
    :bucket => 'Thrill',
    :s3_credentials => {
      :access_key_id => 'AKIAJNS6I4ZOXOZYSSLA',
      :secret_access_key => '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'
    }
  
  
end
