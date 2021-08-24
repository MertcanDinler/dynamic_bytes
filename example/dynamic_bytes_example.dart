import 'package:dynamic_bytes/dynamic_bytes.dart';

void main() {
  var bytes = DynamicBytes();
  bytes.setInt64(0, 1);
  bytes.setInt8(15, 5);
}
