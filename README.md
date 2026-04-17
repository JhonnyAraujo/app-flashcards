# 📱 App Rick and Morty

> **Projeto desenvolvido como parte do Desafio Técnico Desenvolvedor Mobile com Flutter do Programa VesteTech (parceria entre Veste S.A. e Growdev).** O aplicativo consiste em facilitar o estudo do usuário com Flash Cards, o usuário vai ter a capacidade de criar baralhos e adicionar cartões para revisar seus estudos. Portando, será aplicado conceitos estudado em aula, persistência de dados com Hive, uso da camada Repository e Adapter.

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.41.6-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-v3.11.4-blue.svg)](https://dart.dev/)

## 🧠 Decisões de Desenvolvimento

Neste projeto, apliquei uma abordagem sistemática para garantir que o código fosse modular, testável e fácil de manter. Abaixo estão as principais decisões:

- **hive_ce:** Escolhido como o motor de banco de dados local (NoSQL) do projeto pela sua performance inigualável. O Hive realiza a conversão e o armazenamento dos objetos de forma nativa em formato binário, proporcionando uma velocidade de leitura e escrita praticamente instantânea. Optei estrategicamente pela ramificação \_ce (Community Edition) por oferecer manutenção ativa.
- **hive_ce_flutter:** Escolhido por abstrair a configuração de rotas de arquivos. De forma facilitada e sem a necessidade de configurações manuais (como o uso do pacote path_provider), ele localiza automaticamente qual é o diretório nativo raiz do sistema, garantindo que o armazenamento local funcione com excelência independentemente da plataforma em que o projeto for compilado.
