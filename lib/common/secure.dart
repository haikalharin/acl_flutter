import 'package:crypton/crypton.dart';
import 'package:encrypt/encrypt.dart';
const key =
    'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALdlWJTVvwCCffNbXB7lxuwnvnQiSARMGADxOUIt2UHKf2fAuBmazCWnKlImtGiy7+esNMpqLbjxEurxtzidPYkCAwEAAQ==';
const keyDec =
    'MIIBVQIBADANBgkqhkiG9w0BAQEFAASCAT8wggE7AgEAAkEAt2VYlNW/AIJ981tcHuXG7Ce+dCJIBEwYAPE5Qi3ZQcp/Z8C4GZrMJacqUia0aLLv56w0ymotuPES6vG3OJ09iQIDAQABAkBqZivcPZ4Qp6R2+bwaWOjtvakrK3BovdT3RvwXPw5asitMhQRSlVLGH2X/bVyWpDZU0i7tlplh22QRKDgFWHZhAiEA4kag8aXDiIw6RMUCPynfbtFRjE6B4/qAj/DwEwQtrc0CIQDPfLeLJsO3RmgyP1qyz7orGcVggqgvFBBaK9d8Oj/yrQIgWLEGdLFcqzELxdjSwJ9RDMbPCAfdsdaGfeUatNl2biECIQDD5lgRbM87GqHEV2bWDyUSDqn5vkL2+DWcPWqd4w1/nQIhAK3ei0/ITxDmFALF3GItWz4ucvpjM89H/bEypUa9TKcM';
final iv = IV.fromLength(16);

String encrypt(String text) {

  RSAPublicKey publicKey = RSAPublicKey.fromPEM(key);
  return publicKey.encrypt(text);

}

String decrypty(String encryptedString) {
  RSAPrivateKey privatekey = RSAPrivateKey.fromPEM(keyDec);
  return privatekey.decrypt(encryptedString);
}

Future<String> aesDecryptor(String? encryptedValue) async {
  final key = Key.fromUtf8('ePregN4nCy1234!!');
  final iv = IV.fromUtf8("ePregN4nCy1234!!");

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  String decrypted =
      encrypter.decrypt(Encrypted.fromBase64(encryptedValue!), iv: iv);
  return decrypted;
}

// Future<void> aesMethod() async {
//   const plainText = 'Fariz Fadian';
//
//   const test = "O78QdzDgtMS7zRXDky18Xg==";
//
//   final encrypter = aes.Encrypter(aes.AES(key, mode: aes.AESMode.cbc));
//
//   final encrypted = encrypter.encrypt(plainText, iv: iv);
//   print("encrypted : ${encrypted.base64}");
//   final decrypted = encrypter.decrypt(aes.Encrypted.fromBase64(test), iv: iv);
//   print("decrypted : " + decrypted);
// }
