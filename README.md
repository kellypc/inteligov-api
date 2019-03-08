# Desafio InteliGov para Dev Fullstack

Este desafio é, propositalmente, bastante aberto, eis que visa avaliar não apenas a qualidade técnica do seu código, mas também seus modelos de tomada de decisão, criatividade e outras _soft skills_.

### 1. API REST em Rails

A primeira parte do desafio consiste em desenvolver uma API REST em Rails que fornecerá ao usuário a possibilidade de buscar, visualizar e cadastrar em seu perfil proposições legislativas da [Assembleia Legislativa do Acre](https://sapl.al.ac.leg.br/).

#### Requisitos:

- **Versões:** Use `ruby 2.5.1` e `rails 5.2.1`
- **Gems:** Use `pg`, `mechanize` e `nokogiri`
- **Autenticação:** todas as requisições referentes a proposições legislativas devem ser autenticadas
- **Autorização:** cada usuário deve ter acesso apenas à busca e às proposições legislativas que ele próprio cadastrou
- **Testes:** adicione cobertura para testes de unidade e integração utilizando `rspec`, `shoulda-matchers`, `factory_bot` e `guard`
- **Ações (1/4):** Além de lidar com usuários, haverá apenas o _BillsController_ com as ações `index`, `new`, `create` e `destroy`
- **Ações (2/4):** a ação `index` é responsável por listar as proposições favoritas cadastradas pelo usuário
- **Ações (3/4):** a ação `new` busca a proposição legislativa no site da Assembleia Legislativa do Acre, aceitando um único parâmetro exclusivamente numérico e retornando um objeto _json_ no seguinte formato:

  <details>

    <summary>Clique para ver</summary>

  ```json
  /*
  A busca pelo número 4059, por exemplo, vai resultar em
  um scraper sendo disparado para a URI
  https://sapl.al.ac.leg.br/materia/4059 e retornando o
  objeto JSON abaixo.
  */

  {
    "ext_id": "4059",
    "author": "Governo - Governador",
    "kind": "Projeto de Lei",
    "number": "201",
    "year": "2013",
    "status": "APROVADO",
    "description": "DISPÕE SOBRE A DOAÇÃO E A VENDA DE ÁREAS DE DOMÍNIO DA ADMINISTRAÇÃO PÚBLICA DIRETA E INDIRETA, PARA EFEITO DE REGULARIZAÇÃO FUNDIÁRIA DE INTERESSE SOCIAL.",
    "steps": [
      ["19/12/2013", "SAL", "Enviado para PE: Aprovado"],
      [
        "17/12/2013",
        "SAL",
        "Enviado para SAL: Distribuição às Comissões Tematicas"
      ]
    ],
    "link": "https://sapl.al.ac.leg.br/media/sapl/public/materialegislativa/2013/4059/4059_texto_integral.pdf",
    "introduction_date": "2013-12-17"
  }
  ```

  </details>

- **Ações (4/4):** a ação `create` deve adicionar o projeto à lista de favoritos do usuário atual e a ação `destroy` deve fazer o oposto.

### 2. Frontend em React

Pela interface web, o usuário deve poder se logar (login e logout), realizar buscas de projetos, cadastrá-los em sua conta e visualizar a lista de seus projetos cadastrados (com alguns detalhes) e paginação do estilo _load more_.

#### Requisitos:

1. **Módulos:** Use `create-react-app`, `yarn` (e não `npm`), `semantic-ui-react`, `axios` e `react-router >= 4.0` (fique a vontade para usar mais módulos se necessário)
2. **Rotas:** Use as seguintes rotas:

   i. `'/'` para login de usuário

   ii. `'/projetos'` para a lista de favoritos do usuário logado, permitindo o descadastramento

   iii. `'/buscar'` para a busca de proposições pelo usuário logado, retorno da busca e cadastro de novo projeto

### 3. Entrega

0. O prazo de entrega é de **5 dias**
1. Crie um repositório para o backend e outro para o frontend no [github](https://github.com)
1. Inclua um README em cada um dos repositórios com instruções de como rodar localmente o frontend e o backend
1. Passe os links dos repos para [dev@inteligov.com.br](mailto:dev@inteligov.com.br)