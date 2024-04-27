import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String,Map<String,String>> get keys=>{
    'en_US':{
      'message':'what is flutter?',
      'ans':'Flutter is framework',
    },
    'ur_PK':{
      'message':'فلٹر کیا ہے؟',
      'ans':'فلٹر فریم ورک ہے',
    }
  };
}