all:
	obuild configure
	obuild build lib-ptmap

test:
	obuild configure
	obuild build exe-test
	./test

doc:
	mkdir -p doc
	ocamldoc -d doc/ -html ptmap.mli

install: all
	obuild install

uninstall:
	ocamlfind -remove ptmap

clean:
	obuild clean
	rm -rf doc

tests:
	qtest extract ptmap.ml -o unit_tests.ml
	obuild configure
	obuild build exe-unit_tests
	./unit_tests
	echo "(* DO NOT EDIT THIS FILE *)" > unit_tests.ml
