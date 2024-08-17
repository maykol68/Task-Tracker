class TasksController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]

    def index 
        @tasks = Task.all
    end

    def show
    end

    def new 
        @task = Task.new
    end

    def edit 
    end

    def create 
        @task = Task.new

        if @task.save
            redirect_to task_url(@task), notice: "Task was successfully created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update 
        @task = Task.new

        if @task.update(task_params)
            redirect_to task_url(@task), notice: "Task was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy 
        @task.destroy!

        redirect_to task_url, notice: "Task was successfully destroyed"

    end

    private


    def set_task
        @task = Task.find(params[:id])
    end
     
    def task_params

    end
end
