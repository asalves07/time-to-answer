class Site::WelcomeController < SiteController
  def index
    @questions = Question.includes(:answers)
                         .order(:subject_id)
                         .page(params[:page])
  end
end
