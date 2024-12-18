Rails.application.routes.draw do
  # get '/students/findStudent', to: 'students#find_student', as: 'get_score_students'
  get '/getScore', to: 'students#FindBySBD'  
  get '/dashboard', to: 'students#Top10GroupA'
  get '/report', to: 'students#StatisticsScore'

  root 'students#find_student'
end