class EmployeesController < ApplicationController

  get '' do
    @employees = Employee.all

    erb :'employees/index'
  end

  get '/new' do 
    @employee = Employee.new

    erb :'employees/new'
  end

  get '/:id' do
    @employee = Employee.find(params[:id])
    session[:id] = @employee.id
    @parties = @employee.parties

    erb :'employees/show'
  end

  post '' do 
    employee = Employee.create(params[:employee])

    redirect to "/#{employee.id}"
  end


end