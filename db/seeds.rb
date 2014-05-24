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
    name: "C.E. Maria Joaquina"
  },
  {
    name: "C.E. Lerolero"
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
    name: "C.E. Maria Joaquina"
  },
  {
    name: "C.E. Lerolero"
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
e pela proximidade com a linguagem humana...
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
O conceito de vetores.
"
  }
]

methodologies << [
  {
    title: "vetores em Javascript de forma fácil",
    teaser: "Aprenda como fazer vetores em Javascript de forma fácil!",
    content: "Javascript é uma linguagem dinâmica e muito eficiente para o lado do cliente na 
web. \nVocê pode aprender como fazer vetores lerolero"
  }
]

methodologies << [
  {
    title: "Como fazer um App para o Firefox OS",
    teaser: "Um tutorial muito rápido de como fazer um app!",
    content: "Aprenda a fazer um aplicativo para firefox os. Para isso você deve conhecer 
html e js de forma eficiente. Se você já tem um bom conhecimento de javascript, pode começar 
baixando o kit de desenvolvimento da mozilla..."
  }
]

methodologies << [
  {
    title: "Aprendendo Pascal",
    content: "Pascal não é uma linguagem difícil. Geralmente a primeira coisa a se ensinar é: \n
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