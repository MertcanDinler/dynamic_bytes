import 'package:dynamic_bytes/dynamic_bytes.dart';

class ByteWriter {
  late DynamicBytes _buffer;
  DynamicBytes get buffer => _buffer;

  int _offset = 0;

  /// Return [int] current offset
  int get currentOffset => _offset;

  /// Set writer offset for overwrite existing data. Return [int] old offset.
  int setOffset(int newOffset) {
    final oldOffset = _offset;
    _offset = newOffset;
    return oldOffset;
  }

  ByteWriter([DynamicBytes? buffer]) {
    if (buffer == null) {
      _buffer = DynamicBytes();
    } else {
      _buffer = buffer;
    }
  }

  void _updateOffset(int size) {
    _offset += size;
  }

  /// write bytes
  void write(List<int> bytes) {
    _buffer.setBytes(_offset, bytes);
  }

  /// write a byte
  void writeByte(int byte) {
    _buffer.setUint8(_offset, byte);
    _updateOffset(1);
  }

  /// Write int value
  void writeInt8(int value) {
    _buffer.setInt8(_offset, value);
    _updateOffset(1);
  }

  /// Write int16 value
  void writeInt16(int value) {
    _buffer.setInt16(_offset, value);
    _updateOffset(2);
  }

  /// Write int32 value
  void writeInt32(int value) {
    _buffer.setInt32(_offset, value);
    _updateOffset(4);
  }

  /// Write int64 value
  void writeInt64(int value) {
    _buffer.setInt64(_offset, value);
    _updateOffset(8);
  }

  /// Write unsigned int8 value
  void writeUint8(int value) {
    _buffer.setUint8(_offset, value);
    _updateOffset(1);
  }

  /// Write unsigned int16 value
  void writeUint16(int value) {
    _buffer.setUint16(_offset, value);
    _updateOffset(2);
  }

  /// Write unsigned int32 value
  void writeUint32(int value) {
    _buffer.setUint32(_offset, value);
    _updateOffset(4);
  }

  /// Write unsigned int64 value
  void writeUint64(int value) {
    _buffer.setUint64(_offset, value);
    _updateOffset(8);
  }

  /// Write float32 value
  void writeFloat32(double value) {
    _buffer.setFloat32(_offset, value);
    _updateOffset(4);
  }

  /// Write float64 value
  void writeFloat64(double value) {
    _buffer.setFloat64(_offset, value);
    _updateOffset(8);
  }
}
