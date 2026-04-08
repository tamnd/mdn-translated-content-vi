---
title: SharedArrayBuffer() constructor
short-title: SharedArrayBuffer()
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/SharedArrayBuffer
page-type: javascript-constructor
browser-compat: javascript.builtins.SharedArrayBuffer.SharedArrayBuffer
sidebar: jsref
---

> [!NOTE]
> Constructor `SharedArrayBuffer` có thể không luôn có sẵn toàn cục trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) nhất định được đáp ứng.

Constructor **`SharedArrayBuffer()`** tạo các đối tượng {{jsxref("SharedArrayBuffer")}}.

## Cú pháp

```js-nolint
new SharedArrayBuffer(length)
new SharedArrayBuffer(length, options)
```

> [!NOTE]
> `SharedArrayBuffer()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `length`
  - : Kích thước, tính bằng byte, của array buffer cần tạo.
- `options` {{optional_inline}}
  - : Một đối tượng, có thể chứa các thuộc tính sau:
    - `maxByteLength` {{optional_inline}}
      - : Kích thước tối đa, tính bằng byte, mà shared array buffer có thể được mở rộng đến.

### Giá trị trả về

Một đối tượng `SharedArrayBuffer` mới có kích thước được chỉ định, với thuộc tính {{jsxref("SharedArrayBuffer/maxByteLength", "maxByteLength")}} của nó được đặt thành `maxByteLength` được chỉ định nếu có được chỉ định. Nội dung của nó được khởi tạo thành 0.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng cơ bản

Tạo một buffer với kích thước được chỉ định tính bằng byte.

```js
// Create a SharedArrayBuffer with a size in bytes
const buffer = new SharedArrayBuffer(8);

console.log(buffer.byteLength); // 8
```

### Luôn sử dụng toán tử new để tạo SharedArrayBuffer

Các constructor `SharedArrayBuffer` cần được khởi tạo với toán tử {{jsxref("Operators/new", "new")}}. Gọi constructor `SharedArrayBuffer` như một hàm mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

```js example-bad
const sab = SharedArrayBuffer(1024);
// TypeError: calling a builtin SharedArrayBuffer constructor
// without new is forbidden
```

```js example-good
const sab = new SharedArrayBuffer(1024);
```

### Mở rộng một SharedArrayBuffer có thể mở rộng

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể mở rộng đến tối đa 16 byte, sau đó {{jsxref("SharedArrayBuffer/grow", "grow()")}} nó lên 12 byte:

```js
const buffer = new SharedArrayBuffer(8, { maxByteLength: 16 });

buffer.grow(12);
```

> [!NOTE]
> Khuyến nghị rằng `maxByteLength` được đặt thành giá trị nhỏ nhất có thể cho trường hợp sử dụng của bạn. Nó không bao giờ nên vượt quá `1073741824` (1GB), để giảm nguy cơ lỗi hết bộ nhớ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("ArrayBuffer")}}
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
