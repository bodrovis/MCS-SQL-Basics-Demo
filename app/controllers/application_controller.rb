class ApplicationController < ActionController::Base
  rescue_from Mysql2::Error, with: :sql_error

  def do_query(query)
    ActiveRecord::Base.connection.exec_query query
  end

  private

  def sql_error(e)
    flash[:warning] = e.message
    redirect_back fallback_location: root_path
  end
end
