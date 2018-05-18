class Board < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :board_categories
  has_many :categories, through: :board_categories

  require 'net/http'

  API_KEY = 'AIzaSyAi9xRPLwLVJ7cxfVtMoXO3-zNA13QNavY'

  def get_google_map_link
    "https://www.google.com/maps/embed/v1/place?key=#{API_KEY}&q=#{self.address}"
  end

  def set_location_id
    # q = '5051 whitsett ave valley village'
    uri = URI.parse "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.address}&key=#{API_KEY}"
    http = Net::HTTP.new uri.host, uri.port
    http.use_ssl = true
    request = Net::HTTP::Get.new uri.request_uri
    # request.body = body.to_json

    response = JSON.parse http.request(request).body
    unless response['error_message']
      self.address = response['results'][0]['formatted_address']
      self.location_id = response['results'][0]['id']
    end

  end

end