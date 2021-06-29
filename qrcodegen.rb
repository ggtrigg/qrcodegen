#!/usr/bin/ruby

require 'sinatra'
require 'rqrcode'
require 'base64'

ENV['PATH_INFO'] = ENV['REDIRECT_PATHINFO']

get '/' do
  erb :qrcodegen, :locals => { :qr_enc => nil}
end

post '/' do
  to_encode = params['to_encode']
  if to_encode
    qr_enc = Base64.encode64(RQRCode::QRCode.new(to_encode).as_png(size: 480).to_blob)
  end
  erb :qrcodegen, :locals => { :qr_enc => qr_enc}
end

# get '/*' do
#     erb :p404
# end
