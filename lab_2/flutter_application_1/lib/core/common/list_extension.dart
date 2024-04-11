extension ListExtension<T> on List<T> {
  void replaceOrAdd(T item, {required int index}) {
    if (index < length) {
      this[index] = item;
    } else {
      add(item);
    }
  }

  T? getByIndexOrNull(int index) {
    if (index >= length) return null;
    return this[index];
  }

  List<T> concatLists(List<T> lst) {
    final List<T> newLst = [...lst, ...this];
    return newLst;
  }

  T? lastOrNull() => isEmpty ? null : last;

  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

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

  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }

  void addUnique(T item, {bool Function(T item)? equals}) {
    if (equals != null ? (firstWhereOrNull(equals) == null) : !contains(item)) {
      add(item);
    }
  }
}
