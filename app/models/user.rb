class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :posts
  has_many :comments
  has_many :likes
  belongs_to :role
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def jwt_payload
    super
  end

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role.name == 'Admin'
  end

  def member?
    role.name == 'Member'
  end
end
