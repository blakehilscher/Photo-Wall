module ApplicationHelper
  
  def rand_seed
    params[:seed] || rand(10)
  end
  
end
