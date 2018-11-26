Pin | Function                        | ESP-8266 Pin | Note
----|---------------------------------|--------------| ----
TX  | TXD                             | TXD          |
RX  | RXD                             | RXD          |
A0  | Analog input, max 3.3V input    | A0           |
D0  | IO                              | GPIO16       |
D1  | IO, SCL                         | GPIO5        |
D2  | IO, SDA                         | GPIO4        |
D3  | IO,10k Pull-up                  | GPIO0        | (pulled low on boot, but usable as GPIO)
D4  | IO, 10k pull-up, BUILTIN_LED    | GPIO2        | (pulled up during boot, internal LED)
D5  | IO, SCK                         | GPIO14       |
D6  | IO, MISO                        | GPIO12       |
D7  | IO, MOSI                        | GPIO13       |
D8  | IO,10k pull-down, SS            | GPIO15       | (fixed external pull-down for boot)
G   | Ground                          | GND          |
5V  | 5V                              | -            |
3V3 | 3.3V                            | 3.3V         |
RST | Reset                           | RST          |