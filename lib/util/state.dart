sealed class BoneveraState<T> {}

class Initial<T> extends BoneveraState<T> {}

class Loading<T> extends BoneveraState<T> {}

class Empty<T> extends BoneveraState<T> {
  final String? text;

  Empty({
    required this.text,
  });
}

class Error<T> extends BoneveraState<T> {
  final String? error;

  Error({
    required this.error,
  });
}

class Success<T> extends BoneveraState<T> {
  final T data;

  Success({
    required this.data,
  });
}
