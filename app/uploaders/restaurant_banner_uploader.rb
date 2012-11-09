class RestaurantBannerUploader < ImageUploader

  version :usable do
    process :resize_to_fit => [900, 200]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "restaurant_banner" if original_filename
  end

end
