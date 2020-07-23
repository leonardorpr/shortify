class UrlShortener
  include Mongoid::Document

  field :real_url, type: String
  field :slug, type: String

  validates_presence_of :real_url, :slug
end