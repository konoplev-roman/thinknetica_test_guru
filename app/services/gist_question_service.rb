class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      public: true,
      description: I18n.t('gist.description', test: @test.title),
      files: {
        'thinknetica_test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content << I18n.t('gist.answers')
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
