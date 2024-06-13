class HotspringsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def top
    end
    def index
      if params[:search] == nil
        @hotsprings= Hotspring.all
      elsif params[:search] == ''
        @hotsprings= Hotspring.all
      else
        @hotsprings = Hotspring.where("body LIKE ? ",'%' + params[:search] + '%')
    end
  end
    def new
        @hotspring = Hotspring.new
      end
    
      def create
        hotspring = Hotspring.new(hotspring_params)
        hotspring.user_id = current_user.id
        if hotspring.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @hotspring = Hotspring.find(params[:id])
        @comments = @hotspring.comments
        @comment = Comment.new
      end

      def edit
        @hotspring = Hotspring.find(params[:id])
      end
      def update
        hotspring = Hotspring.find(params[:id])
        if hotspring.update(hotspring_params)
          redirect_to :action => "show", :id => hotspring.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        hotspring = Hotspring.find(params[:id])
        hotspring.destroy
        redirect_to action: :index
      end

      private
      def hotspring_params
        params.require(:hotspring).permit(:name, :fee, :point, :spot, :service, :image_top , images: [])
      end
    end
