# Úvod do Pythonu na Micro:bitu

Výukové materiály pro první ročník vyššího gymnázia (kvinta).

Série 10 lekcí, které postupně uvádějí studenty do programování v Pythonu prostřednictvím micro:bitu (MicroPython v2). Každá lekce kombinuje jeden nový Python koncept s konkrétní funkcí micro:bitu.

## Pro učitele

Tento repozitář je **privátní** a obsahuje:
- LaTeX zdrojové soubory pracovních listů a prezentací (`ucitel/`)
- Metodické pokyny pro každou lekci (`METODIKA.md`)
- Texty úloh připravené pro Google Classroom (`classroom_uloha.md`)
- Vzorová řešení (kde je to vhodné)

## Pro studenty

Studenti mají přístup k **veřejnému repozitáři** [mkgymji/pythonIntroMB-student](https://github.com/mkgymji/pythonIntroMB-student), který obsahuje:
- Zkompilované pracovní listy (PDF)
- Prezentace z hodin (PDF)
- Šablony zdrojových kódů (`.py`) tam, kde jsou k dispozici

## Přehled lekcí

| Lekce | Téma | Python |
|-------|------|--------|
| 01 | Seznámení s micro:bitem a Thonny | volání funkce, první skript |
| 02 | Proměnné a typy | `int`, `str`, přiřazení |
| 03 | Podmínky | `if / elif / else` |
| 04 | Cykly | `while True`, `for`, `sleep()` |
| 05 | Náhoda a hry | `import random` |
| 06 | Senzory a data | `float`, `temperature()`, `accelerometer` |
| 07 | Zvuk a hudba | listy, `import music` |
| 08 | Vlastní funkce | `def`, parametry, `return` |
| 09 | Radio — komunikace | `radio`, řetězce |
| 10 | Závěrečný projekt | volná práce |

## Sestavení PDF

```bash
make lekce01      # jedna lekce
make              # všechny lekce
make clean        # smaže pomocné LaTeX soubory
make distclean    # smaže i PDF (pro čistou rekompilaci)
make push-public  # synchronizace do veřejného repo
```

Vyžaduje: XeLaTeX, `latexmk`.

## Šablony zdrojových kódů

Lekce 09 a 10 obsahují `template.py` v adresáři `student/lekceXX/` jako startovní bod pro studenty.
Ostatní lekce šablonu nemají záměrně — studenti kód píší od začátku.
