# frozen_string_literal: true

users = User.create!([
  { name: 'Вася' },
  { name: 'Петя' }
])

categories = Category.create!([
  { title: 'История' },
  { title: 'Биология' },
  { title: 'Финансовое право' }
])

tests = Test.create!([
  { category_id: categories[0].id, title: 'Древняя Русь', level: 1 },
  { category_id: categories[0].id, title: 'Всемирная история', level: 2 },
  { category_id: categories[1].id, title: 'Общие темы', level: 3 },
  { category_id: categories[2].id, title: 'Общие темы', level: 5 }
])

PassedTest.create([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[1].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[3].id }
])

questions = Question.create!([
  { test_id: tests[0].id, body: 'Укажите общественно-политический строй, господствовавший у древних славян до призвания варягов' },
  { test_id: tests[0].id, body: 'Наиболее крупными центрами расселения восточнославянских племенных союзов являлись' },
  { test_id: tests[0].id, body: 'Как характеризуется уклад жизни древних славян в VI-X веках?' },
  { test_id: tests[0].id, body: 'Легендарное призвание варягов датируется' },
  { test_id: tests[0].id, body: 'Объединение Новгорода и Киева состоялось в' },

  { test_id: tests[1].id, body: 'Первая мировая война началась' },
  { test_id: tests[1].id, body: 'Впервые химическое оружие было применено в битве под' },
  { test_id: tests[1].id, body: 'Немецкий генеральный план ведения Первой мировой войны был разработан' },
  { test_id: tests[1].id, body: 'Версальский мирный договор был подписан в' },
  { test_id: tests[1].id, body: 'Мировой экономический кризис произошел в период' },

  { test_id: tests[2].id, body: 'Слизистые оболочки внутренних органов образованы тканью' },
  { test_id: tests[2].id, body: 'Основной систематической категорией в биологии является' },
  { test_id: tests[2].id, body: 'Мономерами белков являются' },
  { test_id: tests[2].id, body: 'Высшим уровнем организации жизни является' },

  { test_id: tests[3].id, body: 'Основными источниками финансового права являются' },
  { test_id: tests[3].id, body: 'Финансовое право, как отрасль права – это' }
])

Answer.create!([
  { question_id: questions[0].id, body: 'Военная демократия', correct: true },
  { question_id: questions[0].id, body: 'Теократия' },
  { question_id: questions[0].id, body: 'Олигархия' },

  { question_id: questions[1].id, body: 'Приуралье и степи юга Евразии' },
  { question_id: questions[1].id, body: 'Верхнее течение Днепра и район озера Ильмень', correct: true },
  { question_id: questions[1].id, body: 'Земли брянщины и Полесья' },

  { question_id: questions[2].id, body: 'Матриархальный' },
  { question_id: questions[2].id, body: 'Пол не имел значения, вся полнота власти у верховных жрецов' },
  { question_id: questions[2].id, body: 'Патриархальный', correct: true },

  { question_id: questions[3].id, body: '862 г.', correct: true },
  { question_id: questions[3].id, body: '988 г.' },
  { question_id: questions[3].id, body: '911 г.' },

  { question_id: questions[4].id, body: '882 г.', correct: true },
  { question_id: questions[4].id, body: '879 г.' },
  { question_id: questions[4].id, body: '912 г.' },


  { question_id: questions[5].id, body: '1916 г.' },
  { question_id: questions[5].id, body: '1915 г.' },
  { question_id: questions[5].id, body: '1914 г.', correct: true },
  { question_id: questions[5].id, body: '1913 г.' },

  { question_id: questions[6].id, body: 'Верденом' },
  { question_id: questions[6].id, body: 'Ипром', correct: true },
  { question_id: questions[6].id, body: 'Марной' },
  { question_id: questions[6].id, body: 'Парижем' },

  { question_id: questions[7].id, body: 'О. Бисмарком' },
  { question_id: questions[7].id, body: 'А. Шлиффеном', correct: true },
  { question_id: questions[7].id, body: 'Ф. Фердинандом' },
  { question_id: questions[7].id, body: 'Ф. Шехтелем' },

  { question_id: questions[8].id, body: '1918 г.' },
  { question_id: questions[8].id, body: '1919 г.', correct: true },
  { question_id: questions[8].id, body: '1920 г.' },
  { question_id: questions[8].id, body: '1921 г.' },

  { question_id: questions[9].id, body: '1929 - 1933 гг.', correct: true },
  { question_id: questions[9].id, body: '1927 - 1932 гг.' },
  { question_id: questions[9].id, body: '1929 - 1935 гг.' },
  { question_id: questions[9].id, body: '1931 - 1935 гг.' },


  { question_id: questions[10].id, body: 'Эпителиальной', correct: true },
  { question_id: questions[10].id, body: 'Соединительной' },
  { question_id: questions[10].id, body: 'Мышечной' },

  { question_id: questions[11].id, body: 'Отряд' },
  { question_id: questions[11].id, body: 'Род' },
  { question_id: questions[11].id, body: 'Вид', correct: true },

  { question_id: questions[12].id, body: 'Аминокислоты', correct: true },
  { question_id: questions[12].id, body: 'Глюкоза' },
  { question_id: questions[12].id, body: 'Нуклеотиды' },

  { question_id: questions[13].id, body: 'Организменный' },
  { question_id: questions[13].id, body: 'Биосферный', correct: true },
  { question_id: questions[13].id, body: 'Популяционный' },


  { question_id: questions[14].id, body: 'Нормативно-правовые акты', correct: true },
  { question_id: questions[14].id, body: 'Международные договоры' },
  { question_id: questions[14].id, body: 'Судебная практика' },

  { question_id: questions[15].id, body: 'Комплекс норм, регулирующих общественные отношения в сфере финансовой деятельности государства', correct: true },
  { question_id: questions[15].id, body: 'Совокупность нормативно-правовых актов, регулирующих общественные отношения в сфере финансовой деятельности государства' },
  { question_id: questions[15].id, body: 'Система научных взглядов на правоприменительную практику в сфере финансовой деятельности государства' }
])
