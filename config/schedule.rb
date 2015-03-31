
# Find some way to get the user. Devise?
user = current_user

every 1.hour do
    nanny = Nanny.new(user)
    nanny.have_you_been_bad
  end
end
