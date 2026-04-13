---
title: "Sanitizer: phương thức setDataAttributes()"
short-title: setDataAttributes()
slug: Web/API/Sanitizer/setDataAttributes
page-type: web-api-instance-method
browser-compat: api.Sanitizer.setDataAttributes
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`setDataAttributes()`** của giao diện {{domxref("Sanitizer")}} đặt liệu tất cả [các thuộc tính `data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) có được phép bởi bộ làm sạch, hay chúng phải được chỉ định riêng lẻ.

Nếu được đặt `true`, các thuộc tính dữ liệu được tự động cho phép và bạn không nên thêm chúng riêng lẻ bằng {{domxref('Sanitizer.allowAttribute()')}} (hoặc {{domxref('Sanitizer.allowElement()')}} cho các thuộc tính cục bộ).

Lưu ý rằng phương thức này hữu ích cho [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) có nhiều thuộc tính `data-*` mà bạn muốn cho phép.
Phương thức trả về `false` khi dùng với các cấu hình xóa, vốn có thể cho phép tất cả các thuộc tính `data-*` chỉ đơn giản bằng cách bỏ qua chúng.

## Cú pháp

```js-nolint
setDataAttributes(allow);
```

### Tham số

- `allow`
  - : `true` nếu tất cả các thuộc tính `data-*` được phép, và `false` nếu chúng phải được chỉ định rõ ràng.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình, và `false` nếu cấu hình đã đặt [`dataAttributes`](/en-US/docs/Web/API/SanitizerConfig#dataattributes) theo giá trị được chỉ định hoặc `dataAttributes` không thể được đặt `true` vì bộ làm sạch này có cấu hình xóa.

## Ví dụ

### Sử dụng cơ bản

Mã dưới đây cho thấy cách sử dụng cơ bản của phương thức `setDataAttributes()`.

```js
// Tạo bộ làm sạch (trong trường hợp này là mặc định)
const sanitizer = new Sanitizer();

// Cho phép tất cả thuộc tính data-*
sanitizer.setDataAttributes(true);

// Thuộc tính data-* được cho phép bằng cách thêm chúng
// vào mảng attributes
sanitizer.setDataAttributes(false);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
