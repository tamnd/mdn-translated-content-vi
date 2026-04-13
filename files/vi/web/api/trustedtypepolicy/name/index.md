---
title: "TrustedTypePolicy: name property"
short-title: name
slug: Web/API/TrustedTypePolicy/name
page-type: web-api-instance-property
browser-compat: api.TrustedTypePolicy.name
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("TrustedTypePolicy")}} trả về tên của chính sách.

## Giá trị

Chuỗi chứa tên của chính sách.

## Ví dụ

Trong ví dụ dưới đây, một chính sách có tên `myEscapePolicy` được tạo bằng {{domxref("TrustedTypePolicyFactory.createPolicy()")}} và được biểu diễn bởi đối tượng `escapeHTMLPolicy`. Gọi `name` trên đối tượng này trả về chuỗi "myEscapePolicy".

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

console.log(escapeHTMLPolicy.name); /* "myEscapePolicy" */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
