import 'quiz.dart';

class QuizResponse {
  int? responseCode;
  List<Quiz>? results;

  QuizResponse({this.responseCode, this.results});

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        responseCode: json['response_code'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'responseCode': responseCode,
      };
}
