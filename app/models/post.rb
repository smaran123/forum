class Post < ActiveRecord::Base
	has_many :comments, :dependent=>:destroy
	belongs_to :user
    apply_simple_captcha :message => "The secret Image and code were different", :add_to_base => true
end
