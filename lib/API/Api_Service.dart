import 'dart:convert';

import 'package:ecommerce_ui/API/Api_connect.dart';
import 'package:ecommerce_ui/SessionManager.dart';
import 'package:ecommerce_ui/models/getdataKeranjang.dart';
import 'package:ecommerce_ui/models/model_barang.dart';
import 'package:ecommerce_ui/models/model_favorit.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class ServiceApiBarang {
  late SessionManager _sessionManager;

  Future<List<Productse>> getData() async {
    _sessionManager = SessionManager();
    try {
      var idCustomer = await SessionManager.getIdCustomer();
      var idCustomerString = idCustomer?.toString() ?? '';
      final response = await http.post(Uri.parse(ApiConnect.barang), body: {
        'id_customer': idCustomerString
      });
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Productse> data =
            jsonData.map((e) => Productse.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}


class ServiceApiFavorit {
  late SessionManager _sessionManager;

  Future<List<GetDataFav>> getData() async {
    _sessionManager = SessionManager();
    try {
      var idCustomer = await SessionManager.getIdCustomer();
      var idCustomerString = idCustomer?.toString() ?? '';
      final response = await http.post(Uri.parse(ApiConnect.favorit), body: {
        'id_customer': idCustomerString
      });
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        List<GetDataFav> data =
            jsonData.map((e) => GetDataFav.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}


class ServiceApiKeranjang {
  late SessionManager _sessionManager;

  Future<List<GetKeranjang>> getData() async {
    _sessionManager = SessionManager();
    try {
      var idCustomer = await SessionManager.getIdCustomer();
      var idCustomerString = idCustomer?.toString() ?? '';
      final response = await http.post(Uri.parse(ApiConnect.keranjang), body: {
        'id_customer': idCustomerString
      });
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        List<GetKeranjang> data =
            jsonData.map((e) => GetKeranjang.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}