class UrlShortenerController < ApplicationController
  get "/" do
    unless params[:slug]
      response = { message: "the slug parameter is missing" }
      return response.to_json
    end
  end

  get "/:slug" do
    url_shortener = UrlShortener.find_by(slug: params[:slug])
    redirect to url_shortener[:real_url]
  end

  post "/" do
    url_shortener = UrlShortener.new(slug: params[:slug], real_url: params[:real_url])
    url_shortener.save

    if url_shortener.valid?
      url_shortener.to_json
    else
      response = { errors: url_shortener.errors.full_messages }
      response.to_json
    end
  end
end