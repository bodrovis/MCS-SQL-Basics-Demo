class ApplicationController < ActionController::Base
  def do_query(query)
    ActiveRecord::Base.connection.exec_query query
  end
end
