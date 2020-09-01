module ApplicationHelper

  def cart_index?
    controller_name == 'orders' && action_name == 'confirmation' || controller_name == 'orders' && action_name == 'show'
  end

  def menu_index?
    controller_name == 'dishes' && action_name == 'show' || controller_name == 'orders' && action_name == 'new'
  end

  def menu_edit?
    controller_name == 'dishes' && action_name == 'show' || controller_name == 'orders' && action_name == 'edit'
  end
end
