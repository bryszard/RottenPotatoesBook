Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'b6tyAv4ft5VctnRMwyotfT4Q6', 'TCzNiZHomZz3xmHGFZOy23tfExvU13jV1ailO4GZb2wf4nUvAM'
  
  OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
end

