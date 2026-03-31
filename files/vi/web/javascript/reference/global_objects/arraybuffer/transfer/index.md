---
title: ArrayBuffer.prototype.transfer()
short-title: transfer()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/transfer
page-type: javascript-instance-method
browser-compat: javascript.builtins.ArrayBuffer.transfer
sidebar: jsref
---

Phương thức **`transfer()`** của các instance {{jsxref("ArrayBuffer")}} tạo một `ArrayBuffer` mới có cùng nội dung byte như buffer này, sau đó tách buffer này.

## Cú pháp

```js-nolint
transfer()
transfer(newByteLength)
```

### Tham số

- `newByteLength` {{optional_inline}}
  - : {{jsxref("ArrayBuffer/byteLength", "byteLength")}} của `ArrayBuffer` mới. Mặc định là `byteLength` của `ArrayBuffer` này.
    - Nếu `newByteLength` nhỏ hơn `byteLength` của `ArrayBuffer` này, các byte "tràn ra" bị bỏ đi.
    - Nếu `newByteLength` lớn hơn `byteLength` của `ArrayBuffer` này, các byte thêm vào được điền bằng 0.
    - Nếu `ArrayBuffer` này có thể thay đổi kích thước, `newByteLength` không được lớn hơn {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của nó.

### Giá trị trả về

Một đối tượng {{jsxref("ArrayBuffer")}} mới. Nội dung của nó được khởi tạo thành nội dung của `ArrayBuffer` này, và các byte thêm vào, nếu có, được điền bằng 0. `ArrayBuffer` mới có thể thay đổi kích thước nếu và chỉ khi `ArrayBuffer` này có thể thay đổi kích thước, trong trường hợp đó {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của nó giống như của `ArrayBuffer` này. `ArrayBuffer` gốc bị tách ra.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `ArrayBuffer` này có thể thay đổi kích thước và `newByteLength` lớn hơn {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của `ArrayBuffer` này.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `ArrayBuffer` này đã bị tách ra, hoặc nếu nó chỉ có thể bị tách ra bởi các thao tác được chỉ định. Hiện tại, chỉ có một số web API nhất định có khả năng tạo các đối tượng `ArrayBuffer` với các phương thức tách được chỉ định, chẳng hạn như {{domxref("GPUBuffer.getMappedRange()")}} và [`WebAssembly.Memory.buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer).

## Mô tả

Phương thức `transfer()` thực hiện cùng thao tác như [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm). Nó sao chép các byte của `ArrayBuffer` này vào một đối tượng `ArrayBuffer` mới, sau đó tách đối tượng `ArrayBuffer` này. Xem [chuyển ArrayBuffer](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer#transferring_arraybuffers) để biết thêm thông tin.

`transfer()` bảo toàn khả năng thay đổi kích thước của `ArrayBuffer` này. Nếu bạn muốn `ArrayBuffer` mới không thể thay đổi kích thước, hãy sử dụng {{jsxref("ArrayBuffer/transferToFixedLength", "transferToFixedLength()")}} thay thế. Không có cách nào để chuyển một buffer khiến buffer có độ dài cố định trở nên có thể thay đổi kích thước.

`transfer()` rất hiệu quả vì các triển khai có thể triển khai phương thức này như một di chuyển zero-copy hoặc `realloc` — không cần phải có bản sao thực sự của dữ liệu.

## Ví dụ

### Chuyển một ArrayBuffer

```js
// Create an ArrayBuffer and write a few bytes
const buffer = new ArrayBuffer(8);
const view = new Uint8Array(buffer);
view[1] = 2;
view[7] = 4;

// Copy the buffer to the same size
const buffer2 = buffer.transfer();
console.log(buffer.detached); // true
console.log(buffer2.byteLength); // 8
const view2 = new Uint8Array(buffer2);
console.log(view2[1]); // 2
console.log(view2[7]); // 4

// Copy the buffer to a smaller size
const buffer3 = buffer2.transfer(4);
console.log(buffer3.byteLength); // 4
const view3 = new Uint8Array(buffer3);
console.log(view3[1]); // 2
console.log(view3[7]); // undefined

// Copy the buffer to a larger size
const buffer4 = buffer3.transfer(8);
console.log(buffer4.byteLength); // 8
const view4 = new Uint8Array(buffer4);
console.log(view4[1]); // 2
console.log(view4[7]); // 0

// Already detached, throws TypeError
buffer.transfer(); // TypeError: Cannot perform ArrayBuffer.prototype.transfer on a detached ArrayBuffer
```

### Chuyển một ArrayBuffer có thể thay đổi kích thước

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const view = new Uint8Array(buffer);
view[1] = 2;
view[7] = 4;

// Copy the buffer to a smaller size
const buffer2 = buffer.transfer(4);
console.log(buffer2.byteLength); // 4
console.log(buffer2.maxByteLength); // 16
const view2 = new Uint8Array(buffer2);
console.log(view2[1]); // 2
console.log(view2[7]); // undefined
buffer2.resize(8);
console.log(view2[7]); // 0

// Copy the buffer to a larger size within maxByteLength
const buffer3 = buffer2.transfer(12);
console.log(buffer3.byteLength); // 12

// Copy the buffer to a larger size than maxByteLength
buffer3.transfer(20); // RangeError: Invalid array buffer length
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `ArrayBuffer.prototype.transfer` trong `core-js`](https://github.com/zloirock/core-js#arraybufferprototypetransfer-and-friends)
- [es-shims polyfill của `ArrayBuffer.prototype.transfer`](https://www.npmjs.com/package/arraybuffer.prototype.transfer)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.detached")}}
- {{jsxref("ArrayBuffer.prototype.transferToFixedLength()")}}
