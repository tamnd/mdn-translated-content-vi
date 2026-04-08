---
title: ArrayBuffer.prototype.transferToFixedLength()
short-title: transferToFixedLength()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/transferToFixedLength
page-type: javascript-instance-method
browser-compat: javascript.builtins.ArrayBuffer.transferToFixedLength
sidebar: jsref
---

Phương thức **`transferToFixedLength()`** của các instance {{jsxref("ArrayBuffer")}} tạo một `ArrayBuffer` không thể thay đổi kích thước mới có cùng nội dung byte như buffer này, sau đó tách buffer này.

## Cú pháp

```js-nolint
transferToFixedLength()
transferToFixedLength(newByteLength)
```

### Tham số

- `newByteLength`
  - : {{jsxref("ArrayBuffer/byteLength", "byteLength")}} của `ArrayBuffer` mới. Mặc định là `byteLength` của `ArrayBuffer` này.
    - Nếu `newByteLength` nhỏ hơn `byteLength` của `ArrayBuffer` này, các byte "tràn ra" bị bỏ đi.
    - Nếu `newByteLength` lớn hơn `byteLength` của `ArrayBuffer` này, các byte thêm vào được điền bằng 0.

### Giá trị trả về

Một đối tượng {{jsxref("ArrayBuffer")}} mới. Nội dung của nó được khởi tạo thành nội dung của `ArrayBuffer` này, và các byte thêm vào, nếu có, được điền bằng 0. `ArrayBuffer` mới luôn không thể thay đổi kích thước. `ArrayBuffer` gốc bị tách ra.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `ArrayBuffer` này đã bị tách ra, hoặc nếu nó chỉ có thể bị tách ra bởi các thao tác được chỉ định. Hiện tại, chỉ có một số web API nhất định có khả năng tạo các đối tượng `ArrayBuffer` với các phương thức tách được chỉ định, chẳng hạn như {{domxref("GPUBuffer.getMappedRange()")}} và [`WebAssembly.Memory.buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer).

## Mô tả

Không giống {{jsxref("ArrayBuffer/transfer", "transfer()")}}, `transferToFixedLength()` luôn tạo ra một `ArrayBuffer` không thể thay đổi kích thước. Điều này có nghĩa `newByteLength` có thể lớn hơn `maxByteLength`, ngay cả khi `ArrayBuffer` này có thể thay đổi kích thước. Xem [chuyển ArrayBuffer](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer#transferring_arraybuffers) để biết thêm thông tin.

## Ví dụ

### Chuyển một ArrayBuffer có thể thay đổi kích thước sang độ dài cố định

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const view = new Uint8Array(buffer);
view[1] = 2;
view[7] = 4;

const buffer2 = buffer.transferToFixedLength();
console.log(buffer2.byteLength); // 8
console.log(buffer2.resizable); // false
const view2 = new Uint8Array(buffer2);
console.log(view2[1]); // 2
console.log(view2[7]); // 4
```

Sử dụng `transferToFixedLength`, `newByteLength` có thể lớn hơn `maxByteLength` của `ArrayBuffer` gốc.

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const view = new Uint8Array(buffer);
view[1] = 2;
view[7] = 4;

const buffer2 = buffer.transferToFixedLength(20);
console.log(buffer2.byteLength); // 20
console.log(buffer2.resizable); // false
const view2 = new Uint8Array(buffer2);
console.log(view2[1]); // 2
console.log(view2[7]); // 4
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `ArrayBuffer.prototype.transferToFixedLength` trong `core-js`](https://github.com/zloirock/core-js#arraybufferprototypetransfer-and-friends)
- [es-shims polyfill của `ArrayBuffer.prototype.transferToFixedLength`](https://www.npmjs.com/package/arraybuffer.prototype.transfertofixedlength)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.detached")}}
- {{jsxref("ArrayBuffer.prototype.transfer()")}}
