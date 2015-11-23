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
end