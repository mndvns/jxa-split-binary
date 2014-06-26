PROJECT = jxa-split-binary

JXA_SRC = $(wildcard src/*.jxa)
JXA_OUT = $(patsubst src/%.jxa, ebin/%.beam, $(JXA_SRC))

TEST_SRC = $(wildcard test/*.jxa)
TEST_OUT = $(patsubst test/%.jxa, ebin/%.beam, $(TEST_SRC))

all: deps app bin/joxa $(JXA_OUT)

include erlang.mk

repl: all test
	@rlwrap ./bin/joxa -p ebin -p deps/*/ebin

bin/joxa:
	@mkdir -p bin
	@curl -L -o $@ https://gist.githubusercontent.com/camshaft/b5f1047d6749459e90a5/raw/joxa
	@chmod +x $@

ebin/%.beam: src/%.jxa
	@ERL_LIBS=deps ./bin/joxa -o ebin -c $<

compile-test: $(TEST_SRC)
	@ERL_LIBS=deps:.. ./bin/joxa -o ebin -c $<

test: $(JXA_OUT) compile-test

.PHONY: compile-test
