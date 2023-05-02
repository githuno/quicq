require 'base64'
require 'json'
require 'net/https'
require 'rmagick'

module Vision
  class << self
    def get_labels(image_file)
      url = URI.parse(ENV['PREDICT_URI'])
      img = Magick::Image.read(image_file).first
      # img.resize_to_fit!(640, 640)
      tmp_file = Tempfile.new(['image', '.jpg'])
      img.write(tmp_file.path)
    
      req = Net::HTTP::Post.new(url.path)
      req.set_form([['file', tmp_file]], 'multipart/form-data')
    
      res = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
        http.request(req)
      end
      return JSON.parse(res.body)['prediction'].take(3).map { |r| r["labels"] }
    ensure
      tmp_file.close
      tmp_file.unlink
    end

    # -----------------------------------------------------------------
    # def get_labels(image_file)
    #   # APIのURL作成
    #   api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_API_KEY']}"

    #   # 画像をbase64にエンコード
    #   base64_image = Base64.strict_encode64(File.read(image_file))

    #   # APIリクエスト用のJSONパラメータ
    #   params = {
    #     requests: [{
    #       image: {
    #         content: base64_image
    #       },
    #       features: [
    #         {
    #           type: 'LABEL_DETECTION'
    #         }
    #       ]
    #     }]
    #   }.to_json

    #   # Google Cloud Vision APIにリクエスト
    #   uri = URI.parse(api_url)
    #   https = Net::HTTP.new(uri.host, uri.port)
    #   https.use_ssl = true
    #   request = Net::HTTP::Post.new(uri.request_uri)
    #   request['Content-Type'] = 'application/json'
    #   response = https.request(request, params)

    #   # APIレスポンス出力
    #   # res =  #Deeplとつなげるとエラーになる
    #   JSON.parse(response.body)['responses'][0]['labelAnnotations'].pluck('description').take(3)

    #   # # カタカナ出力
    #   # Deepl.kana(res) #Deeplとつなげるとエラーになる

    # end
  end
end