module TestHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.new_record?
      t('helpers.test.header.create')
    else
      t('helpers.test.header.edit', title: test.title)
    end
  end
end
