class TasksController < ApplicationController

    def new
    end

    def show
        @hidden = params[:hidden]
        @tasks = Task.where(user: session[:user_id])
        render 'list'
    end

    def create
        task = Task.new(task_params.merge({ status:true, user: User.find(session[:user_id] )} )) 
        if task.save
            redirect_to '/tasks/show', notice: "You have successfully created a new task!"
        else 
            flash[:errors] = task.errors.full_messages
        end     

    end

  

    def finished  
        task = Task.find(params[:id])
        task.update(status:false)
        redirect_to '/tasks/show'
    end
    
    def unfinished 
        task = Task.find(params[:id])
        task.update(status:true)
        redirect_to '/tasks/show'
    end     

    private 
        def task_params
            params.require(:task).permit(:description, :date)
        end     
end
