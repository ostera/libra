.PHONY: test clean install

PACKAGE = Libra.ipkg
IDRIS = idris

all: install

repl:
	$(IDRIS) -p lightyear Libra.idr

install: build
	$(IDRIS) --install $(PACKAGE)

test: build
	$(IDRIS) --testpkg $(PACKAGE)

build: Libra/*.idr Test/*.idr TAP.idr
	$(IDRIS) --build $(PACKAGE)

clean:
	$(IDRIS) --clean $(PACKAGE)
