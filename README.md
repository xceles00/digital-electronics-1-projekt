# digital-electronics-1-projekt
### Team members

* Bořvoj Kramný (responsible for coding)
* Maxim Jehlička (responsible for coding)
* Peter Čeleš (responsible for coding, github)

## Theoretical description and explanation

The project is about implementing morse code encoder and decoder. First we are creating morse code encoder. Our approach to this is that we choose one letter that we want to encode by toggling the switches and the output will be LED diode that will give us the morse code. So input will be 5-bit switch that will represent each letter by its serial number in the alphabet. 

### Alphabet represented in 5-bit binary

| **Character** | **5-bit value** | **Character** | **5-bit value** |
   | :-: | :-: | :-: | :-: |
   | A | 00001 | M | 01101 |
   | B | 00010 | N | 01110 |
   | C | 00011 | O | 01111 |
   | D | 00100 | P | 10000 |
   | E | 00101 | Q | 10001 |
   | F | 00110 | R | 10010 |
   | G | 00111 | S | 10011 |
   | H | 01000 | T | 10100 |
   | I | 01001 | U | 10101 |
   | J | 01010 | V | 10110 |
   | K | 01011 | Y | 10111 |
   | L | 01100 | Z | 11000 |
   
   ### Morse alphabet
   
   <img src="images/morse_alphabet.png" alt="morse" style="width:450px;"/>

## Hardware description of demo application

<img src="images/n4r.png" alt="hardware" style="width:450px;"/>

<img src="images/7seg_rgb.png" alt="hardware" />


## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos or a link to a video.
