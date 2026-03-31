---
title: SharedArrayBuffer.prototype.grow()
short-title: grow()
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/grow
page-type: javascript-instance-method
browser-compat: javascript.builtins.SharedArrayBuffer.grow
sidebar: jsref
---

Phương thức **`grow()`** của các instance {{jsxref("SharedArrayBuffer")}} mở rộng `SharedArrayBuffer` đến kích thước được chỉ định, tính bằng byte.

## Cú pháp

```js-nolint
grow(newLength)
```

### Tham số

- `newLength`
  - : Độ dài mới, tính bằng byte, để thay đổi kích thước `SharedArrayBuffer` thành.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `SharedArrayBuffer` không thể mở rộng.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `newLength` lớn hơn {{jsxref("SharedArrayBuffer/maxByteLength", "maxByteLength")}} của `SharedArrayBuffer` hoặc nhỏ hơn {{jsxref("SharedArrayBuffer/byteLength", "byteLength")}}.

## Mô tả

Phương thức `grow()` mở rộng một `SharedArrayBuffer` đến kích thước được chỉ định bởi tham số `newLength`, miễn là `SharedArrayBuffer` [có thể mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/growable) và kích thước mới nhỏ hơn hoặc bằng {{jsxref("SharedArrayBuffer/maxByteLength", "maxByteLength")}} của `SharedArrayBuffer`. Các byte mới được khởi tạo thành 0.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng grow()

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể mở rộng đến tối đa 16 byte, sau đó kiểm tra thuộc tính {{jsxref("SharedArrayBuffer/growable", "growable")}} của nó, mở rộng nếu `growable` trả về `true`:

```js
const buffer = new SharedArrayBuffer(8, { maxByteLength: 16 });

if (buffer.growable) {
  console.log("SAB is growable!");
  buffer.grow(12);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("SharedArrayBuffer")}}
- {{jsxref("SharedArrayBuffer.prototype.growable")}}
- {{jsxref("SharedArrayBuffer.prototype.maxByteLength")}}
