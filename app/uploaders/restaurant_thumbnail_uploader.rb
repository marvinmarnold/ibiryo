class RestaurantThumbnailUploader < ImageUploader


  # Create different versions of your uploaded files:
  version :usable do
    process :resize_to_fit => [200, 100]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "restaurant_thumbnail" if original_filename
  end

end
