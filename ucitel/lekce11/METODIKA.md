# Metodika — Lekce 11: Volný projekt

## Cíle lekce

Po lekci student:
- aplikuje libovolnou kombinaci naučených konceptů v jednom programu
- plánuje vlastní projekt (co chci, jak to udělám, jak to otestuji)
- prezentuje výsledek spolužákům

## Časová dotace

~90 minut (samostatná dvouhodinovka).

## Volitelnost lekce

**Tato lekce je volitelná.** Kurz lze ukončit po lekci 10 (rádio — hra dvou hráčů)
a studenti odchází s ucelenými znalostmi: proměnné, podmínky, cykly, funkce, seznamy,
senzory, hudba a bezdrátová komunikace včetně hry. Pokud zbyde čas nebo chcete projekt
hodnotit formálně, lekce 11 je přirozenou korunkou celé série.

## Průběh hodiny

### Úvod — review (8 min)
Prezentace — přehled všeho, co studenti za kurz zvládli.
Nápady na projekty jako inspirace.

### Plánování (7 min)
Studenti vyplní plánovací list — co budou dělat, jaké koncepty použijí.
Učitel projde po třídě a schválí/doladí plány.

### Realizace (25 min)
Samostatná práce na projektu. Učitel k dispozici pro pomoc.

### Sdílení (5 min)
Dobrovolníci předvedou svůj projekt (funkční nebo ve stavu rozpracovanosti).

## Nápady na projekty

| Projekt | Koncepty | Obtížnost |
|---------|----------|-----------|
| Digitální kostka s animací | random, while, display | ★ |
| Stopky / odpočítávání | while, sleep, display | ★ |
| Teploměr s varováním | temperature, if, display | ★ |
| Hádej číslo | random, input přes tlačítka, def | ★★ |
| Jukebox s melodiemi | list, music, button | ★★ |
| Inklinometr + zvuk | accelerometer, music.pitch | ★★ |
| Komunikátor (radio chat) | radio, list zpráv, button | ★★ |
| Věštírna s animací | random, list, images, shake | ★★ |
| Mini hra (2 hráči, radio) | radio, random, def, if | ★★★ |
| Automatická světla | accelerometer, if, display | ★★★ |
| Kulička na plošince | accelerometer, set_pixel, def | ★★★ |

## Tipy

- Povzbuď studenty, aby kombinovali koncepty — nejcennější je propojení.
- Projekt nemusí být „hotový" — fungující jádro s jedním konceptem > nepracující ambiciózní plán.
- Pokud student neví, co dělat: navrhni mu rozšíření jukeboxu nebo věštírny z předchozích lekcí.
- Upozorni na testování: „Funguje to u tebe? Ukaž kamarádovi."
- Hodnotit zejména: funguje program? Jsou použity alespoň 3 koncepty? Student rozumí kódu?

## Vzorové řešení bonusu — Kulička na plošince

### Základní verze (tečka přímo z náklonu)

```python
from microbit import *

def mapuj(hodnota, vstup_min, vstup_max, vystup_min, vystup_max):
    pomer = (hodnota - vstup_min) / (vstup_max - vstup_min)
    return int(pomer * (vystup_max - vystup_min) + vystup_min)

def orez(hodnota, minimum, maximum):
    if hodnota < minimum:
        return minimum
    if hodnota > maximum:
        return maximum
    return hodnota

while True:
    x = accelerometer.get_x()
    y = accelerometer.get_y()

    px = mapuj(x, -1024, 1024, 0, 4)
    py = mapuj(y, -1024, 1024, 0, 4)
    px = orez(px, 0, 4)
    py = orez(py, 0, 4)

    display.clear()
    display.set_pixel(px, py, 9)
    sleep(50)
```

### Fyzikálnější verze (náklon = rychlost, tečka má setrvačnost)

```python
from microbit import *

def orez(hodnota, minimum, maximum):
    if hodnota < minimum:
        return minimum
    if hodnota > maximum:
        return maximum
    return hodnota

kx = 2.0
ky = 2.0

while True:
    kx += accelerometer.get_x() / 2000
    ky += accelerometer.get_y() / 2000

    kx = orez(kx, 0.0, 4.0)
    ky = orez(ky, 0.0, 4.0)

    display.clear()
    display.set_pixel(int(kx), int(ky), 9)
    sleep(50)
```

**Odpovědi na otázky:**
1. Tečka se pohybuje nakloněním — vlevo/vpravo/nahoru/dolů.
2. `mapuj()` přepočítává lineárně z rozsahu −1024..1024 na 0..4. Prostý součin by nefungoval
   kvůli posunutí (0 musí mapovat na 2, ne na 0).
3. Bez `orez()` by `display.set_pixel()` dostalo hodnotu mimo rozsah 0–4 a hodilo `ValueError`.
4. Ve fyzikální verzi tečka „klouže" — náklon mění rychlost, ne polohu přímo. Po zprovnění
   displeje tečka dál driftuje, dokud nezastaví o kraj (nebo ji znovu nenakloníš opačně).
   Studenti to obvykle ihned pochopí jako setrvačnost / „kulička se rozjede".

**Poznámka k `display.set_pixel()`:** Toto je jediné nové API v celém bonusu. Stačí říct:
„souřadnice (0,0) je vlevo nahoře, (4,4) vpravo dole — jako v matici." Jas 9 = plný jas.
