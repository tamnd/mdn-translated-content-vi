---
title: SharedArrayBuffer.prototype.maxByteLength
short-title: maxByteLength
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/maxByteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.SharedArrayBuffer.maxByteLength
sidebar: jsref
---

Thuộc tính truy cập **`maxByteLength`** của các instance {{jsxref("SharedArrayBuffer")}} trả về độ dài tối đa (tính bằng byte) mà `SharedArrayBuffer` này có thể được mở rộng đến.

## Mô tả

Thuộc tính `maxByteLength` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng chia sẻ được khởi tạo, được đặt thông qua tùy chọn `maxByteLength` của constructor {{jsxref("SharedArrayBuffer/SharedArrayBuffer", "SharedArrayBuffer()")}}, và không thể thay đổi.

Nếu `SharedArrayBuffer` này được xây dựng mà không chỉ định giá trị `maxByteLength`, thuộc tính này trả về giá trị bằng với giá trị `byteLength` của `SharedArrayBuffer`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng maxByteLength

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể thay đổi kích thước đến tối đa 16 byte, sau đó trả về `maxByteLength` của nó:

```js
const buffer = new SharedArrayBuffer(8, { maxByteLength: 16 });

buffer.maxByteLength; // 16
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("SharedArrayBuffer")}}
