import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class MCryptBase64 {
  static final key = Key.fromUtf8("0123456789abcdef");
  static final iv = IV.fromUtf8("fedcba9876543210");
  static final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  static final Codec<String, String> stringToBase64 = utf8.fuse(base64);

  static String encrypt(String plainText) {
    if (plainText.isNotEmpty) {
      String encoded = stringToBase64.encode(plainText);
//    print("encoded-> " + encoded);
      final encrypted = encrypter.encrypt(encoded, iv: iv);
//    print("encrypted.base16-> " + encrypted.base16);
      return encrypted.base16;
    } else {
      return "";
    }
  }

  static String decrypt(String encrypted) {
    final decrypted = encrypter.decrypt16(encrypted, iv: iv);
//    print("decrypted-> " + decrypted);
    String decoded = stringToBase64.decode(decrypted);
//    print("decoded-> " + decoded);
    return decoded;
  }
}
