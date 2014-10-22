[![Build Status](https://travis-ci.org/meurio/acts_as_minhascidades.svg?branch=master)](https://travis-ci.org/meurio/acts_as_minhascidades)
[![Coverage Status](https://coveralls.io/repos/meurio/acts_as_minhascidades/badge.png?branch=master)](https://coveralls.io/r/meurio/acts_as_minhascidades?branch=master)
[![Code Climate](https://codeclimate.com/github/meurio/acts_as_minhascidades/badges/gpa.svg)](https://codeclimate.com/github/meurio/acts_as_minhascidades)

# Install

```ruby
gem 'acts_as_minhascidades'
```

# Using

## Configuration

Create an initializer ```config/initializers/acts_as_minhascidades.rb``` and paste the following configuration block:

```ruby
ActsAsMinhascidades.config do |config|
  config.default_avatar_url = "http://i.imgur.com/Yg5ngED.jpg"
  config.api_mode = true
  config.api_site = "http://myaccounts.herokuapp.com/api/v1"
  config.api_token = "my-accounts-secret-token"
end
```

## ActsAsMinhascidadesUser

```ruby
# app/model/user.rb
class User < ActiveRecord::Base
  acts_as_minhascidades_user
end

# Now you can use the 'name' method
user = User.new first_name: "Lionel", last_name: "Messi"
user.name # "Lionel Messi"

# And the 'avatar_url' as well
user.avatar_url
```

# License

This project rocks and uses MIT-LICENSE.
