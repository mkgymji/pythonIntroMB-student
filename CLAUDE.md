# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Kontext projektu

Výukové materiály **Úvod do Pythonu na Micro:bitu** pro první ročník vyššího gymnázia (kvinta).
Studenti začínají s Pythonem od nuly; micro:bit (MicroPython v2) slouží jako motivační prostředek.
Thonny je vývojové prostředí, micro:bit sdílí více skupin — studenti umí reflashovat MicroPython firmware.

Série má 11 lekcí (lekce01–lekce11). Každá lekce = jeden Python koncept + jedna micro:bit feature.
Lekce 11 (volný projekt) je volitelná — kurz lze uzavřít po lekci 10.

| Lekce | Python koncept | Micro:bit feature |
|-------|---------------|-------------------|
| 01 | volání funkce, skript | `display.show/scroll`, firmware flash |
| 02 | proměnné, typy `int`/`str` | `display.show(name)` |
| 03 | `if / elif / else` | `button_a/b.is_pressed()` |
| 04 | `while True`, `for`, `sleep()` | animace LED |
| 05 | `import random` | hod kostkou, hry |
| 06 | `float`, základní math | `temperature()`, `accelerometer` |
| 07 | listy, `import music` | melodie, zvuky |
| 08 | `def`, parametry, `return` | refaktoring předchozích programů |
| 09 | řetězce, protokoly | `radio`, posílání zpráv |
| 10 | protokoly, stavové proměnné, `while…else` | `radio`, hra dvou hráčů |
| 11 *(volitelná)* | vše dohromady | volný projekt |

## Repozitáře

- **Tento repozitář** (privátní, učitel): `mkgymji/pythonIntroMB` — obsahuje vše
- **Veřejný repozitář** (studenti): `mkgymji/pythonIntroMB-student` — zrcadlo adresáře `student/`
- Synchronizace: `./push-public.sh` (macOS/Linux) nebo `.\push-public.ps1` (Windows)
- Mechanismus: `git subtree push --prefix=student public main`

## Struktura

```
MicrobitProVG/                  <- privátní repo (učitel)
├── student/                    <- zrcadleno do veřejného repo
│   └── lekceXX/
│       ├── pracovni_list.pdf   <- zkompilované PDF (verzováno)
│       ├── prezentace.pdf      <- zkompilované PDF (verzováno)
│       └── template.py         <- šablona zdrojáku (jen když dává smysl)
├── ucitel/
│   ├── spolecne/               <- sdílený LaTeX styl/preamble
│   └── lekceXX/
│       ├── pracovni_list.tex
│       ├── prezentace.tex
│       ├── METODIKA.md         <- popis lekce, tipy pro učitele
│       └── classroom_uloha.md  <- text připravený ke kopii do Google Classroom
├── Makefile
├── push-public.sh
├── push-public.ps1
├── CLAUDE.md
└── README.md
```

## Sestavení (příkazy)

```bash
make lekce01      # zkompiluje PDF pro lekce01 -> student/lekce01/
make              # zkompiluje všechny lekce
make clean        # smaže pomocné LaTeX soubory
make distclean    # smaže i PDF
make push-public  # synchronizuje student/ do veřejného repo
```

## LaTeX konvence

Používej `/latex` skill — platí konvence z něj (XeLaTeX, polyglossia cs, siunitx, latexmk).
LaTeX zdroje jsou **výhradně** v `ucitel/`. Studenti dostávají jen zkompilovaná PDF.

Typy dokumentů:
- **Pracovní list** (`pracovni_list.tex`): zadání úkolů pro studenty; formát A4
- **Prezentace** (`prezentace.tex`): beamer, slouží jako výklad i jako "poznámky z hodiny"

Sdílená preamble je v `ucitel/spolecne/` a includuje se relativní cestou.

## Obsah lekcí

Každá lekce v `ucitel/lekceXX/` musí mít:
- `pracovni_list.tex` → PDF do `student/lekceXX/`
- `prezentace.tex` → PDF do `student/lekceXX/`
- `METODIKA.md`
- `classroom_uloha.md`

Volitelně (jen když to dává smysl pro dané téma):
- `template.py` → zkopírovat do `student/lekceXX/`
- vzorové `.py` soubory v `ucitel/lekceXX/` (nemigrují do student/)

## classroom_uloha.md — formát

Soubor obsahuje text připravený ke kopírování do Google Classroom jako "Úloha".
Struktura:
```markdown
# Název úlohy

## Zadání
(co mají studenti udělat)

## Co odevzdat
(zdrojový kód / screenshot / foto/video běžícího micro:bitu / ...)

## Hodnocení (volitelně)
```

## MicroPython reference

Dokumentace: https://microbit-micropython.readthedocs.io/en/v2-docs/
Příbuzný projekt pro ZŠ (jiný přístup): https://github.com/jipech/Microbit2
