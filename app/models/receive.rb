class Receive < Goliath::API
  @@redis = Redis.new(Options::redis)
  def response(env)
    channel = env["REQUEST_PATH"][1..-1]
    message = Rack::Utils.escape_html(params["message"])
    @@redis.publish(channel, {sender: params["sender"], message: message}.to_json)
    [ 200, { }, [ ] ]
  end
end
