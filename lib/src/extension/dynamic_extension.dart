extension DynamicExtension on dynamic {
  bool get hasEmpty {
    if (this == null) return true;
    if ((this is Map || this is List) && this.length == 0) return true;
    if ((this is Map || this is Iterable) && this.isEmpty) return true;
    if (this is bool) return !this;

    return this.isEmpty;
  }
}
