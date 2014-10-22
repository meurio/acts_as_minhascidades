module ActsAsMinhascidades
  mattr_accessor :default_avatar_url, :api_mode, :api_site, :api_token

  def self.config(&block)
    yield(self)
  end

  def self.api_mode
    @@api_mode || false
  end

  def self.default_avatar_url
    @@default_avatar_url || "http://i.imgur.com/7XqAySb.png"
  end
end
