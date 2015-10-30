# Load the Rails application.
require File.expand_path('../application', __FILE__)

if File.exists?('/l/local/fits/fits-0.8.4/fits.sh')
  Hydra::Derivatives.fits_path = '/l/local/fits/fits-0.8.4/fits.sh'
elsif File.exists?('/usr/local/brew/bin/fits.sh')
  Hydra::Derivatives.fits_path = '/usr/local/brew/bin/fits.sh'
end

# Initialize the Rails application.
ENV['RAILS_RELATIVE_URL_ROOT'] = '/demo01'
Rails.application.initialize!

