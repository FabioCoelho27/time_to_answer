module UsersBackoffice::ProfileHelper
  def gender_select(user,currente_gender)
    user.user_profile.gender == currente_gender ? 'btn-primary' : 'btn-default'
  end
end

