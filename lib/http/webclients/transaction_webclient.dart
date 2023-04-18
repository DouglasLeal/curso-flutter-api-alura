import 'dart:convert';

import 'package:api/http/webclient.dart';
import 'package:api/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    final Response response =
    await client.get(baseUrl.toUri()).timeout(const Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);

    var list = decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();

    return list;
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    print(baseUrl);

    final Response response = await client.post(baseUrl.toUri(),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }
}