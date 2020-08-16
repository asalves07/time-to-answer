class AdminsBackoffice::WelcomeController < AdminsBackofficeController
  def index
    @total_users = AdminStatistic.total_users
    @total_questions = AdminStatistic.total_questions
    @total_admins = AdminStatistic.total_admins
  end
end
