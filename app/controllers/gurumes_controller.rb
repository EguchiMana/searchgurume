class GurumesController < ApplicationController
  before_action :authenticate_user!
 def index

  if params[:tag_ids]
    @gurumes = []
      params[:tag_ids].each do |key, value|      
        @gurumes += Tag.find_by(name: key).gurumes if value == "1"
      end
    @gurumes.uniq!
  end

  if params[:search] == nil
    @gurumes= Gurume.all
  elsif params[:search] == ''
    @gurumes= Gurume.all
  else
    @gurumes = Gurume.where("name LIKE ? ",'%' + params[:search] + '%')
  end
    @gurumes = @gurumes.page(params[:page]).per(6)
 end

def itirann
  if params[:search] == nil
    @gurumes= Gurume.all
  elsif params[:search] == ''
    @gurumes= Gurume.all
  else
    @gurumes = Gurume.where("name LIKE ? ",'%' + params[:search] + '%')
  end
    @gurumes = @gurumes.page(params[:page]).per(6)
end

      def new
        @gurume = Gurume.new
      end
    
      def create
        gurume = Gurume.new(gurume_params)

        gurume.user_id = current_user.id
        if gurume.save!
          redirect_to :action => "itirann"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @gurume = Gurume.find(params[:id])
      end

      def edit
        @gurume = Gurume.find(params[:id])
      end

      def update
        gurume = Gurume.find(params[:id])
        if gurume.update(gurume_params)
          redirect_to :action => "show", :id => gurume.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        gurume = Gurume.find(params[:id])
        gurume.destroy
        redirect_to action: :itirann
      end

      def insta
        @instas = Gurume.where(genre:"インスタ映え")
      end

      def girl
        @girls = Gurume.where(genre:"女子会")
      end

      def family
        @familys = Gurume.where(genre:"家族連れ")
      end

      def ryouzyuushi
        @ryouzyuushis = Gurume.where(genre:"量重視")
      end

      def date
        @dates = Gurume.where(food_genre:"デート")
      end

      def other
        @others = Gurume.where(genre:"その他")
      end

      private
      def gurume_params
        params.require(:gurume).permit(:name, :food_genre, :genre, :station, :about, :image, :star, tag_ids: [])
      end

    
end