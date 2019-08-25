# frozen_string_literal: true

vasya = User.new(first_name: 'Василий', last_name: 'Иванов', email: 'vasya@example.com', password: 'vasya123', password_confirmation: 'vasya123')
vasya.skip_confirmation!
vasya.save!

petya = User.new(first_name: 'Петр', last_name: 'Кузнецов', email: 'petya@example.com', password: 'petya123', password_confirmation: 'petya123')
petya.skip_confirmation!
petya.save!

categories = Category.create!([
  { title: 'История' },
  { title: 'Биология' },
  { title: 'Финансовое право' }
])

tests = Test.create!([
  { category: categories[0], title: 'Древняя Русь', level: 1, author: petya },
  { category: categories[0], title: 'Всемирная история', level: 2, author: petya },
  { category: categories[1], title: 'Общие темы', level: 3, author: vasya },
  { category: categories[2], title: 'Общие темы', level: 5, author: vasya }
])

PassedTest.create([
  { user: vasya, test: tests[0] },
  { user: vasya, test: tests[1] },
  { user: petya, test: tests[2] },
  { user: petya, test: tests[3] }
])

questions = Question.create!([
  { test: tests[0], body: 'Укажите общественно-политический строй, господствовавший у древних славян до призвания варягов' },
  { test: tests[0], body: 'Наиболее крупными центрами расселения восточнославянских племенных союзов являлись' },
  { test: tests[0], body: 'Как характеризуется уклад жизни древних славян в VI-X веках?' },
  { test: tests[0], body: 'Легендарное призвание варягов датируется' },
  { test: tests[0], body: 'Объединение Новгорода и Киева состоялось в' },

  { test: tests[1], body: 'Первая мировая война началась' },
  { test: tests[1], body: 'Впервые химическое оружие было применено в битве под' },
  { test: tests[1], body: 'Немецкий генеральный план ведения Первой мировой войны был разработан' },
  { test: tests[1], body: 'Версальский мирный договор был подписан в' },
  { test: tests[1], body: 'Мировой экономический кризис произошел в период' },

  { test: tests[2], body: 'Слизистые оболочки внутренних органов образованы тканью' },
  { test: tests[2], body: 'Основной систематической категорией в биологии является' },
  { test: tests[2], body: 'Мономерами белков являются' },
  { test: tests[2], body: 'Высшим уровнем организации жизни является' },

  { test: tests[3], body: 'Основными источниками финансового права являются' },
  { test: tests[3], body: 'Финансовое право, как отрасль права – это' }
])

Answer.create!([
  { question: questions[0], body: 'Военная демократия', correct: true },
  { question: questions[0], body: 'Теократия' },
  { question: questions[0], body: 'Олигархия' },

  { question: questions[1], body: 'Приуралье и степи юга Евразии' },
  { question: questions[1], body: 'Верхнее течение Днепра и район озера Ильмень', correct: true },
  { question: questions[1], body: 'Земли брянщины и Полесья' },

  { question: questions[2], body: 'Матриархальный' },
  { question: questions[2], body: 'Пол не имел значения, вся полнота власти у верховных жрецов' },
  { question: questions[2], body: 'Патриархальный', correct: true },

  { question: questions[3], body: '862 г.', correct: true },
  { question: questions[3], body: '988 г.' },
  { question: questions[3], body: '911 г.' },

  { question: questions[4], body: '882 г.', correct: true },
  { question: questions[4], body: '879 г.' },
  { question: questions[4], body: '912 г.' },


  { question: questions[5], body: '1916 г.' },
  { question: questions[5], body: '1915 г.' },
  { question: questions[5], body: '1914 г.', correct: true },
  { question: questions[5], body: '1913 г.' },

  { question: questions[6], body: 'Верденом' },
  { question: questions[6], body: 'Ипром', correct: true },
  { question: questions[6], body: 'Марной' },
  { question: questions[6], body: 'Парижем' },

  { question: questions[7], body: 'О. Бисмарком' },
  { question: questions[7], body: 'А. Шлиффеном', correct: true },
  { question: questions[7], body: 'Ф. Фердинандом' },
  { question: questions[7], body: 'Ф. Шехтелем' },

  { question: questions[8], body: '1918 г.' },
  { question: questions[8], body: '1919 г.', correct: true },
  { question: questions[8], body: '1920 г.' },
  { question: questions[8], body: '1921 г.' },

  { question: questions[9], body: '1929 - 1933 гг.', correct: true },
  { question: questions[9], body: '1927 - 1932 гг.' },
  { question: questions[9], body: '1929 - 1935 гг.' },
  { question: questions[9], body: '1931 - 1935 гг.' },


  { question: questions[10], body: 'Эпителиальной', correct: true },
  { question: questions[10], body: 'Соединительной' },
  { question: questions[10], body: 'Мышечной' },

  { question: questions[11], body: 'Отряд' },
  { question: questions[11], body: 'Род' },
  { question: questions[11], body: 'Вид', correct: true },

  { question: questions[12], body: 'Аминокислоты', correct: true },
  { question: questions[12], body: 'Глюкоза' },
  { question: questions[12], body: 'Нуклеотиды' },

  { question: questions[13], body: 'Организменный' },
  { question: questions[13], body: 'Биосферный', correct: true },
  { question: questions[13], body: 'Популяционный' },


  { question: questions[14], body: 'Нормативно-правовые акты', correct: true },
  { question: questions[14], body: 'Международные договоры' },
  { question: questions[14], body: 'Судебная практика' },

  { question: questions[15], body: 'Комплекс норм, регулирующих общественные отношения в сфере финансовой деятельности государства', correct: true },
  { question: questions[15], body: 'Совокупность нормативно-правовых актов, регулирующих общественные отношения в сфере финансовой деятельности государства' },
  { question: questions[15], body: 'Система научных взглядов на правоприменительную практику в сфере финансовой деятельности государства' }
])

Gist.create([
  { user: vasya, question: questions[0], url: 'https://gist.github.com/1152c4e0e09e1f8616c278a1a4a214a3' },
  { user: petya, question: questions[1], url: 'https://gist.github.com/fe9e0ca38d25d69f270119a1f513ed79' }
])
