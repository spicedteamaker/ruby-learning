class Inventory

	def initialize
		@inventory = []

	end

	def loot_item(item)
		@inventory.push(item)
	end

	def drop_item(item)
		@inventory.delete(item)
	end

	def get_item_info(item)
		return item.get_item_info
	end

	def show_inventory
		inventory_string = ""
		@inventory.each do |item|
			inventory_string += "#{item.get_item_info}\n"
		end
		return inventory_string
	end

end
