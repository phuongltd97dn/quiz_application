class Quiz {
  String? category;
  String? type;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Quiz({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        category: json['category'] as String?,
        type: json['type'] as String?,
        difficulty: json['difficulty'] as String?,
        question: json['question'] as String?,
        correctAnswer: json['correct_answer'] as String?,
        incorrectAnswers: (json['incorrect_answers'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'type': type,
        'difficulty': difficulty,
        'question': question,
        'correctAnswer': correctAnswer,
        'incorrectAnswers': incorrectAnswers,
      };
}
