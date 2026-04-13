---
title: "TrustedScriptURL: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/TrustedScriptURL/toJSON
page-type: web-api-instance-method
browser-compat: api.TrustedScriptURL.toJSON
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("TrustedScriptURL")}} trả về biểu diễn JSON của dữ liệu được lưu trữ.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi chứa biểu diễn JSON của dữ liệu được lưu trữ.

## Ví dụ

Hằng số `sanitized` là một đối tượng được tạo thông qua một chính sách Trusted Types. Phương thức `toString()` trả về một chuỗi để sử dụng an toàn khi tải một script bên thứ ba.

```js
const sanitized = scriptPolicy.createScriptURL(
  "https://example.com/my-script.js",
);
console.log(sanitized.toJSON());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
