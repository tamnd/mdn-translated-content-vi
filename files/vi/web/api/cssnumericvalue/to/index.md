---
title: "CSSNumericValue: to() method"
short-title: to()
slug: Web/API/CSSNumericValue/to
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.to
---

{{APIRef("CSS Typed OM")}}

Phương thức **`to()`** của giao diện {{domxref("CSSNumericValue")}} chuyển đổi một giá trị số từ đơn vị này sang đơn vị khác.

## Cú pháp

```js-nolint
to(unit)
```

### Tham số

- `unit`
  - : Đơn vị mà bạn muốn chuyển đổi sang.

### Giá trị trả về

Một {{domxref('CSSUnitValue')}}.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu đơn vị không hợp lệ được truyền vào phương thức.
- {{jsxref("TypeError")}}
  - : Được ném ra khi:
    - `CSSNumericValue` mà phương thức được gọi trên đó không thể được phân giải về một giá trị và kiểu duy nhất. Điều này có thể xảy ra nếu giá trị được tính từ một biến mà giá trị của biến đó không thể biết trong ngữ cảnh hiện tại.
    - Giá trị không thể chuyển đổi sang đơn vị mới vì không thuộc cùng danh mục. Ví dụ, không thể chuyển đổi mét sang giây.

## Ví dụ

### Sử dụng cơ bản

```js
// In ra "0.608542cm"
console.log(CSS.px("23").to("cm").toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
