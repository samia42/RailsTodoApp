class TodosController < ApplicationController

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
        @todo= Todo.find(params[:id])
    end

    def edit
        @todo= Todo.find(params[:id])
    end

    def update
        @todo= Todo.find(params[:id])
     
        if  @todo.update(todo_params)
            respond_to do |format|
            format.html { redirect_to @todo, notice: 'Todo was updated successfully ' }
            end
        else
           
            render :edit , status: :unprocessable_entity
        end
      
    end



    private
    def todo_params
        params.require(:todo).permit(:name,:description)
    end
    
end