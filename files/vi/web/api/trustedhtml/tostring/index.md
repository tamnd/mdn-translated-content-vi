---
title: "TrustedHTML: toString() method"
short-title: toString()
slug: Web/API/TrustedHTML/toString
page-type: web-api-instance-method
browser-compat: api.TrustedHTML.toString
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("TrustedHTML")}} trả về một chuỗi có thể chèn an toàn vào injection sink.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa HTML đã được xử lý an toàn.

## Ví dụ

Hằng số `escaped` là đối tượng được tạo thông qua chính sách Trusted Types escapeHTMLPolicy. Phương thức `toString()` trả về chuỗi để chèn an toàn vào tài liệu.

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");
console.log(escaped.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
