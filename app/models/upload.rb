class Upload < ApplicationRecord
  belongs_to :post

  has_attached_file :image,
                    #:convert_options => { :all => '-auto-orient' },
                    :styles => {
                        :medium => '300x300>',
                        :thumb => '100x100>',
                        :large => '500x500>'
                    }

  validates_attachment 	:image,
                        :presence => true,
                        :content_type => { :content_type => /\Aimage\/.*\Z/ },
                        :size => { :less_than => 5.megabyte }

end