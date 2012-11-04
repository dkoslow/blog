CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJACUC52KL5LEONTQ',
    :aws_secret_access_key  => ENV['S3_SECRET_ACCESS_KEY']
  }

  config.fog_directory  = "dkoslow-blog-#{Rails.env}"
  config.fog_public     = true
end