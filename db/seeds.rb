# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# preenchendo usuários
users = [
  {
    first_name: "Hugo",
    last_name: "Tamaki",
    email: "hugotamaki@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  },
  {
    first_name: "Jéssika",
    last_name: "Guedes",
    email: "jessika@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  },
  {
    first_name: "Maria",
    last_name: "Isabel",
    email: "maria_isabel@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  },
  {
    first_name: "Roberta",
    last_name: "Fernandes",
    email: "roberta@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  },
  {
    first_name: "Larissa",
    last_name: "Ferreira",
    email: "larissa@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  }
]

# preenchendo escolas
schools = []
schools << [
  {
    name: "C.E. José Bonifácio"
  },
  {
    name: "C.E. Guilherme Briggs"
  }
]

schools << [
  {
    name: "C.E. Gomes Freire de Andrade"
  },
  {
    name: "C.E. André Maurois"
  }
]

schools << [
  {
    name: "C.E. Pedro II"
  },
  {
    name: "C.E. Aurelino Leal"
  }
]

schools << [
  {
    name: "C.E. Joaquim Tavora"
  },
  {
    name: "C.E. Manoel de Abreu"
  }
]

schools << [
  {
    name: "Escola Municipal Estácio de Sá"
  },
  {
    name: "C.E. Baltazar Bernardino"
  }
]

# preenchendo metodologias
methodologies = []
methodologies << [
  {
    title: "Como aprender Ruby",
    teaser: "Aprenda ruby de forma rápida e eficiente aqui!",
    content: "Esta metodologia visa ensinar Ruby para iniciantes.\n
Ruby é uma linguagem orientada a objetos, criada no Japão na década de 90, e só foi ser conhecido 
no ocidente em 2004 graças ao sucesso do framework Ruby on Rails que serve para fazer 
aplicações web de forma ágil e eficiente. \nÉ uma linguagem que chama atenção pela simplicidade 
e pela proximidade com a linguagem humana. Esta aula foi aplicada usando:\n
- Um laboratório de informática\n
- Um script especial para ensinar loops que segue abaixo em uma das imagens\n
- Um script especial para ensinar blocos condicionais que segue abaixo em uma das imagens\n
\n\n
Inicialmente, faz-se uma explicação introdutória ensinando a sintaxe básica de ruby, 
passando-se em seguida para os scripts. \n
Os scripts são intuitivos, e pode-se explicar com facilidade o que acontece por exemplo 
dentro de cada loop, adicionando algumas linhas de código por exemplo.\n
Acompanhe o video para ver como a explicação pode ser dada de forma eficiente.\n
É necessário que os alunos tenham um conhecimento sólido de orientação a objetos.
"
  },
  {
    title: "Aprendendo Ruby on Rails",
    teaser: "Ensinando um tutorial rápido de um sistema de cadastro de livros!",
    content: "O ruby on rails é um framwork de desenvolvimento de sistemas orientados a 
bancos de dados de forma muito eficiente. Este framwork surgiu no ano de 2004, e rápidamente 
ganhou o mundo devido à agilidade e rapidez no desenvolvimento.\n
Para tal tutorial, será necessário um laboratório de informática com computadores 
configurados desta forma:\n
- Ubuntu como sistema operacional\n
- Ruby versão 2.1.1\n
- Gem Rails versão 4.0\n
- rvm instalado\n
- git instalado\n
- mysql instalado\n
- gedit instalado\n
- Gem pry e awesome-print no gemset do rvm\n
\n\n
Inicialmente, pode-se rapidamente a partir de um comando pedir para os alunos produzirem 
um projeto do zero com o comando 'rails new project'.\n
A partir deste momento, pode-se abrir o projeto em um editor de código (gedit), 
e mostrar os principais arquivos que ele possui, como por exemplo a pasta app onde 
ficam as pastas controllers, models e views, a pasta assets, onde ficam os arquivos 
de javascript, imagens e css, o arquivo routes.rb que contém os caminhos para as actions 
dos controladores, o arquivo database.yml onde ficam os dados da conexão com banco de 
dados, e o Gemfile, que possuem as gems do projeto.\n
"
  }
]

methodologies << [
  {
    title: "Aprendendo Pascal",
    teaser: "Aprenda a linguagem que ensina de modo fácil a programar!",
    content: "Pascal não é uma linguagem difícil. Geralmente a primeira coisa a se ensinar é: \n
O conceito de variáveis\n
O conceito de blocos condicionais\n
O conceito de blocos de repetição\n
O conceito de vetores\n
\n\n
Para esta aula, precisamos usar um laboratório de informática com computadores 
preparados da seguinte forma:\n
- Compilador Free Pascal instalado\n
- arquivos de scrips especiais que estão em anexo
\n\n
Incialmente, pode-se passar uma lista de exercícios com algumas perguntas para 
avaliar o nível de conhecimento dos alunos com relação a lógica de programação.\n
....
"
  }
]

methodologies << [
  {
    title: "Vetores em Javascript de forma fácil",
    teaser: "Aprenda como fazer vetores em Javascript de forma fácil!",
    content: "Javascript é uma linguagem dinâmica e muito eficiente para o lado do cliente 
e atualmente para outras aplicações do lado do servidor, como no node.js.\n
Para esta aula, será necessário ter um laboratório com os computadores configurados da 
seguinte forma:\n
- Google Chrome instalado\n
- Um editor de código bom instalado\n\n
Primeiramente vamos ensinar a fazer uma calculadora.\n
Para tal, precisamos produzir um html base com dois quadros de input, como por exemplo 
uma tag input, com id='num1' e id='num2' e uma tag input do tipo button com id='botao'.\n
Desta forma, podemos introduzir logo em seguida uma explicação de como usar números que 
qualquer usuário pode escrever e logo em seguida mostrar um resultado, como a soma ou 
multiplicação entre eles.
"
  },
  {
    title: "Banco de dados com facilidade (parte 1).",
    teaser: "Ensinando banco de dados com facilidade!",
    content: "Para esta metodologia, vamos ensinar como criar um banco de dados com facilidade, 
e ensinaremos como fazer os relacionamentos de forma fácil.\n
Você pode seguir as seguintes instruções.\n
- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, obcaecati, consequatur 
quae quaerat reiciendis cupiditate eius similique consectetur cum ullam iste accusamus 
architecto sit incidunt provident ipsam beatae! Fuga, voluptate.\n
- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, maiores, laudantium, 
modi ipsam obcaecati adipisci fugit laboriosam voluptatum excepturi voluptas at assumenda 
rem asperiores perferendis nulla quibusdam dolor beatae quis.\n
"
  }
]

methodologies << [
  {
    title: "Ensinando a fazer um App para o Firefox OS",
    teaser: "Um tutorial muito rápido de como fazer um app!",
    content: "Aprenda a fazer um aplicativo para firefox os. Para isso você deve conhecer 
html e js de forma eficiente. Se você já tem um bom conhecimento de javascript, pode começar 
baixando o kit de desenvolvimento da mozilla..."
  },
  {
  title: "Ensinando a publicar um App de Firefox OS",
  teaser: "Como publicar seu app e ter mais de 1k de downloads em uma semana!",
  content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis, ipsa doloribus 
accusantium similique cupiditate eveniet qui mollitia enim dignissimos aspernatur 
impedit recusandae architecto blanditiis modi aperiam inventore deserunt consequuntur ea?"
  }
]

methodologies << [
  {
    title: "Como dar o básico de PETEQS de uma maneira eficiente.",
    teaser: "",
    content: "Lógica de programação não é algo difícil. Geralmente a primeira coisa a se ensinar é: \n
O conceito de variáveis\n
O conceito de blocos condicionais\n
O conceito de blocos de repetição\n
O conceito de vetores.
"
  }
]

users.each_with_index do |user, i|
  User.create!(user)
  u = User.last
  u.schools.build(schools[i])
  u.methodologies.build(methodologies[i])
  u.save
end