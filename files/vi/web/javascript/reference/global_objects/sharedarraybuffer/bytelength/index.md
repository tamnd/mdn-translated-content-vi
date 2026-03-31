---
title: SharedArrayBuffer.prototype.byteLength
short-title: byteLength
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/byteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.SharedArrayBuffer.byteLength
sidebar: jsref
---

Thuộc tính truy cập **`byteLength`** của các instance {{jsxref("SharedArrayBuffer")}} trả về độ dài (tính bằng byte) của `SharedArrayBuffer` này.

## Mô tả

Thuộc tính `byteLength` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng chia sẻ được khởi tạo và không thể thay đổi.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng byteLength

```js
const sab = new SharedArrayBuffer(1024);
sab.byteLength; // 1024
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("SharedArrayBuffer")}}
