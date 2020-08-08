class Site::SearchController < SiteController
  def questions
    @questions = Question.includes(:answers)
                         .where("lower(description) LIKE ?", "%#{params[:term].downcase}%")
                         .page(params[:page])
  end

  def questions
    @questions = Question. _search_(params[:page], params[:term])
  end

end
