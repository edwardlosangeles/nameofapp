# 20171124 6.5: Payment Forms with Stripe

if Rails.env.production?
    Rails.configuration.stripe = {
      publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
      secret_key: ENV['STRIPE_SECRET_KEY']
    }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_cgQgYEHhhvjtV3fcw0zOlY6N',
    secret_key: 'sk_test_NuSKC5FYr1Qkl27z5klbEDPa'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]