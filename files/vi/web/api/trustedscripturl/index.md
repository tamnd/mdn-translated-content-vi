---
title: TrustedScriptURL
slug: Web/API/TrustedScriptURL
page-type: web-api-interface
browser-compat: api.TrustedScriptURL
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Giao diện **`TrustedScriptURL`** của {{domxref("Trusted Types API", "", "", "nocode")}} đại diện cho một chuỗi mà nhà phát triển có thể chèn vào một [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) sẽ phân tích nó như một URL của một script bên ngoài. Các đối tượng này được tạo thông qua {{domxref("TrustedTypePolicy.createScriptURL","TrustedTypePolicy.createScriptURL()")}} và do đó không có hàm khởi tạo.

Giá trị của một đối tượng `TrustedScriptURL` được đặt khi đối tượng được tạo và không thể thay đổi bởi JavaScript vì không có setter nào được hiển thị.

## Phương thức phiên bản

- {{domxref("TrustedScriptURL.toJSON()")}}
  - : Trả về biểu diễn JSON của dữ liệu được lưu trữ.
- {{domxref("TrustedScriptURL.toString()")}}
  - : Một chuỗi chứa URL đã được làm sạch.

## Ví dụ

Hằng số `sanitized` là một đối tượng được tạo thông qua một chính sách Trusted Types.

```js
const sanitized = scriptPolicy.createScriptURL(
  "https://example.com/my-script.js",
);
console.log(sanitized); /* a TrustedScriptURL object */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Prevent DOM-based cross-site scripting vulnerabilities with Trusted Types](https://web.dev/articles/trusted-types)
