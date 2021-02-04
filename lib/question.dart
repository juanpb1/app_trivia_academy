class Question {
  String questionText;
  String option1;
  String option2;
  String option3;
  String option4;
  int answer;

  Question(this.questionText, this.option1, this.option2, this.option3,
      this.option4, this.answer);

  static List<Question> getQuestionList() {
    List<Question> questions = [];

    questions.add(
      Question(
        'O que é Flutter?',
        'Lançamento da linha nova de Smartphone',
        'Um Sistema operacional da Google',
        'Linguagem de Progamação da Microsoft',
        'Um SDK de desenvolvimento multiplataforma',
        4,
      ),
    );
    questions.add(
      Question(
        'Qual linguagem de progamação o Flutter usa?',
        'Flutter ++',
        'Dart',
        'C',
        'Java',
        2,
      ),
    );

    return questions;
  }
}
