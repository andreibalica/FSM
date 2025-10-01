# FSM - Finite State Machine

## Descriere

Acest proiect reprezintă o implementare a unei automatizări finite de tip Moore folosind limbajul Verilog și mediul de dezvoltare Xilinx Vivado.

## Conținut: 
**Tonomat.v** - Codul sursă Verilog pentru automatul finit de tip Moore  
**Tonomat_tb.v** - Testbench-ul utilizat pentru simulare comportamentală

## Specificații Tehnice

### Intrări:
- **CLK** – Semnalul de ceas (clock)
- **RESET** – Reset asincron al sistemului (activ pe 1)
- **RON1** – Introducere monedă de 1 RON
- **RON5** – Introducere monedă de 5 RON
- **RON10** – Introducere monedă de 10 RON

### Ieșiri:
- **PRODUS** – Semnal care indică eliberarea unui produs (3 RON)
- **R1** – Semnal pentru rest: indică returnarea de 1 RON
- **R5** – Semnal pentru rest: indică returnarea de 5 RON
