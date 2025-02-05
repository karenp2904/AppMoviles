class Stack<T> {
  final List<T> _stack = [];

  void push(T value) => _stack.add(value);
  T pop() => _stack.removeLast();
  T get top => _stack.last;
  bool get isEmpty => _stack.isEmpty;
  int get length => _stack.length;
}
