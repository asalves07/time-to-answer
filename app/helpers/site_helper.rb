module SiteHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      "Ultimas questões cadastradas..."
    when 'questions'
      "Resultados para o termo \"#{params[:term]}\""
    when 'subject'
      "Resultados das questões sobre \"#{params[:subject]}\""
    end
  end
end
