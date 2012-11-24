class ApplicationController < ActionController::API
  # required for url helpers to work in Roar representer
  # must be used here, if used in specific controller, representers don't work (unless explicit extend is used)
  include ActionController::MimeResponds
end