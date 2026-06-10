# 🚀 Aioros

> Sistema mobile inteligente para gestão de mesas, garçons e atendimentos.

O **Aioros** é uma aplicação desenvolvida para bares, restaurantes, lanchonetes e estabelecimentos que trabalham com atendimento em mesas.

Seu objetivo é proporcionar uma experiência simples, rápida e eficiente para gerenciamento operacional, auxiliando garçons e administradores durante o expediente.

---

# Equipe

Matheus Soares Kirchesch
Italo Monteiro Leite

---

# 📖 Visão Geral

O sistema permite:

- Cadastro de estabelecimentos
- Cadastro de garçons
- Cadastro de mesas
- Controle de status das mesas
- Associação de garçons aos atendimentos
- Histórico de atendimentos
- Alertas inteligentes para apoio operacional

---

# 🎯 Objetivos

- Reduzir falhas de atendimento
- Melhorar organização operacional
- Aumentar a produtividade dos garçons
- Centralizar informações das mesas
- Disponibilizar indicadores em tempo real
- Facilitar futuras expansões do sistema

---

# 👥 Perfis de Usuário

## Administrador

Responsável pela configuração e gerenciamento do sistema.

### Permissões

- Gerenciar estabelecimento
- Gerenciar garçons
- Gerenciar mesas
- Consultar histórico
- Visualizar indicadores

---

## Garçom

Responsável pelo atendimento das mesas.

### Permissões

- Login através de código
- Visualizar mesas
- Iniciar atendimentos
- Encerrar atendimentos
- Atualizar status das mesas
- Receber alertas operacionais

---

# 📋 Funcionalidades do MVP

## Estabelecimento

- [x] Cadastro de estabelecimento
- [x] Atualização de informações

## Garçons

- [x] Cadastro
- [x] Edição
- [x] Ativação/Inativação
- [x] Login por código

## Mesas

- [x] Cadastro
- [x] Edição
- [x] Exclusão
- [x] Consulta

## Atendimentos

- [x] Abertura de atendimento
- [x] Encerramento de atendimento
- [x] Associação de garçom
- [x] Histórico

## Operação

- [x] Dashboard operacional
- [x] Controle de status
- [x] Alertas inteligentes

---

# 📌 Status das Mesas

| Status | Descrição |
|----------|----------|
| 🟢 Disponível | Mesa livre para atendimento |
| 🔴 Ocupada | Cliente presente |
| 🔵 Em Atendimento | Garçom realizando atendimento |
| 🟡 Reservada | Mesa reservada |
| 🟣 Limpeza | Mesa em higienização |
| ⚫ Indisponível | Mesa fora de operação |

---

# 🏗️ Arquitetura

## Mobile

```text
Flutter
```

### Estrutura

```text
lib/
├── core/
├── features/
├── models/
├── repositories/
├── services/
├── widgets/
├── pages/
├── routes/
└── main.dart
```

---

## Backend

Arquitetura baseada em Clean Architecture.

```text
src/
├── controllers/
├── services/
├── repositories/
├── entities/
├── middlewares/
├── routes/
├── config/
└── app/
```

---

# 🗄️ Modelagem Inicial

## Estabelecimento

| Campo | Tipo |
|---------|---------|
| id | UUID |
| nome | String |
| responsavel | String |
| criado_em | Timestamp |

---

## Garçom

| Campo | Tipo |
|---------|---------|
| id | UUID |
| estabelecimento_id | UUID |
| nome | String |
| codigo | String |
| ativo | Boolean |

---

## Mesa

| Campo | Tipo |
|---------|---------|
| id | UUID |
| estabelecimento_id | UUID |
| numero | Integer |
| capacidade | Integer |
| status | Enum |
| observacao | String |

---

## Atendimento

| Campo | Tipo |
|---------|---------|
| id | UUID |
| mesa_id | UUID |
| garcom_id | UUID |
| status | Enum |
| abertura | Timestamp |
| encerramento | Timestamp |

---

# 🔌 API REST

## Estabelecimentos

```http
POST   /estabelecimentos
GET    /estabelecimentos
GET    /estabelecimentos/{id}
PUT    /estabelecimentos/{id}
```

## Garçons

```http
POST   /garcons
GET    /garcons
GET    /garcons/{id}
PUT    /garcons/{id}
DELETE /garcons/{id}
```

## Autenticação

```http
POST /auth/garcom
```

## Mesas

```http
POST   /mesas
GET    /mesas
GET    /mesas/{id}
PUT    /mesas/{id}
PATCH  /mesas/{id}/status
DELETE /mesas/{id}
```

## Atendimentos

```http
POST   /atendimentos
GET    /atendimentos
GET    /atendimentos/{id}
PATCH  /atendimentos/{id}/encerrar
```

---

# 📢 Alertas Inteligentes

O sistema deverá auxiliar os usuários através de notificações como:

- Mesa sem garçom associado
- Atendimento parado há muito tempo
- Mesa aguardando fechamento
- Mesa reservada próxima do horário
- Atendimento sem movimentação

---

# 🎨 Design System

## Tipografia

### Fonte Principal

```text
Inter
```

Pesos:

```text
700 - Bold
600 - SemiBold
400 - Regular
```

---

## Paleta de Cores

| Cor | Hex |
|---------|---------|
| Primary | #2563EB |
| Success | #22C55E |
| Warning | #F59E0B |
| Error | #EF4444 |
| Background | #F8FAFC |
| Surface | #FFFFFF |
| Text | #0F172A |

---

# 🛣️ Roadmap

## MVP

- Gestão de mesas
- Gestão de garçons
- Controle de atendimento
- Dashboard operacional

## V2

- Alertas inteligentes
- Histórico avançado
- Métricas operacionais

## V3

- Produtos
- Pedidos
- Comandas

## V4

- Pagamentos
- PIX
- Cartão

## V5

- Relatórios
- Dashboard gerencial
- Analytics

---

# 👨‍💻 Equipe

Projeto desenvolvido por:

- Italo Monteiro
- Matheus

---

# 📄 Licença

Projeto privado.
Todos os direitos reservados.
