# 🌿 Circuito Terê Verde – Situação-Problema #1

## 👥 Integrantes da Equipe

- *Wellyson Rocha* – Desenvolvedor Delphi / UX / QA  
- *João Pedro Fabbri* – Desenvolvedor de Banco de Dados

---

## 🧩 Situação-Problema Escolhida

*Situação-Problema #1 – Circuito Terê Verde*

O município de Teresópolis é rodeado por áreas de preservação ambiental e tem grande vocação para o ecoturismo e o montanhismo. Esta proposta visa criar uma solução digital que permita à população e aos visitantes acessarem informações atualizadas sobre:

- *Parque Nacional da Serra dos Órgãos*  
- *Parque Estadual dos Três Picos*  
- *Parque Natural Municipal Montanhas de Teresópolis*

A aplicação visa promover o turismo sustentável, a educação ambiental e facilitar a gestão e divulgação das atividades nos parques.

---

## 🚀 MVP – Mínimo Produto Viável

O projeto consiste em uma aplicação *desktop desenvolvida em Delphi*, com foco na usabilidade e no acesso a informações turísticas e administrativas. As principais funcionalidades são:

### 👥 Módulo de Acesso

- *Login ao sistema* com verificação de credenciais.
- *Login ao banco de dados* com suporte a host local ou remoto.
- Suporte a *logoff e múltiplas sessões*.

### 🧑‍💼 Módulo de Usuários e Professores

- Cadastro de *usuários comuns* com nome, login e senha.
- Cadastro de *professores*, com login próprio e senha segura.
- Visualização e *busca de professores* por nome.
- Diferenciação de perfis (usuário comum e professor).

### 👨‍👩‍👧 Módulo de Clientes

- Cadastro de *clientes vinculados a professores*.
- Listagem e *busca de clientes* por nome.
- Interface simples e objetiva para manutenção de dados.

### 🧭 Interface Principal

- Tela principal com atalhos para cadastros.
- Mensagens informativas rotativas com novidades sobre os parques.
- Botões de acesso rápido a funcionalidades essenciais (cadastros, logoff, sair).

---

## ✅ Requisitos Atendidos

### 🔧 Requisitos Funcionais
- Login no sistema e no banco.
- Cadastro e login de usuários e professores.
- Cadastro e visualização de clientes.
- Interface com busca por nome (clientes/professores).
- Diferenciação de perfis.

### 🚫 Requisitos Não Funcionais
- Aplicação em *Delphi VCL* com acesso via *FireDAC*.
- Banco de dados *PostgreSQL*.
- Interface amigável com tratamento de erros.
- Execução em ambiente *Windows*.

---

## 💻 Como Executar o Projeto Localmente

> ⚠ *Pré-requisitos:*
> - Delphi 10.4 ou superior  
> - Biblioteca *FireDAC* instalada  
> - Banco de dados *PostgreSQL* com estrutura compatível  
> - Sistema operacional *Windows*

### 🔧 Passos para executar

```bash
git clone https://github.com/WellysonSR/mvp-back-end.git
