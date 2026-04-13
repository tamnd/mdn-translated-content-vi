---
title: "Sanitizer: phương thức setComments()"
short-title: setComments()
slug: Web/API/Sanitizer/setComments
page-type: web-api-instance-method
browser-compat: api.Sanitizer.setComments
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`setComments()`** của giao diện {{domxref("Sanitizer")}} đặt liệu các chú thích có được phép hay bị xóa bởi bộ làm sạch.

## Cú pháp

```js-nolint
setComments(allow);
```

### Tham số

- `allow`
  - : `true` nếu chú thích được phép, và `false` nếu chúng cần bị xóa.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình, và `false` nếu cấu hình đã đặt [`comments`](/en-US/docs/Web/API/SanitizerConfig#comments) theo giá trị được chỉ định.

## Ví dụ

### Cách làm sạch các chú thích

Mã dưới đây cho thấy cách sử dụng cơ bản của phương thức `setComments()`.

```js
// Tạo bộ làm sạch (trong trường hợp này là mặc định)
const sanitizer = new Sanitizer();

// Cho phép chú thích
sanitizer.setComments(true);

// Xóa chú thích
sanitizer.setComments(false);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
