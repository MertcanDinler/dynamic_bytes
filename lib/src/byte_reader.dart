import 'package:dynamic_bytes/dynamic_bytes.dart';

class ByteReader {
  late DynamicBytes _buffer;
  DynamicBytes get buffer => _buffer;

  int _offset = 0;

  /// Return [int] current offset
  int get currentOffset => _offset;

  /// Set reader offset. Return [int] old offset.
  int setOffset(int newOffset) {
    final oldOffset = _offset;
    _offset = newOffset;
    return oldOffset;
  }

  ByteReader(DynamicBytes buffer) {
    _buffer = buffer;
  }

  void _updateOffset(int size) {
    _offset += size;
  }

  /// read bytes
  List<int> read(int length) {
    return _buffer.getBytes(_offset, length);
  }

  /// read a byte
  int readByte() => readUint8();

  /// read int value
  int readInt8() {
    _updateOffset(1);
    return _buffer.getInt8(_offset);
  }

  /// read int16 value
  int readInt16() {
    _updateOffset(2);
    return _buffer.getInt16(_offset);
  }

  /// read int32 value
  int readInt32() {
    _updateOffset(4);
    return _buffer.getInt32(_offset);
  }

  /// read int64 value
  int readInt64() {
    _updateOffset(8);
    return _buffer.getInt64(_offset);
  }

  /// read unsigned int8 value
  int readUint8() {
    _updateOffset(1);
    return _buffer.getUint8(_offset);
  }

  /// read unsigned int16 value
  int readUint16() {
    _updateOffset(2);
    return _buffer.getUint16(_offset);
  }

  /// read unsigned int32 value
  int readUint32() {
    _updateOffset(4);
    return _buffer.getUint32(_offset);
  }

  /// read unsigned int64 value
  int readUint64() {
    _updateOffset(8);
    return _buffer.getUint64(_offset);
  }

  /// read float32 value
  double readFloat32() {
    _updateOffset(4);
    return _buffer.getFloat32(_offset);
  }

  /// read float64 value
  double readFloat64() {
    _updateOffset(8);
    return _buffer.getFloat64(_offset);
  }
}
