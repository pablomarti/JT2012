class Admin < ActiveRecord::Base
  
  attr_accessor :password, :password_confirmation
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  before_save :encrypt_password
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.login(l_email, l_password)
    f_id = 0
    tmp_admin = Admin.find_by_email(l_email) rescue nil
    if !tmp_admin.nil?
      tmp_password_hash = BCrypt::Engine.hash_secret(l_password, tmp_admin.password_salt)
      if tmp_password_hash == tmp_admin.password_hash
        f_id = tmp_admin.id
      end
    end
    return f_id
  end

end
