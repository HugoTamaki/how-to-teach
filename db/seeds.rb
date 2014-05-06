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
    first_name: "Rafael",
    last_name: "Andrade",
    email: "rafael@exemplo.com",
    password: "11111111",
    password_confirmation: "11111111"
  },
  {
    first_name: "Maria",
    last_name: "Isabel",
    email: "maria@exemplo.com",
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

# preenchendo metodologias
methodologies = []
methodologies << [
  {
    title: "Como aprender Java",
    content: "Esta metodologia visa ensinar Java para iniciantes.\n
              Java é uma linguagem muito importante e usada em vários sistemas hoje em dia, \n
              e foi uma revolução para a programação, inserindo o paradigma da Orientação a Objetos \n
              para o desenvolvimento de sistemas.
              ...
             "
  },
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

methodologies << [
  {
    title: "Ensinando Ruby",
    content: "Ruby é a nova moda do mundo da programação web. Muitos empregos surgiram \n
              a partir de 2004 (época em que o principal framework fez sucesso, o Ruby on Rails), \n
              e hoje, após 10 anos de evolucão, muitas empresas grandes já usam Ruby. 
             "
  },
  {
    title: "Ensinando Ruby",
    content: "Ruby é a nova moda do mundo da programação web. Muitos empregos surgiram \n
              a partir de 2004 (época em que o principal framework fez sucesso, o Ruby on Rails), \n
              e hoje, após 10 anos de evolucão, muitas empresas grandes já usam Ruby. 
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