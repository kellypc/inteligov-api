## InteliGov Project API

Este desafio foi criado como parte do processo seletivo da empresa [InteliGov](https://inteligov.com.br/).
O desafio consiste em duas aplicacoes: uma backend feita com rails api e uma frontend feito com ReactJs.

---

## Instalação

**Dependention note**: E necessario ter o ruby versao 2.5.1 instalado no ambiente.

1. Clone o projeto.

~~~ sh
$ git clone git@github.com:kellypc/inteligov-api.git
~~~

2. Instale as dependencias.

~~~ sh
$ bundle install
~~~

3. Faca a migracao do banco

~~~ sh
$ rake db:migrate
~~~

4. Execute a aplicacao na porta 3001

~~~ sh
$ rails s -p 3001
~~~

---

## Testes utilizando RSpec

Para executar os testes é necessário rodar o seguinte comando:

~~~ sh
$ bundle exec rspec
~~~
