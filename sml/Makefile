.PHONY: all
all: DAY

.PHONY: run
run: DAY
	./DAY

%: %.sml
	mosmlc $< -o $@

.PHONY: clean
clean:
	rm -rf *.ui *.uo DAY
