import 'package:base_project_getx/utils/translations/en_MX/es_mx_translations.dart';
import 'package:base_project_getx/utils/translations/en_US/en_us_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'es_mx': esMx
  };
}
