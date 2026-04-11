---
title: "ElementInternals: validationMessage property"
short-title: validationMessage
slug: Web/API/ElementInternals/validationMessage
page-type: web-api-instance-property
browser-compat: api.ElementInternals.validationMessage
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("ElementInternals")}} trả về thông báo xác thực của phần tử.

## Giá trị

Một chuỗi chứa thông báo xác thực của phần tử này.

## Ví dụ

Trong ví dụ sau, thông báo xác thực được đặt bằng {{domxref("ElementInternals.setValidity()")}}, sau đó được trả về bằng `validationMessage`.

```js
this.internals_.setValidity({ valueMissing: true }, "my message");
console.log(this.internals_.validationMessage); // "my message"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
