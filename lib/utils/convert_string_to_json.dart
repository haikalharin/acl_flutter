import 'dart:convert';

Map<String, dynamic> convertStringToJson(String inputString) {
  // Parse the outer JSON
  Map<String, dynamic> outerJson = json.decode(inputString);

  // Extract the inner JSON string and parse it
  String innerJsonString = outerJson['data'];
  Map<String, dynamic> innerJson = json.decode(innerJsonString);

  // Update the outer JSON with the parsed inner JSON
  outerJson['data'] = innerJson;

  return outerJson;
}