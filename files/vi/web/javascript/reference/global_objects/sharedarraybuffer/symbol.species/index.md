---
title: SharedArrayBuffer[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.SharedArrayBuffer.@@species
sidebar: jsref
---

Thuộc tính accessor static **`SharedArrayBuffer[Symbol.species]`** trả về constructor được dùng để tạo các giá trị trả về từ các phương thức của `SharedArrayBuffer`.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng khiến một số tối ưu hóa trở nên khó khăn hơn nhiều. Các nhà phát triển engine đang [xem xét có nên loại bỏ tính năng này hay không](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy tránh phụ thuộc vào nó nếu có thể.

## Cú pháp

```js-nolint
SharedArrayBuffer[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên đó. Giá trị trả về được dùng để tạo các giá trị trả về từ các phương thức array buffer tạo ra array buffer mới.

## Mô tả

Thuộc tính accessor `[Symbol.species]` trả về constructor mặc định cho các đối tượng `SharedArrayBuffer`. Các constructor của subclass có thể ghi đè nó để thay đổi việc gán constructor. Cài đặt mặc định về cơ bản là:

```js
// Cài đặt nền tảng giả định để minh họa
class SharedArrayBuffer {
  static get [Symbol.species]() {
    return this;
  }
}
```

Nhờ vào cài đặt đa hình này, `[Symbol.species]` của các subclass dẫn xuất cũng sẽ mặc định trả về chính constructor đó.

```js
class SubArrayBuffer extends SharedArrayBuffer {}
SubArrayBuffer[Symbol.species] === SubArrayBuffer; // true
```

Khi gọi các phương thức array buffer không làm thay đổi array hiện có mà trả về một instance array buffer mới (ví dụ, [`slice()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/slice)), `constructor[Symbol.species]` của array sẽ được truy cập. Constructor được trả về sẽ được dùng để tạo giá trị trả về của phương thức array buffer.

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là constructor `SharedArrayBuffer` cho `SharedArrayBuffer`.

```js
SharedArrayBuffer[Symbol.species]; // function SharedArrayBuffer()
```

### Species trong các đối tượng dẫn xuất

Trong một instance của subclass `SharedArrayBuffer` tùy chỉnh, chẳng hạn `MySharedArrayBuffer`, species của `MySharedArrayBuffer` là constructor `MySharedArrayBuffer`. Tuy nhiên, bạn có thể muốn ghi đè điều này để trả về các đối tượng `SharedArrayBuffer` cha trong các phương thức của lớp dẫn xuất:

```js
class MySharedArrayBuffer extends SharedArrayBuffer {
  // Ghi đè species của MySharedArrayBuffer thành constructor SharedArrayBuffer cha
  static get [Symbol.species]() {
    return SharedArrayBuffer;
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("SharedArrayBuffer")}}
- {{jsxref("Symbol.species")}}
