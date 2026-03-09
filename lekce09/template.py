from microbit import *
import radio

# Nastav kanál (0–83) — obě zařízení musí mít stejné číslo!
KANAL = 42
radio.config(channel=KANAL)
radio.on()

while True:
    # --- Odesílání ---
    if button_a.was_pressed():
        zprava = "Ahoj!"          # sem napiš, co chceš poslat
        radio.send(zprava)
        display.show(Image.ARROW_E)
        sleep(300)

    # --- Příjem ---
    prijata = radio.receive()
    if prijata is not None:
        display.scroll(prijata)

    display.show(Image.HEART)
    sleep(100)
