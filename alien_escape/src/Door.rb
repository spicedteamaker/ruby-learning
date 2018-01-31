class Door

	def initialize(leads_to, is_locked = false, item_required)
		@leads_to = leads_to
		@is_locked = is_locked
		@item_required = item_required
	end

	def unlock
		@is_locked = false
	end

	def lock
		@is_locked = true
	end

	def get_leads_to
		return @leads_to
	end

	def is_locked?
		return @is_locked
	end

end
