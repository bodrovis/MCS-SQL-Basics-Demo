class UsersController < ApplicationController
  def index
    language_id = params[:language_id]

    query = 'select * from users'
    query += " where language_id = #{language_id}" if language_id.present?
    query += ' order by surname asc, name asc;'

    @users = do_query query
    @languages = do_query 'select * from languages order by title asc;'
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
    @languages = do_query 'select * from languages order by title asc;'
  end

  def update
    id = params[:id]
    name = params[:name]
    surname = params[:surname]
    age = params[:age]
    city = params[:city]
    university = params[:university]
    language_id = params[:language_id]

    query = "update users set name = '#{name}', " +
      "surname = '#{surname}', age = #{age}, city = '#{city}', " +
      "university = '#{university}'"
    query += ", language_id = #{language_id}" unless language_id.blank?
    query += " where id = #{id};"

    do_query query

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