
void main() {
  // final c = MyClass(() => Value((1, name: 1, t: (1, ))));
  // final value = c.myField()?.value.name;
  // print(c);
  register(fun(1, ''));
  
  // map['hi'] = fun(1);
}

final map = <String, Hello>{};

void register<T>(Hello<T> hi) {
  map['hi'] = hi;
}

typedef Hello<T> = ({void Function(T) name});

Hello<T> fun<T>(T i) => (name: print);

// class MyClass<T, C> {
//   MyClass(this.myField);

//   final Value<Hello<T, C>>? Function() myField;
// }

class Value<T> {
  Value(this.value);

  final T value;
}

// typedef Hello<T, C> = (T, {T name, Other<C> t});
typedef Other<T> = (T,);


// final gameType = Provider.autoDispose<String>(
//   (ref) {
//     final type = ref.watch(gameProvider).asData?.value.name;
//     if (type == null) {
//       return '';
//     }
//     return 'other';
//   },
// );

// final gameProvider = FutureProvider<Hello>((ref) => (name: 1));