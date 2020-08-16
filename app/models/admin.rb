class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      

  # Callbacks
  after_create :set_statistic

  #kaminari
  paginates_per 5

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_admins])
  end

end
