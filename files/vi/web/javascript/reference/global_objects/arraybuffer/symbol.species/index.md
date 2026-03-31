---
title: ArrayBuffer[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.ArrayBuffer.@@species
sidebar: jsref
---

Thuộc tính truy cập tĩnh **`ArrayBuffer[Symbol.species]`** trả về constructor được dùng để tạo các giá trị trả về từ các phương thức array buffer.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng làm cho một số tối ưu hóa trở nên khó hơn nhiều. Các nhà triển khai engine đang [điều tra xem có nên xóa tính năng này không](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy tránh dựa vào nó nếu có thể.

## Cú pháp

```js-nolint
ArrayBuffer[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên đó. Giá trị trả về được sử dụng để tạo các giá trị trả về từ các phương thức array buffer tạo ra các array buffer mới.

## Mô tả

Thuộc tính truy cập `[Symbol.species]` trả về constructor mặc định cho các đối tượng `ArrayBuffer`. Các constructor lớp con có thể ghi đè nó để thay đổi phân công constructor. Triển khai mặc định về cơ bản là:

```js
// Hypothetical underlying implementation for illustration
class ArrayBuffer {
  static get [Symbol.species]() {
    return this;
  }
}
```

Vì triển khai đa hình này, `[Symbol.species]` của các lớp con dẫn xuất cũng sẽ trả về chính constructor theo mặc định.

```js
class SubArrayBuffer extends ArrayBuffer {}
SubArrayBuffer[Symbol.species] === SubArrayBuffer; // true
```

Khi gọi các phương thức array buffer không làm thay đổi đối tượng hiện có nhưng trả về một instance array buffer mới (ví dụ, [`slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/slice)), `constructor[Symbol.species]` của đối tượng sẽ được truy cập. Constructor được trả về sẽ được dùng để tạo giá trị trả về của phương thức array buffer.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là constructor `ArrayBuffer` cho `ArrayBuffer`.

```js
ArrayBuffer[Symbol.species]; // function ArrayBuffer()
```

### Species trong các đối tượng dẫn xuất

Trong một instance của lớp con `ArrayBuffer` tùy chỉnh, chẳng hạn như `MyArrayBuffer`, species của `MyArrayBuffer` là constructor `MyArrayBuffer`. Tuy nhiên, bạn có thể muốn ghi đè điều này, để trả về các đối tượng `ArrayBuffer` cha trong các phương thức lớp dẫn xuất của bạn:

```js
class MyArrayBuffer extends ArrayBuffer {
  // Overwrite MyArrayBuffer species to the parent ArrayBuffer constructor
  static get [Symbol.species]() {
    return ArrayBuffer;
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("ArrayBuffer")}}
- {{jsxref("Symbol.species")}}
