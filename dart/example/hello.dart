void main() {
  MyClass? c;
  final value = c?.myField.name;
  print(value);
}

class MyClass<T> {
  MyClass(this.myField);

  final Hello<T> myField;
}

typedef Hello<T> = (T, {T name});