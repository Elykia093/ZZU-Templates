RESUME_DIR = templates/resume
THESIS_DIR = templates/thesis
PYTHON ?= python

.PHONY: all resume thesis thesis-variants thesis-a3 word-check release-package check clean

all: resume thesis

check: word-check

resume:
	$(MAKE) -C $(RESUME_DIR)

thesis:
	$(MAKE) -C $(THESIS_DIR) thesis

thesis-variants:
	$(MAKE) -C $(THESIS_DIR) variants

thesis-a3:
	$(MAKE) -C $(THESIS_DIR) a3cover

word-check:
	$(PYTHON) scripts/check_word_templates.py

release-package:
	$(PYTHON) scripts/package_release.py

clean:
	-$(MAKE) -C $(RESUME_DIR) clean
	-$(MAKE) -C $(THESIS_DIR) clean
