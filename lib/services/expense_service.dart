import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:expense_manager/contstants/api.dart';

final apiUrl = API.baseUrl;

class ExpenseService {
  static Future<bool> addExpense(
    String name,
    double amount,
    String category,
    String date,
  ) async {
    final url = Uri.parse("$apiUrl/expense");

    final body = {
      "name": name,
      "amount": amount,
      "category": category,
      "date": date,
    };

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print({"Error": response.body});
      return false;
    }
  }
}
