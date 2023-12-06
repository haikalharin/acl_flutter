
import '../base_model/pagination.dart';

class ResponseModel<T> {
  int? code;
  int? responseCode;
  String? httpStatus;
  String? statusCode;
  String? responseTime;
  String? message;
  String? action;
  dynamic data;
  Pagination? pagination;

  /// Pagination Manual
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? from;
  int? to;
  List<T>? result;

  ResponseModel({
    this.code,
    this.pagination,
    this.httpStatus,
    this.message,
    this.action,
    this.data,
    this.responseCode,
    this.responseTime,
    this.statusCode,
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    this.result,
  });

  ResponseModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic> json) fromJson) {
    code = json['code'];
    httpStatus = json['httpStatus'];
    message = json['message'];
    action = json['action'];
    responseCode = json['responseCode'];
    responseTime = json['responseTime'];
    statusCode = json['statusCode'];

    if (json["data"] != null) {
      if (json['data'].toString()[0] == "[") {
        data = List<T>.from(json['data'].map((x) => fromJson(x)));
      } else {
        data = fromJson(json['data']);

      }
      var datt = data;
      print(datt);
    }
    if(json["pagination"] != null){
      pagination = Pagination.fromJson(json['pagination']);
    }
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    from = json['from'];
    to = json['to'];
    if (json['result'] != null) {
      result = List<T>.from(json['result'].map((e) => fromJson(e)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['httpStatus'] = this.httpStatus;
    data['message'] = this.message;
    data['action'] = this.action;
    data['responseCode'] = this.responseCode;
    data['responseTime'] = this.responseTime;
    data['statusCode'] = this.statusCode;

    if (this.data != null) {
      if (this.data is List) {
        data['data'] = List<dynamic>.from(this.data.map((e) => e.toJson()));
      } else {
        data['data'] = this.data.toJson();
      }
    }

    if (this.pagination != null) {
      data['pagination'] = this.pagination?.toJson();
    }

    data['total'] = this.total;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['from'] = this.from;
    data['to'] = this.to;

    return data;
  }

  ResponseModel<T> copyWith({
    int? code,
    int? responseCode,
    String? statusCode,
    String? responseTime,
    String? httpStatus,
    String? errorMessage,
    String? action,
    dynamic data,
    Pagination? pagination,
    int? total,
    int? perPage,
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    List<T>? result,
  }) {
    return ResponseModel<T>(
      code: code ?? this.code,
      responseCode: responseCode ?? this.responseCode,
      statusCode: statusCode ?? this.statusCode,
      responseTime: responseTime ?? this.responseTime,
      httpStatus: httpStatus ?? this.httpStatus,
      message: errorMessage ?? this.message,
      action: action ?? this.action,
      data: data ?? this.data,
      total: total ?? this.total,
      pagination: pagination ?? this.pagination,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      result: result ?? this.result,
    );
  }

  static void empty(Map<String, dynamic> json) {
    return;
  }

  static ResponseModel dataEmpty({dynamic data}) {
    return ResponseModel(
     code: 0,
      httpStatus: '',
      message: '',
      data: data,
      action: '',
    );
  }
}
