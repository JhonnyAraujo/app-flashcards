# 📱 App Rick and Morty

> **Projeto desenvolvido como parte do Desafio Técnico Desenvolvedor Mobile com Flutter do Programa VesteTech (parceria entre Veste S.A. e Growdev).** O aplicativo consiste em facilitar o estudo do usuário com Flash Cards, o usuário vai ter a capacidade de criar baralhos e adicionar cartões para revisar seus estudos. Portando, será aplicado conceitos estudado em aula, persistência de dados com Hive, uso da camada Repository e Adapter.

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.41.6-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-v3.11.4-blue.svg)](https://dart.dev/)

## 🛠️ Tecnologias e Arquitetura

Este projeto foi desenvolvido com as seguintes tecnologias e práticas:

- **Linguagem:** [Dart](https://dart.dev/)
- **Framework:** [Flutter](https://flutter.dev/)
- **Gerenciamento de Estado:** [Mobx](https://pub.dev/packages/mobx)
- **Persistência de Dados:** [Hive_CE](https://pub.dev/packages/hive_ce)
- **Injeção de Dependência:** [Get_It](https://pub.dev/packages/get_it)
- **Arquitetura:** MVVM + Clean Architecture + Repository Pattern + Service Layer + Adapter Pattern

## ✨ Funcionalidades

- **Criar um baralho:** A página Home tem um botão "Adicionar" que ira redirecionar o usuario para uma página de criar um baralho, sendo obrigatório passar um titulo para o baralho.
- **Mostra todos os baralho na tela inicial:** A funcionalidade implementada busca todos os baralhos criados e armazenados no banco de dados local, mostra na tela inicial logo após iniciar o app.
- **Deleta um baralho:** Ao pressionar e segurar por um momento exclui o baralho.



## 📁 Estrutura de Pastas

```
lib/
├── main.dart                          # Ponto de entrada e inicialização do app
├── injection_container.dart           # Registro global de dependências (GetIt)
└── flash_cards/                       # Feature: Baralhos (Flashcards)
    ├── data/                          # Camada de Infraestrutura
    │   ├── adapters/
    │   │   └── deck.adapter.dart      # Operações com o banco Hive
    │   ├── repositories/
    │   │   └── deck.repository.dart   # Orquestrador de dados
    │   └── services/
    │       └── create_deck_local.service.dart  # Caso de uso: criar baralho
    ├── domain/                        # Camada de Negócio
    │   └── models/
    │       └── deck/
    │           └── deck.model.dart    # Entidade do baralho
    └── presentation/                  # Camada de Interface
        ├── pages/
        │   ├── home.page.dart         # Tela principal
        │   └── add_deck.page.dart     # Tela de criar baralho
        └── stores/
            ├── home.store.dart        # Estado da tela principal
            └── add_deck.store.dart    # Estado da tela de criar baralho
```

## 🧠 Decisões de Desenvolvimento

Neste projeto, apliquei uma abordagem sistemática para garantir que o código fosse modular, testável e fácil de manter. Abaixo estão as principais decisões:

- **get_it:** Escolhido como Localizador de Serviços para centralizar a criação e o ciclo de vida das dependências do projeto. Com ele, as instâncias de Adapters, Services e Repositories são registradas uma única vez na inicialização do app e disponibilizadas globalmente, eliminando a necessidade de instanciar manualmente as dependências em cada tela e garantindo um código desacoplado e de fácil manutenção.

- **hive_ce:** Escolhido para banco de dados local (NoSQL) do projeto pela sua performance rápida. O Hive realiza a conversão e o armazenamento dos objetos de forma nativa em formato binário, proporcionando uma velocidade de leitura e escrita muito rápida comprado a outros da mesma linha. Optei estrategicamente pela ramificação \_ce (Community Edition) por oferecer manutenção ativa.
