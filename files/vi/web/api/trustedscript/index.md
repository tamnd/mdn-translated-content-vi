---
title: TrustedScript
slug: Web/API/TrustedScript
page-type: web-api-interface
browser-compat: api.TrustedScript
---

{{APIRef("Trusted Types API")}}{{AvailableInWorkers}}

Giao diện **`TrustedScript`** của {{domxref("Trusted Types API", "", "", "nocode")}} đại diện cho một chuỗi có thân script chưa biên dịch mà nhà phát triển có thể chèn vào [injection sink](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage) có thể thực thi script. Các đối tượng này được tạo qua {{domxref("TrustedTypePolicy.createScript","TrustedTypePolicy.createScript()")}} và do đó không có hàm khởi tạo.

Giá trị của đối tượng **TrustedScript** được đặt khi đối tượng được tạo và không thể thay đổi bởi JavaScript vì không có setter được hiển thị.

## Phương thức phiên bản

- {{domxref("TrustedScript.toJSON()")}}
  - : Trả về biểu diễn JSON của dữ liệu được lưu trữ.
- {{domxref("TrustedScript.toString()")}}
  - : Một chuỗi chứa script đã được xử lý an toàn.

## Ví dụ

Hằng số `sanitized` là đối tượng được tạo thông qua chính sách Trusted Types.

```js
const sanitized = scriptPolicy.createScript("eval('2 + 2')");
console.log(sanitized); /* một đối tượng TrustedScript */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Prevent DOM-based cross-site scripting vulnerabilities with Trusted Types](https://web.dev/articles/trusted-types)
