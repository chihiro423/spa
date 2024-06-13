class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hotsprings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_hotsprings, through: :likes, source: :hotspring
  has_many :comments, dependent: :destroy
  def already_liked?(hotspring)
    self.likes.exists?(hotspring_id: hotspring.id)
  end
end
