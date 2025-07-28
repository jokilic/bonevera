sealed class CJVnkState<T> {}

class Initial<T> extends CJVnkState<T> {}

class Loading<T> extends CJVnkState<T> {}

class Empty<T> extends CJVnkState<T> {
  final String? text;

  Empty({
    required this.text,
  });
}

class Error<T> extends CJVnkState<T> {
  final String? error;

  Error({
    required this.error,
  });
}

class Success<T> extends CJVnkState<T> {
  final T data;

  Success({
    required this.data,
  });
}
