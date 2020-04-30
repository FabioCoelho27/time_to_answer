class UsersBackoffice::WelcomeController < UsersBackofficeController
  def index
    @questions = Question.last_questions(params[:page])
  end
end
