# Abajur Automático com Controle de Motores e LEDs
Este projeto foi elaborado inicialmente como trabalho final da disciplina de Linguagem de Descrição de Hardware (HDL) e consiste em simular um abajur automático com funcionalidades distintas para o controle de motores e LEDs utilizando um FPGA Cyclone III: EP3C16F484C6 e motores Servo SG90. São oferecidos 3 modos de operação para os motores (horizontal, vertical e giratório) e 3 modos para os LEDs (ligado, pisca e fade). O projeto foi implementado utilizando uma base em VHD com uma casca em Verilog, permitindo o funcionamento completo do dispositivo simulado. Os testes e projeções foram feitos no software da Intel: Quartus II 13.1.

## Funcionalidades
### Controle dos Motores
#### Modos Disponíveis:
* Horizontal;
* Vertical;
* Giratório
### Controle dos LEDs
#### Modos Disponíveis:
* Ligado;
* Pisca;
* Fade (efeito de transição suave)

## Simulação do Funcionamento
Para realizar a simulação do abajur automático, foi replicada a configuração física dos componentes necessários:

* LEDs Soldados na Lata:
A representação dos LEDs foi feita por meio de modelagem física, simulando sua disposição e emissão de luz.
* Conexão aos Motores:
Os LEDs foram conectados à lata de modo que eles realizassem sua função independentemente do funcionamento do motor.
* Estrutura de Movimento Horizontal:
A integração da lata aos motores e à estrutura responsável pelos movimentos horizontais para reproduzir os movimentos desejados.

Para simular o funcionamento do abajur, foi feito a solda dos LEDs em uma lata. Além disso, esta lata foi colada a dois motores, responsáveis pelos movimentos giratórios e verticais, e foi colada também a uma estrutura que iria ser responsável por realizar os movimentos horizontais do produto. 
![Imagem do WhatsApp de 2023-12-11 à(s) 23 53 39_7c6eaff8](https://github.com/cyberdebb/abajur-automatico/assets/107296659/ad33e1a0-e33f-4b7d-b476-13cc5579c4a8)


