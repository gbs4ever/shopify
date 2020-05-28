class ApiController < ApplicationController
skip_before_action :verify_authenticity_token
 SHARED_SECRET = '037f2a4d0da5fdc52386eb9aa2c5d1ef3384d2a2dab503033cded56e0ddcf3ef'
    def welcome
        render  :json => {status: "loaded shopify app dev"}
    end
    def return
       # verification for hook finished 
        request.body.rewind
        data = request.body.read
        if data != ""
        
        verified = verify_webhook(data,request.env["HTTP_X_SHOPIFY_HMAC_SHA256"])
        else 
            binding.pry
        end
        puts "Webhook verified: #{verified}"
        

    end
      private
      def verify_webhook(data, hmac_header)
      calculated_hmac = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', SHARED_SECRET, data))
       ActiveSupport::SecurityUtils.secure_compare(calculated_hmac, hmac_header)
    
  end
end  