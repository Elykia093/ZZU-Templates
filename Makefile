RESUME_DIR = templates/resume
THESIS_DIR = templates/thesis

.PHONY: all resume thesis thesis-a3 clean

all: resume thesis

resume:
	$(MAKE) -C $(RESUME_DIR)

thesis:
	$(MAKE) -C $(THESIS_DIR) thesis

thesis-a3:
	$(MAKE) -C $(THESIS_DIR) a3cover

clean:
	-$(MAKE) -C $(RESUME_DIR) clean
	-$(MAKE) -C $(THESIS_DIR) clean
