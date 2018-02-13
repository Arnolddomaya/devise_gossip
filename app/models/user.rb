class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :sign_up_code

  has_many :gossips, dependent: :destroy
  validates :anonymous_username , presence: true
  validates :sign_up_code,
                    on: :create,
                    presence: true,
                    inclusion: { in: ["GOSSIP_2017"] }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
