require 'goliath'
require 'redis'

class Subscribe < Goliath::API
  def response(env)
    EM.synchrony do
      @redis = Redis.new(Options::redis)
        channel = env["REQUEST_PATH"].sub(/^\/subscribe\//, '')

        # We pass the subscribe method a block which describes what to
        # do when we receive an event.
        # This block writes the message formatted as a server sent event
        # to the HTTP stream.
        @redis.subscribe(channel) do |on|
          on.message do |channel, message|
            @message = message
            env.stream_send(payload)
          end
        end
      end
    end
    streaming_response(200, { 'Content-Type' => "text/event-stream" })
   end
  end

  def on_close(env)
    @redis.disconnect
  end

  def payload
    "id: #{Time.now}\n" +
    "data: #{@message}" +
    "\r\n\n"
  end
 end
end
