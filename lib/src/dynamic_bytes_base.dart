import 'dart:typed_data';

class DynamicBytes {
  late Uint8List _buffer;

  ByteData? _byteDataInstance;

  ByteData get _byteData {
    _byteDataInstance ??= ByteData.view(_buffer.buffer);
    return _byteDataInstance!;
  }

  int _length = 0;

  int calculateNewSize(int size) {
    return (size % 8) == 0 ? size : size + (8 - (size % 8));
  }

  void _init(int byteOffset, int size) {
    if ((byteOffset + size) > _buffer.length) {
      final newSize = calculateNewSize((byteOffset + size) * 2);
      final newBuffer = Uint8List(newSize);
      newBuffer.setAll(0, _buffer);
      _buffer = newBuffer;
      _byteDataInstance = null;
      _length = (byteOffset + size);
    }
  }

  DynamicBytes([int initialBufferSize = 64]) {
    _buffer = Uint8List(initialBufferSize);
  }

  double getFloat32(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getFloat32, byteOffset, endian);
  }

  double getFloat64(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getFloat64, byteOffset, endian);
  }

  int getInt16(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getInt16, byteOffset, endian);
  }

  int getInt32(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getInt32, byteOffset, endian);
  }

  int getInt64(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getInt64, byteOffset, endian);
  }

  int getInt8(int byteOffset) {
    return _get(_byteData.getInt8, byteOffset);
  }

  int getUint16(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getUint16, byteOffset, endian);
  }

  int getUint32(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getUint32, byteOffset, endian);
  }

  int getUint64(int byteOffset, [Endian endian = Endian.little]) {
    return _get(_byteData.getUint64, byteOffset, endian);
  }

  int getUint8(int byteOffset) {
    return _get(_byteData.getUint8, byteOffset);
  }

  void setFloat32(int byteOffset, double value,
      [Endian endian = Endian.little]) {
    _init(byteOffset, 4);
    _set(_byteData.setFloat32, byteOffset, value, endian);
  }

  void setFloat64(int byteOffset, double value,
      [Endian endian = Endian.little]) {
    _init(byteOffset, 8);
    _set(_byteData.setFloat64, byteOffset, value, endian);
  }

  void setInt16(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 2);
    _set(_byteData.setInt16, byteOffset, value, endian);
  }

  void setInt32(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 4);
    _set(_byteData.setInt32, byteOffset, value, endian);
  }

  void setInt64(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 8);
    _set(_byteData.setInt64, byteOffset, value, endian);
  }

  void setInt8(int byteOffset, int value) {
    _init(byteOffset, 1);
    _set(_byteData.setInt8, byteOffset, value);
  }

  void setUint16(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 2);
    _set(_byteData.setUint16, byteOffset, value, endian);
  }

  void setUint32(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 4);
    _set(_byteData.setUint32, byteOffset, value, endian);
  }

  void setUint64(int byteOffset, int value, [Endian endian = Endian.little]) {
    _init(byteOffset, 8);
    _set(_byteData.setUint64, byteOffset, value, endian);
  }

  void setUint8(int byteOffset, int value) {
    _init(byteOffset, 1);
    _set(_byteData.setUint8, byteOffset, value);
  }

  void _set(Function f, int byteOffset, dynamic value,
      [Endian endian = Endian.little]) {
    if (f == _byteData.setInt8 || f == _byteData.setUint8) {
      f(byteOffset, value);
      return;
    }
    f(byteOffset, value, endian);
  }

  dynamic _get(Function f, int byteOffset, [Endian endian = Endian.little]) {
    if (f == _byteData.setInt8 || f == _byteData.setUint8) {
      return f(byteOffset);
    }
    return f(byteOffset, endian);
  }
}
