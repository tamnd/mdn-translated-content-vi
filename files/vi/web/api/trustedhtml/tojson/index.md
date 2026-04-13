---
title: "TrustedHTML: toJSON() method"
short-title: toJSON()
slug: Web/API/TrustedHTML/toJSON
page-type: web-api-instance-method
browser-compat: api.TrustedHTML.toJSON
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("TrustedHTML")}} trả về biểu diễn JSON của dữ liệu được lưu trữ.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa biểu diễn JSON của dữ liệu được lưu trữ.

## Ví dụ

Hằng số `escaped` là đối tượng được tạo thông qua chính sách Trusted Types escapeHTMLPolicy. Phương thức `toString()` trả về chuỗi để chèn an toàn vào tài liệu.

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) => string.replace(/</g, "&lt;"),
});

const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");
console.log(escaped.toJSON());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
