class Owner < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :boards
  has_many :responses, dependent: :destroy
  has_many :owners

  def name_or_guest
    if name && !name.empty?
      name
    else
      'guest'
    end
  end

  def self.email_admins(url)
    subject = "please verify a new post"
    message = "A new post has been made on cork as an admin your duty is to make sure it adheres to our post policy #{url}"
    where(:sa => true).each do |sa|
      ApplicationMailer.response_message(sa.email,subject,message).deliver_later
    end
  end
end