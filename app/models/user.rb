class User < ApplicationRecord
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  # callbacks
  before_save { email.downcase! }

  # modifiers
  has_secure_password

  # validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    role == "admin"
  end

  def guest?
    role == "guest"
  end
end
