class DeepBlue::ItemsController < ApplicationController

  def list_permissions

    @item = Item.find(params[:id])

  end

  def update_permissions
    @item = Item.find(params[:id])
    @item.manage_users_string = params[:manage_users]
    @item.manage_groups_string = params[:manage_groups]
    @item.deposit_users_string = params[:deposit_users]
    @item.deposit_groups_string = params[:deposit_groups]
    @item.intended_reader_users_string = params[:intended_reader_users]
    @item.intended_reader_groups_string = params[:intended_reader_groups]

    @item.save
    redirect_to permissions_item_path(@item)
  end

end
