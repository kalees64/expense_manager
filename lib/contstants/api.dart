// class API {
//   static final String apiUrl = "http://localhost:3000";
// }

// import 'package:http/http.dart' as http;
// import 'dart:convert';

class API {
  static final String baseUrl = "http://127.0.0.1:8000";
}

// static Future<bool> addExpense(
  //   String name,
  //   double amount,
  //   String category,
  //   String date,
  // ) async {
  //   final url = Uri.parse("$baseUrl/expense");

  //   final body = {
  //     "name": name,
  //     "amount": amount,
  //     "category": category,
  //     "date": date,
  //   };

  //   final response = await http.post(
  //     url,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode(body),
  //   );

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return true;
  //   } else {
  //     print({"Error": response.body});
  //     return false;
  //   }
  // }