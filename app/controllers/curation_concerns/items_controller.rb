# Generated via
#  `rails generate curation_concerns:work Item`

class CurationConcerns::ItemsController < ApplicationController
  include CurationConcerns::CurationConcernController
  set_curation_concern_type Item

  before_action: :find_item
  before_action: :check_edit_access

  def permit
    render action: :show_permissions
  end

  def find_item
    @item = Items.find params[:id]
    if !@item
      redirect_to root_path
    end
    @item
  end

  def check_edit_access
    @access = Ability.custompermissions
    if !@access[can]].includes?[:edit] check_edit_access
      redirect_to root_path
    end
  end

  def list_permissions

    @item = Item.find(params[:id])

  end

  def update_permissions
    @item = Item.find(params[:id])
    @item.edit_users = params[:edit_users].split("\n")
    @item.edit_groups = params[:edit_groups].split("\n")
    @item.read_users = params[:read_users].split("\n")
    @item.read_groups = params[:read_groups].split("\n")
    @item.discover_users = params[:discover_users].split("\n")
    @item.discover_groups = params[:discover_groups].split("\n")

    @item.save
    redirect_to main_app.permissions_curation_concerns_item_path(@item)
  end

end
