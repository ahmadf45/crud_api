import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/kontakModel.dart';

class KontakApi {
  String ip = "192.168.43.41:3000";
  List<Kontak> parseData(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['values'].cast<Map<String, dynamic>>();
    //print(parsed);
    return parsed.map<Kontak>((json) => Kontak.fromJson(json)).toList();
  }

  kirimHasil(String responseBody) {
    final parsed = jsonDecode(responseBody)['values'];
    //print(parsed);
    return parsed;
  }

  Future<List<Kontak>> fetchData() async {
    try {
      final response = await http.get("http://$ip/daftar");
      if (response.statusCode == 200) {
        return parseData(response.body);
      } else {
        //print(response.statusCode.toString());
        throw Exception('Failed to load ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error $e');
      // print('Timeout Error : $e');
    } on SocketException catch (e) {
      throw Exception('Socket Error $e');
      //print('Socket Error: $e');
    } on Error catch (e) {
      throw Exception('General Error $e');
      //print('General Error: $e');
    }
  }

  Future<Kontak> buatData(String nama, String noHp, String email) async {
    final response = await http.post("http://$ip/buat", body: {
      "nama": nama,
      "no_hp": noHp,
      "email": email,
    });

    if (response.statusCode == 200) {
      print(response.body.toString());
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  ubahData(String nama, String noHp, String email, int id) async {
    final response = await http.put("http://$ip/ubah", body: {
      "nama": nama,
      "no_hp": noHp,
      "email": email,
      "id": id.toString(),
    });
    //return kirimHasil(response.body);
    if (response.statusCode == 200) {
      //return kirimHasil(response.body);
      print(jsonDecode(response.body)['values'].toString());
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  hapusData(int id) async {
    final response =
        await http.delete("http://$ip/hapus", headers: {"id": id.toString()});
    //return kirimHasil(response.body);
    if (response.statusCode == 200) {
      //return kirimHasil(response.body);
      print(jsonDecode(response.body)['values'].toString());
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
