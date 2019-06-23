.PHONY: run
run:
	brew services start mysql@5.6
	bin/rails s

.PHONY: stop
stop:
	brew services stop mysql@5.6