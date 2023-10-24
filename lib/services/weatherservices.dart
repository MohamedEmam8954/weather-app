import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weatherservices {
  Dio dio;
  Weatherservices(this.dio);
  String baseurl = "http://api.weatherapi.com";
  String apikey = "106734fa3fd24a2ca5f204618232310";
  getcurrentweather({required String city_name}) async {
    try {
      Response response = await dio
          .get("$baseurl/v1/forecast.json?key=$apikey&q=$city_name&days=1");
      var weathermodel = Weathermodel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      String errormessage;
      errormessage = e.response?.data["error"]["message"] ??
          "obs there is an error!!, try later";
      print(errormessage);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
