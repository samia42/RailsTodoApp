class TodosController < ApplicationController
 before_action :set_todo, only: [:edit, :show, :destroy, :update]
    def new
        @todo = Todo.new
    end
    def create
      @todo = Todo.new(todo_params)
     
      if @todo.save
        respond_to do |format|
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        end
        # format.json { render :show, status: :created, location: @todo }
        # render :action => 'show', :id => @todo.id
        # redirect_to action: "show", id: @todo
      else
          render :new, status: :unprocessable_entity
      end
    
    end

    def show
    end

    def edit 
    end

    def update
        if  @todo.update(todo_params)
            respond_to do |format|
            format.html { redirect_to @todo, notice: 'Todo was updated successfully ' }
            end
        else
           
            render :edit , status: :unprocessable_entity
        end
      
    end

    def index
        @todos = Todo.all

    end

    def destroy
       
        @todo.destroy
        respond_to do |format|
            format.html { redirect_to @todo, notice: 'Todo was deleted successfully ' }
        end

    end


    private

    def set_todo
        @todo= Todo.find(params[:id])
    end
    def todo_params
        params.require(:todo).permit(:name,:description)
    end
    
end