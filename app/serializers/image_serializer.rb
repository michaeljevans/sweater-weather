class ImageSerializer
  def self.serialize_me_captain(image)
    {
      data: {
        id: nil,
        type: 'image',
        image: {
          location: image.location,
          image_url: image.image_url,
          credit: image.credit.as_json
        }
      }
    }
  end
end
