require 'reloader/sse'

class BrowserController < ApplicationController

  include ActionController::Live

  def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    begin
      List.on_change do |data|
        byebug

        sse.write({name: 'John'}, event: 'refresh')
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end
end
