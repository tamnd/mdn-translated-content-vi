---
title: "StyleSheet: disabled property"
short-title: disabled
slug: Web/API/StyleSheet/disabled
page-type: web-api-instance-property
browser-compat: api.StyleSheet.disabled
---

{{APIRef("CSSOM")}}

Thuộc tính **`disabled`** của giao diện {{domxref("StyleSheet")}} xác định liệu bảng định kiểu có bị ngăn không cho áp dụng vào tài liệu hay không.

Một bảng định kiểu có thể bị vô hiệu hóa bằng cách đặt thuộc tính này thành `true` thủ công hoặc nếu đó là một [bảng định kiểu thay thế](/en-US/docs/Web/HTML/Reference/Attributes/rel/alternate_stylesheet) không hoạt động. Lưu ý rằng `disabled === false` không đảm bảo bảng định kiểu được áp dụng (ví dụ, nó có thể đã bị xóa khỏi tài liệu).

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
// Nếu bảng định kiểu bị vô hiệu hóa
if (stylesheet.disabled) {
  // Áp dụng định kiểu nội tuyến
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
