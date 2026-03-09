# Metodika — Lekce 10: Rádio — hra dvou hráčů

## Cíle lekce

Po lekci student:
- rozumí pojmu **protokol** a dovede navrhnout jednoduchý protokol pro dvě zařízení
- napíše a otestuje asymetrický program (hostitel vs. host) pro reakcní hru
- (bonus) napíše symetrický program (oba spustí stejný kód) pro KNP s automatickou synchronizací
- propojí `random`, `radio` a stavové proměnné do funkčního celku

## Časová dotace

~90 minut (dvouhodinovka).

- Reakcní hra (Část 1): ~55 min
- KNP bonus (Část 2): ~25 min
- Reserve / prezentace her: ~10 min

## Průběh hodiny

### Úvod — co je protokol (8 min)
Snímek s protokolem — uveď příklady z reálného světa (HTTP, Bluetooth).
Klíčová myšlenka: „Dvě zařízení si musí dopředu domluvit, co která zpráva znamená."
Ukaž tabulku tří zpráv reakcní hry — nechte studenty odhadnout, co která zpráva dělá.

### Reakcní hra — hostitel (15 min)
Projdi program hostitele snímek po snímku. Důraz na:
- `vitez = None` jako stavová proměnná (ještě nikdo nevyhrál)
- smyčku `while vitez is None` — čeká na první ze dvou událostí
- nezapomeň: `random.randint` — opakování z L05

Nechte studenty napsat program hostitele do Thonny a otestovat sami (bez soupeře):
po stisku B se musí zobrazit `!`.

### Reakcní hra — host (10 min)
Projdi program hosta — poukáž na symetrii s hostitelem.
Otázka do třídy: „Proč host nepotřebuje `import random`?"

### Hra naživo (20 min)
Studenti pracují ve dvojicích. Jeden nahraje program hostitele, druhý hosta.
Zkontroluj, že mají stejné číslo kanálu (nejčastější chyba!).

Pokud zbyde čas: vyzvi je k rozšíření (zvukový signál, jiný rozsah prodlevy).

### Bonus — KNP (25 min)
Začni snímkem „Asymetrický vs. symetrický protokol" — vyvolej diskusi.
Klíčová otázka: „Jak se domluvit bez centrálního hostitele?"

Ukaž `while...else` konstrukt — pravděpodobně poprvé studenti vidí `else` u `while`.
Vysvětli: „`else` se spustí jen pokud `while` skončil přirozeně (podmínka = False), ne přes `break`."

## Nejčastější chyby

- **Různé číslo kanálu** — nejčastější důvod proč komunikace nefunguje
- **`receive()` mimo smyčku** — volají `receive()` jen jednou, ne v cyklu
- **Zapomínají `radio.on()`** — program se tiše spustí, ale nic neposílá
- **KNP: `was_pressed()` vs `is_pressed()`** pro detekci A+B: `is_pressed()` reaguje na aktuální stav, `was_pressed()` na minulý stisk → pro simultánní detekci dvou tlačítek je `is_pressed()` spolehlivější

## Klíčový pedagogický moment

**`while vitez is None`** je elegantní ukázka stavové proměnné:
místo dvou vnořených podmínek (stiskl hostitel? stiskl host?) čekáme na jednu obecnou podmínku
a plníme ji podle toho, co přijde dřív. To je vzor, který studenti použijí i v dalším kódu.

**`while...else` v bonusu** — Python kuriozita, ale zde je to přesně ten případ,
kde `else` dává smysl. Nespěchej s vysvětlením; nejdřív ukaž výsledek, pak struktura.
