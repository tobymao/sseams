module Admin
  class ItemsController < AdminController
    before_action :set_item, only: [:show, :update, :destroy]

    # GET /admin/items
    def index
      @items = Item.all
    end

    # GET /admin/items/1
    def show
    end

    # GET /admin/items/new
    def new
      @item = Item.new
      render 'show'
    end

    # POST /admin/items
    def create
      @item = Item.new(item_params)

      if @item.save
        redirect_to [:admin, @item]
      else
        redirect_to new_admin_item_path, flash: { error: @item.errors.messages }
      end
    end

    # PATCH/PUT /admin/items/1
    def update
      if @item.update(item_params)
        redirect_to [:admin, @item]
      else
        redirect_to edit_admin_item_path, flash: { error: @item.errors.messages }
      end
    end

    # DELETE /admin/items/1
    def destroy
      @item.destroy
      redirect_to admin_item_path
    end

    private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :name,
        :description,
        :price,
        :image,
        variants_attributes: [:id, :kind, :value, :description, :_destroy],
      )
    end
  end
end
