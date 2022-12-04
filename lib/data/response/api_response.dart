import 'package:vitrapp/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.initial() : status = Status.INITIAL;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data \n";
  }
}

class ApiResponseViajes<V> {
  Status? status;
  V? data;
  String? message;

  ApiResponseViajes(this.status, this.data, this.message);

  ApiResponseViajes.loading() : status = Status.LOADING;

  ApiResponseViajes.initial() : status = Status.INITIAL;

  ApiResponseViajes.completed(this.data) : status = Status.COMPLETED;

  ApiResponseViajes.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data \n";
  }
}

class ApiResponseHistorialR<H> {
  Status? status;
  H? data;
  String? message;

  ApiResponseHistorialR(this.status, this.data, this.message);

  ApiResponseHistorialR.loading() : status = Status.LOADING;

  ApiResponseHistorialR.initial() : status = Status.INITIAL;

  ApiResponseHistorialR.completed(this.data) : status = Status.COMPLETED;

  ApiResponseHistorialR.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data \n";
  }
}

class ApiResponseHistorialV<HV> {
  Status? status;
  HV? data;
  String? message;

  ApiResponseHistorialV(this.status, this.data, this.message);

  ApiResponseHistorialV.loading() : status = Status.LOADING;

  ApiResponseHistorialV.initial() : status = Status.INITIAL;

  ApiResponseHistorialV.completed(this.data) : status = Status.COMPLETED;

  ApiResponseHistorialV.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data \n";
  }
}

class ApiResponseLogin<L> {
  Status? status;
  L? data;
  String? message;

  ApiResponseLogin(this.status, this.data, this.message);

  ApiResponseLogin.loading() : status = Status.LOADING;

  ApiResponseLogin.initial() : status = Status.INITIAL;

  ApiResponseLogin.completed(this.data) : status = Status.COMPLETED;

  ApiResponseLogin.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Message:$message \n Data: $data \n";
  }
}
