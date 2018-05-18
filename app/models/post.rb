class Post < ApplicationRecord
  belongs_to :board
  belongs_to :owner
  has_many :responses, dependent: :destroy
  has_one :upload, dependent: :destroy
  accepts_nested_attributes_for :upload

  def include_owner(owner)
    if owner
      self.owner_id = owner.id
    elsif(owner = Owner.find_by_code(self.owner_code))
      self.owner_id = owner.id
    # elsif(owner = Owner.find_by_email(self.owner_email))
    #   self.owner_id = owner.id
    else
      owner = Owner.create(:email => self.owner_email, :code => SecureRandom.urlsafe_base64(8, false))
      self.owner_id = owner.id
    end
    owner
  end
end