---
title: "TrustedScriptURL: phương thức toString()"
short-title: toString()
slug: Web/API/TrustedScriptURL/toString
page-type: web-api-instance-method
browser-compat: api.TrustedScriptURL.toString
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("TrustedScriptURL")}} trả về một chuỗi có thể được chèn vào một [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) một cách an toàn.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa URL đã được làm sạch.

## Ví dụ

Hằng số `sanitized` là một đối tượng được tạo thông qua một chính sách Trusted Types. Phương thức `toString()` trả về một chuỗi để sử dụng an toàn khi tải một script bên thứ ba.

```js
const sanitized = scriptPolicy.createScriptURL(
  "https://example.com/my-script.js",
);
console.log(sanitized.toString());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
