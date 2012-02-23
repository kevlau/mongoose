
TESTS = $(shell find test/ -name '*.test.js')

test:
	@NODE_ENV=test ./support/expresso/bin/expresso \
		-I lib \
		-I support \
		-I support/should.js/lib \
		-I support/cli-table/lib \
		$(TESTFLAGS) \
		$(TESTS)

test-cov:
	@TESTFLAGS=--cov $(MAKE) test

docs: docs/api.html

docs/api.html: lib/*.js
	./node_modules/dox/bin/dox \
		--title Mongoose \
		--desc "Expressive MongoDB for Node.JS" \
		--ribbon "https://github.com/learnboost/mongoose" \
		--style mongoose \
		$(shell find lib/* -type f) > $@

docclean:
	rm -f docs/*.{1,html}

site:
	node website.js && node static.js


.PHONY: test test-cov docs docclean site
