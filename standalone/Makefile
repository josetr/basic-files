.PHONY: list clean

FILES := $(shell find . -maxdepth 1 -type f | sort)

list:
	@printf '%s\n' $(FILES)

clean:
	rm -rf build dist
