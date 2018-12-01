class UserSerializer < ActiveModel::Serializer

  attributes :name, :email, :img_url
  has_many :items
  
end
