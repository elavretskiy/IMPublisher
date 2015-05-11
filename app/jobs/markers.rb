require 'open-uri'

Dashing.scheduler.every '1s' do
  markers = JSON.parse(open(ENV["DEFAULT_URL_OPTIONS_HOST"] + 'api/v1/markers').read)
  Dashing.send_event('markers', items: markers)
end
