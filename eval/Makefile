LANG1=kum
STAMP=$(shell date)
DATE=$(shell date +%Y-%m-%d.%H:%M)
LOG=history.log
SRC=src.500.txt
REF=ref.500.txt
TST=tst.500.txt.$(DATE)
all:
	cat $(SRC) | lt-proc -w ../$(LANG1).automorf.bin > $(TST)
	echo -ne $(STAMP)"\t" >> $(LOG)
	python3 evaluate-morph.py $(TST) $(REF) 2>> $(LOG)
