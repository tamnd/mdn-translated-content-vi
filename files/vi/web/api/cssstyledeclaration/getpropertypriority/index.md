---
title: "CSSStyleDeclaration: phương thức getPropertyPriority()"
short-title: getPropertyPriority()
slug: Web/API/CSSStyleDeclaration/getPropertyPriority
page-type: web-api-instance-method
browser-compat: api.CSSStyleDeclaration.getPropertyPriority
---

{{ APIRef("CSSOM") }}

Phương thức giao diện **CSSStyleDeclaration.getPropertyPriority()** trả về một chuỗi cung cấp tất cả các độ ưu tiên được thiết lập rõ ràng trên thuộc tính CSS.

## Cú pháp

```js-nolint
getPropertyPriority(property)
```

### Tham số

- `property`
  - : Một chuỗi đại diện cho tên thuộc tính cần kiểm tra.

### Giá trị trả về

Một chuỗi đại diện cho độ ưu tiên (ví dụ: `"important"`) nếu tồn tại.
Nếu không tồn tại, trả về chuỗi rỗng.

## Ví dụ

Mã JavaScript sau đây kiểm tra xem `margin` có được đánh dấu là important trong một quy tắc bộ chọn CSS hay không:

```js
const declaration = document.styleSheets[0].cssRules[0].style;
const isImportant = declaration.getPropertyPriority("margin") === "important";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
