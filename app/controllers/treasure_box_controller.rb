class TreasureBoxController < ApplicationController
  def open
    user = User.find(@session["user_id"])
    treasure_box = TreasureBox.find(params[:treasure_box_id])
    item_group = treasure_box.item_group
    items = []

    item_group.item_group_lottery_machines.each do |machine|
      if rand < machine.weight
        item = machine.item_type.constantize.find(machine.item_id)
        received_item = user.received_items.create(
          item_type: machine.item_type,
          item_id: machine.item_id
        )
        items << { item_name: item.name, item_id: received_item.id }
      end
    end

    # If no items were selected, add a default item or retry logic
    if items.empty?
      machine = item_group.item_group_lottery_machines.sample
      item = machine.item_type.constantize.find(machine.item_id)
      received_item = user.received_items.create(
        item_type: machine.item_type,
        item_id: machine.item_id
      )
      items << { item_name: item.name, item_id: received_item.id }
    end

    render json: items
  end
end
