class PuzzleModel {
  final String image;
  final int answer;

  PuzzleModel({required this.image, required this.answer});

  factory PuzzleModel.fromJson(Map<String, dynamic> json) {
    return PuzzleModel(
      image: json["question"],
      answer: json["solution"],
    );
  }
}
