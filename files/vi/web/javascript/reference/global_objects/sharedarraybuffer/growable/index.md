---
title: SharedArrayBuffer.prototype.growable
short-title: growable
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/growable
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.SharedArrayBuffer.growable
sidebar: jsref
---

Thuộc tính truy cập **`growable`** của các instance {{jsxref("SharedArrayBuffer")}} trả về liệu `SharedArrayBuffer` này có thể mở rộng hay không.

## Mô tả

Thuộc tính `growable` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng được khởi tạo. Nếu tùy chọn `maxByteLength` được đặt trong constructor, `growable` sẽ trả về `true`; nếu không, nó sẽ trả về `false`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng growable

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể mở rộng đến tối đa 16 byte, sau đó kiểm tra thuộc tính `growable` của nó, mở rộng nếu `growable` trả về `true`:

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
- {{jsxref("SharedArrayBuffer.prototype.grow()")}}
- {{jsxref("SharedArrayBuffer.prototype.maxByteLength")}}
