class DishesController < ApplicationController
  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(:distinct => true).includes(:venue, :bestdish, :cuisine).page(params[:page]).per(10)

    render("dishes/index.html.erb")
  end

  def show
    @dish = Dish.find(params[:id])

    render("dishes/show.html.erb")
  end

  def new
    @dish = Dish.new

    render("dishes/new.html.erb")
  end

  def create
    @dish = Dish.new

    @dish.dish_name = params[:dish_name]
    @dish.cuisine_id = params[:cuisine_id]
    @dish.bookmark_id = params[:bookmark_id]
    @dish.venue_id = params[:venue_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/new", "/create_dish"
        redirect_to("/dishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish created successfully.")
      end
    else
      render("dishes/new.html.erb")
    end
  end

  def edit
    @dish = Dish.find(params[:id])

    render("dishes/edit.html.erb")
  end

  def update
    @dish = Dish.find(params[:id])

    @dish.dish_name = params[:dish_name]
    @dish.cuisine_id = params[:cuisine_id]
    @dish.bookmark_id = params[:bookmark_id]
    @dish.venue_id = params[:venue_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/#{@dish.id}/edit", "/update_dish"
        redirect_to("/dishes/#{@dish.id}", :notice => "Dish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish updated successfully.")
      end
    else
      render("dishes/edit.html.erb")
    end
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy

    if URI(request.referer).path == "/dishes/#{@dish.id}"
      redirect_to("/", :notice => "Dish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dish deleted.")
    end
  end
end
