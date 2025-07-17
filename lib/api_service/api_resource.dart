class ApiResource<T> {
  int code;
  String message = " ";
  T? data;

  ApiResource(this.code, this.message, this.data);
}
