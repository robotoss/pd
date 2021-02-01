import 'dart:async';
import 'dart:convert';
import 'package:aqueduct_pd/models/request/armtek/detail_search_model.dart';
import 'package:aqueduct_pd/models/response/services/part_model.dart';
import 'package:aqueduct_pd/resources/armtek.dart';
import 'package:http/http.dart' as http;

class ArmtekHelper {
  Future<List<PartModel>> getPartsFromSerach(String partNumber) async {
    List<Resp> armtekResponse = [];
    try {
      // Получаю Модели автомобилей
      final _carModelsResponse = await http.post(
        'http://ws.armtek.ru/api/ws_search/search?format=json',
        headers: {
          'authorization':
              'Basic ${base64Encode(utf8.encode('${ArmtekUser.name}:${ArmtekUser.password}'))}'
        },
        body: {
          "VKORG": ArmtekUser.vkorg,
          "KUNNR_RG": ArmtekUser.kunnr,
          "PIN": partNumber,
        },
      );

      try{
          armtekResponse =
          detailSearchModelFromJson(_carModelsResponse.body).resp;

      
      }catch(error){
        return <PartModel>[];
      }
    return armtekResponse
          .map((part) => PartModel()
            ..catalogPartNumber = part.pin
            ..brand = part.brand
            ..name = part.name
            ..partId = part.artid
            ..partnerStokId = part.parnr
            ..stokId = part.keyzak
            ..avalibleCount = int.parse(part.rvalue
                .replaceAll('<', '')
                .replaceAll('>', '')
                .replaceAll('=', '')
                .replaceAll('ЕСТЬ', '1'))
            ..returnDays = int.parse(part.retdays)
            ..minimumOrder = double.parse(part.minbm)
            ..probability = double.parse(part.vensl)
            ..price = double.parse(part.price)
            ..bestDeliveryDate = DateTime.tryParse(
                    part.dlvdt.isNotEmpty ? part.dlvdt.substring(0, 8) : '')
                .toString()
            ..worseDeliveryDate = part.wrntdt.isNotEmpty
                ? DateTime.tryParse(part.wrntdt.substring(0, 8)).toString()
                : null
            ..isAnalog = part.analog == Analog.X)
          .toList();
     
    } catch (e) {
      print(e);
      return null;
    }
  }
}
