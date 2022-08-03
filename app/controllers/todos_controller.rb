class TodosController < ApplicationController

    def new
        @todo = Todo.new
    end
    def create
      @todo = Todo.new(todo_params)
      respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        # format.json { render :show, status: :created, location: @todo }
        # render :action => 'show', :id => @todo.id
        # redirect_to action: "show", id: @todo
      else
          render :new, status: :unprocessable_entity
      end
    end
    end

    def show
        @todo= Todo.find(params[:id])
    end

    private
    def todo_params
        params.require(:todo).permit(:name,:description)
    end
    
end