# Makefile -- pythonIntroMB (privatni repo ucitele)
#
# Prikazy:
#   make              -- zkompiluje vsechna PDF ze vsech lekcí
#   make lekce01      -- zkompiluje PDF pouze pro lekce01
#   make clean        -- smaze pomocne LaTeX soubory
#   make distclean    -- smaze i PDF
#   make push-public  -- synchronizuje student/ do verejneho repo

LEKCE := $(wildcard ucitel/lekce*)
LATEXMK := latexmk -xelatex -interaction=nonstopmode

.PHONY: all clean distclean push-public $(notdir $(LEKCE))

all: $(notdir $(LEKCE))

# Target pro kazdou lekci: zkompiluje vsechny .tex v ucitel/lekceXX/
# a zkopiruje PDF do student/lekceXX/
define LEKCE_RULE
$(notdir $(1)):
	@echo "==> Kompilace $(notdir $(1))..."
	@mkdir -p student/$(notdir $(1))
	@for tex in $(1)/*.tex; do \
		[ -f "$$tex" ] || continue; \
		$(LATEXMK) -output-directory=$(1) "$$tex"; \
		pdf=$$(basename "$$tex" .tex).pdf; \
		cp $(1)/$$pdf student/$(notdir $(1))/$$pdf; \
	done
	@echo "    PDF -> student/$(notdir $(1))/"
endef

$(foreach l,$(LEKCE),$(eval $(call LEKCE_RULE,$(l))))

clean:
	@for d in $(LEKCE); do \
		$(LATEXMK) -C -output-directory=$$d $$d/*.tex 2>/dev/null || true; \
	done

distclean: clean
	@rm -f student/lekce*/*.pdf
	@rm -f ucitel/lekce*/*.pdf

push-public:
	./push-public.sh
