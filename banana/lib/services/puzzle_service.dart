import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/puzzle_model.dart';

class PuzzleService {
  static const String apiUrl = "https://marcconrad.com/uob/banana/api.php";

  static Future<PuzzleModel> fetchPuzzle() async {
    final res = await http.get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      return PuzzleModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Failed to load puzzle");
    }
  }
}
