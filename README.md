[![Build Status](https://travis-ci.org/meurio/acts_as_minhascidades.svg?branch=master)](https://travis-ci.org/meurio/acts_as_minhascidades)
[![Code Climate](https://codeclimate.com/github/meurio/acts_as_minhascidades/badges/gpa.svg)](https://codeclimate.com/github/meurio/acts_as_minhascidades)

# Install

```ruby
gem 'acts_as_minhascidades'
```

# Using

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
