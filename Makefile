.PHONY: demo test
.SILENT: demo test

demo:
	echo "Starting demo..."
	bundle install
	bundle exec ruby tic_tac_toe.rb

test:
	echo "Running tests..."
	bundle install
	bundle exec rspec spec
