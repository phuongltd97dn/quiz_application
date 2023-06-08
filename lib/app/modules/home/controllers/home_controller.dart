import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_application/app/common/util/exports.dart';
import 'package:quiz_application/app/common/values/app_images.dart';
import 'package:quiz_application/app/common/values/strings.dart';
import 'package:quiz_application/app/data/models/quiz_model/quiz.dart';
import 'package:quiz_application/app/data/models/quiz_model/quiz_response.dart';
import 'package:quiz_application/app/data/repository/api_helper.dart';

class HomeController extends GetxController with StateMixin<List<Quiz>> {
  final ApiHelper _apiHelper = Get.find();

  int elapsedTime = 0;
  late Timer timer;

  RxInt currentIndex = 0.obs;
  Rx<Quiz?> currentQuestion = Quiz().obs;
  RxList<String> currentAnswers = <String>[].obs;
  RxString selectedAnswer = ''.obs;
  RxInt score = 0.obs;

  @override
  void onInit() {
    fetchListQuiz();
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  fetchListQuiz() {
    _apiHelper.getQuizInfo().futureValue((value) {
      final QuizResponse response = QuizResponse.fromJson(value);
      final List<Quiz>? quizs = response.results;

      if (quizs?.isNotEmpty ?? false) {
        currentQuestion.value = quizs?[currentIndex.value];
        updateCurrentAnswer();

        change(quizs, status: RxStatus.success());
        startTimer();
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  updateCurrentAnswer() {
    final incorrects = currentQuestion.value?.incorrectAnswers ?? [];
    final correct = currentQuestion.value?.correctAnswer ?? '';

    currentAnswers.clear();
    currentAnswers.addAll([...incorrects, correct]);
    currentAnswers.shuffle();
    currentAnswers.refresh();
  }

  onAnswerSelected(String answer) {
    selectedAnswer.value = answer;
  }

  onNextPressed() {
    if (checkAnswer()) score.value++;

    if (currentIndex.value < (value?.length ?? 0) - 1) {
      currentIndex.value++;
      currentQuestion.value = value?[currentIndex.value];
      updateCurrentAnswer();
    } else {
      stopTimer();
      final isWinner = (score.value * 2) >= (value?.length ?? 0);

      Utils.showCustomDialog(
        icon: isWinner ? AppImages.medal : AppImages.refresh,
        title: isWinner ? Strings.congratulations : Strings.completed,
        subtitle: isWinner ? Strings.praise : Strings.encouragement,
        result:
            '${score.value}/${value?.length} ${Strings.correctAnswersIn} $elapsedTime ${Strings.seconds}',
        onPlayAgain: () {
          currentIndex.value = 0;
          score.value = 0;
          resetTimer();
          fetchListQuiz();
        },
      );
    }

    selectedAnswer.value = '';
  }

  bool checkAnswer() {
    return selectedAnswer.value == currentQuestion.value?.correctAnswer;
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime++;
    });
  }

  stopTimer() {
    timer.cancel();
  }

  resetTimer() {
    timer.cancel();
    elapsedTime = 0;
  }
}
