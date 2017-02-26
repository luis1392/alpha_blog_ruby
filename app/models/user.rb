class User < ActiveRecord::Base
  has_many :articles #relacion en la cual un articulo pertenece a un usuario
  before_save { self.email = email.downcase } #antes de guadar el valor 
  validates :username, presence: true, uniqueness: { case_sensitive: false}, 
            length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i     #exprecion regular      
  validates :email, presence: true, length: { maximum: 105},
            uniqueness: { case_sensitive: false}, #valor unico 
            format: { with: VALID_EMAIL_REGEX } # validacion por explecion regular
  has_secure_password          
end