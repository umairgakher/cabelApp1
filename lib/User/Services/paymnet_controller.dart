// ignore_for_file: unused_field, empty_constructor_bodies, camel_case_types

class userpayment {
  static final userpayment _session = userpayment._internal();
  double? bill;
  factory userpayment() {
    return _session;
  }

  userpayment._internal() {}
}
