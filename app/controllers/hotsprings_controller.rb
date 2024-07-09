class HotspringsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def top
    end
    def index
      if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @hotsprings = Hotspring.joins(:user).where("email LIKE ? OR name LIKE ? OR point LIKE ? OR spot LIKE ? OR fee LIKE ? OR service LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        @hotsprings = Hotspring.all
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
          redirect_to :action => "index"
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
        params.require(:hotspring).permit(:name, :fee, :point, :spot, :service, :image_top , :images, tag_ids: [])
      end
    end
