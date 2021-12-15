#!/usr/bin/env sh

# if [ ! -f config/initializers/secret_token.rb ]; then
#     bundle exec rake generate_secret_token
# fi


if [ ! -s config/secrets.yml ]; then
	if [ ! -f config/initializers/secret_token.rb ]; then
		bundle exec rake generate_secret_token
	else 
		REDMINE_SECRET_KEY_BASE=$(tail -c 83 config/initializers/secret_token.rb | tr -d "'")
		if [ -n "$REDMINE_SECRET_KEY_BASE" ]; then
			cat > 'config/secrets.yml' <<-YML
				production:
					secret_key_base: "$REDMINE_SECRET_KEY_BASE"
			YML
		fi
	fi
fi
exec "$@"