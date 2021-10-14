import 'dart:convert';

import 'package:tarrif/infrastructure/helpers/my_logger.dart';
import 'package:tarrif/models/car_model.dart';
import 'package:tarrif/utilities/constants/restful_endpoints.dart';
import 'package:http/http.dart' as http;

abstract class Repository {
  Future<List<CarModel>> getCars();
}

class CarRepository extends Repository {
  @override
  Future<List<CarModel>> getCars() async {
    final List<CarModel> _cars = [];
    final uri = Uri.parse(RestFullEndpoints.baseUrl);
    final response = await http.get(uri);
    final decoded = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(decoded);

    for (Map<String, dynamic> data in jsonData) {
      logger.v(CarModel.fromJson(data).car.picturecardurlSmall);
      _cars.add(
        CarModel.fromJson(data),
      );
    }

    return _cars;
  }
}
