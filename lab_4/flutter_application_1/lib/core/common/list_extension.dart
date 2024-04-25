extension ListExtension<T> on List<T> {
  // Замінює елемент у списку за вказаним індексом або додає, якщо індекс більший за довжину списку.
  void replaceOrAdd(T item, {required int index}) {
    if (index < length) {
      this[index] = item;
    } else {
      add(item);
    }
  }

  // Повертає елемент за індексом або null, якщо індекс виходить за межі довжини списку.
  T? getByIndexOrNull(int index) {
    if (index >= length) return null;
    return this[index];
  }

  // Об'єднує два списки в один.
  List<T> concatLists(List<T> lst) {
    final List<T> newLst = [...lst, ...this];
    return newLst;
  }

  // Повертає останній елемент списку або null, якщо список порожній.
  T? lastOrNull() => isEmpty ? null : last;

  // Повертає перший елемент, який задовольняє умову, або null, якщо жоден елемент не задовольняє умову.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  // Повертає останній елемент списку або null, якщо список порожній.
  T? lastWhereOrNull(bool Function(T element) test) {
    for (final element in reversed) {
      if (test(element)) return element;
    }

    return null;
  }

  T? get firstOrNull {
    final iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }
  // Зменшує довжину списку до заданої кількості елементів.
  List<T> decreaseLengthToTheExectNumber(int count) {
    List<T> arr = [...this];
    if (length <= count) return arr;
    int divisions = length - count;
    final step = length / (divisions + 1);
    double cursor = step;
    while (divisions-- > 0) {
      arr = splice(arr, cursor.floor(), 1);
      cursor += step - 1;
    }
    return arr;
  }
  // Видаляє з першого списку елементи, які також містяться у другому списку.
  List<T> splice(List<T> list, int index, [num howMany = 0]) {
    final endIndex = index + howMany.truncate();
    list.removeRange(index, endIndex >= list.length ? list.length : endIndex);
    return list;
  }

  // The elements from the first array should be removed if they appear in the second
  // this: [1, 5, 9], arr: [5, 6], return: [1, 9]
  List<T> removeIfContaints(List<T> arr) {
    final toDeleteSet = arr.toSet();
    final newArr = where((el) => !toDeleteSet.contains(el)).toList();
    return newArr;
  }
  // Повертає суму значень, які отримуються за допомогою функції f для кожного елемента списку.
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }

  // Додає елемент у список, якщо він унікальний, згідно функції equals, або якщо функція equals не задана - якщо елемент ще не міститься в списку.
  void addUnique(T item, {bool Function(T item)? equals}) {
    if (equals != null ? (firstWhereOrNull(equals) == null) : !contains(item)) {
      add(item);
    }
  }
}
