class UsersController < ApplicationController
  def index
    @users = do_query 'select * from users order by surname desc, name desc;'
  end

  def create
    name = params[:name]
    surname = params[:surname]
    age = params[:age]
    city = params[:city]
    do_query "insert into users (name, surname, age, city) values ('#{name}', '#{surname}', #{age}, '#{city}');"
    flash[:success] = 'Пользователь добавлен!'
    redirect_to users_path
  end

  def edit
    id = params[:id]
    @user = do_query("select * from users where id = #{id};")&.first
  end

  def update

  end

  def destroy

  end
end