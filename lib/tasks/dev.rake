namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando DB....","Concluído)") { %x(rails db:drop)}
      show_spinner("Criando DB","Concluído)") { %x(rails db:create)}
      show_spinner("Migrando DB","Concluído)") { %x(rails db:migrate)}
      show_spinner("Cadastrando o Administrador padrão...") { %x(rails dev:add_defaut_admin)}
      show_spinner("Cadastrando o Usuário padrão...") { %x(rails dev:add_defaut_user)}
      #%x(rails dev:add_mining_types)
      #%x(rails dev:add_coins)
    else
      puts "Você está em abmbiente de desenvolvimento!"
    end
end

desc "Adiciona o administrador padrão"
task add_defaut_admin: :environment do
  Admin.create!(
    email: 'admin@admin.com',
    password: DEFAULT_PASSWORD,
    password_confirmation: DEFAULT_PASSWORD
  )
end

desc "Adiciona o usuário padrão"
task add_defaut_user: :environment do
  User.create!(
    email: 'user@user.com',
    password: DEFAULT_PASSWORD,
    password_confirmation:DEFAULT_PASSWORD
  )
end

private

  def show_spinner(msg_start, msg_end = "concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end}")
  end
end