class DeepBlue::CollectionsController < ApplicationController
  def list_permissions

    @collection = Collection.find(params[:id])

  end

  def update_permissions
    @collection = Collection.find(params[:id])
    @collection.manage_users_string = params[:manage_users]
    @collection.manage_groups_string = params[:manage_groups]
    @collection.deposit_users_string = params[:deposit_users]
    @collection.deposit_groups_string = params[:deposit_groups]
    @collection.intended_reader_users_string = params[:intended_reader_users]
    @collection.intended_reader_groups_string = params[:intended_reader_groups]

    @collection.save
    redirect_to permissions_collection_path(@collection)
  end
end
