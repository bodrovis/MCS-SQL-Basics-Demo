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
    id = params[:id]
    name = params[:name]
    surname = params[:surname]
    age = params[:age]
    city = params[:city]

    do_query "update users set name = '#{name}', " +
               "surname = '#{surname}', age = #{age}, city = '#{city}' " +
               "where id = #{id};"

    flash[:success] = 'Пользователь обновлён!'
    redirect_to users_path
  end

  def destroy
    id = params[:id]

    do_query "delete from users where id = #{id};"

    flash[:success] = 'Пользователь удалён!'
    redirect_to users_path
  end
end