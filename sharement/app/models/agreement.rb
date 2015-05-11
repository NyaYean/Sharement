class Agreement < ActiveRecord::Base
	has_and_belongs_to_many :users

	def add_agreement(agreement)
		self.agreements.push(agreement) unless self.agreement.include? agreement
	end

	def edit_agreement(agreement)
		self.agreements.update(agreement)
	end

	def remove_agreement(agreement)
		self.agreements.destroy(agreement) if self.agreements.include? agreement
	end
end