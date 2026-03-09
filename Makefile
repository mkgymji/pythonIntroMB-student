# Makefile -- pythonIntroMB (privatni repo ucitele)
#
# Prikazy:
#   make              -- zkompiluje vsechna PDF ze vsech lekcí
#   make lekce01      -- zkompiluje PDF pouze pro lekce01
#   make clean        -- smaze pomocne LaTeX soubory
#   make distclean    -- smaze i PDF
#   make push-public  -- synchronizuje student/ do verejneho repo

LEKCE    := $(sort $(wildcard ucitel/lekce*))
LATEXMK  := latexmk -xelatex -interaction=nonstopmode

.PHONY: all clean distclean push-public $(notdir $(LEKCE))

all: $(notdir $(LEKCE))

# Pomocny skript pro kompilaci jedne lekce (vyhyba se define/eval escapingu)
compile-lekce = \
	mkdir -p student/$(1); \
	for tex in ucitel/$(1)/*.tex; do \
		[ -f "$$tex" ] || continue; \
		$(LATEXMK) -output-directory=ucitel/$(1) "$$tex"; \
		pdf=$$(basename "$$tex" .tex).pdf; \
		cp ucitel/$(1)/$$pdf student/$(1)/$$pdf; \
	done

lekce01:
	@echo "==> Kompilace lekce01..."
	@$(call compile-lekce,lekce01)
	@echo "    PDF -> student/lekce01/"

lekce02:
	@echo "==> Kompilace lekce02..."
	@$(call compile-lekce,lekce02)
	@echo "    PDF -> student/lekce02/"

lekce03:
	@echo "==> Kompilace lekce03..."
	@$(call compile-lekce,lekce03)
	@echo "    PDF -> student/lekce03/"

lekce04:
	@echo "==> Kompilace lekce04..."
	@$(call compile-lekce,lekce04)
	@echo "    PDF -> student/lekce04/"

lekce05:
	@echo "==> Kompilace lekce05..."
	@$(call compile-lekce,lekce05)
	@echo "    PDF -> student/lekce05/"

lekce06:
	@echo "==> Kompilace lekce06..."
	@$(call compile-lekce,lekce06)
	@echo "    PDF -> student/lekce06/"

lekce07:
	@echo "==> Kompilace lekce07..."
	@$(call compile-lekce,lekce07)
	@echo "    PDF -> student/lekce07/"

lekce08:
	@echo "==> Kompilace lekce08..."
	@$(call compile-lekce,lekce08)
	@echo "    PDF -> student/lekce08/"

lekce09:
	@echo "==> Kompilace lekce09..."
	@$(call compile-lekce,lekce09)
	@echo "    PDF -> student/lekce09/"

lekce10:
	@echo "==> Kompilace lekce10..."
	@$(call compile-lekce,lekce10)
	@echo "    PDF -> student/lekce10/"

clean:
	@for d in $(LEKCE); do \
		$(LATEXMK) -C -output-directory=$$d $$d/*.tex 2>/dev/null || true; \
	done

distclean: clean
	@rm -f student/lekce*/*.pdf
	@rm -f ucitel/lekce*/*.pdf

push-public:
	./push-public.sh
