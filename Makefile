.PHONY: ruby

ruby:
	@docker-compose -f ruby/docker-compose.yml run --rm exercises sh
