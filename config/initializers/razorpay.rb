
# key_id = Rails.application.credentials.dig(:razorpay, :rzp_test_mP7dRlpG1jjUWO)
# secret_key = Rails.application.credentials.dig(:razorpay, :durOjibdMu5ppDdvA3WkVE73)
Razorpay.setup(ENV['RAZORPAY_KEY'], ENV['RAZORPAY_SECRET_KEY'])