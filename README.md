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
```

# License

This project rocks and uses MIT-LICENSE.
