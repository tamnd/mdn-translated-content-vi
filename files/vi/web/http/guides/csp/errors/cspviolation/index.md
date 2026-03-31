---
title: "Content Security Policy: The page's settings blocked the loading of a resource: xyz"
slug: Web/HTTP/Guides/CSP/Errors/CSPViolation
page-type: guide
sidebar: http
---

Cảnh báo "Content Security Policy: The page's settings blocked the loading of a resource: xyz" xảy ra khi cấu hình CSP của trang được cung cấp bởi `xyz` ngăn tài nguyên được tải vào ngữ cảnh của tài liệu.

## Thông báo

### Firefox

`Content Security Policy: The pages settings blocked the loading of a resource: xyz`

với:

- `xyz`
  - : Tên của chỉ thị CSP đã chặn tài nguyên. Điều này có thể được biểu thị là chỉ tên của chỉ thị, hoặc là toàn bộ chuỗi chỉ thị chính sách.
- `uvw`
  - : Văn bản cung cấp thông tin có thể giúp bạn giải quyết vấn đề, có thể bao gồm các thay đổi cụ thể bạn có thể thực hiện đối với cấu hình CSP.

### Chrome

- `Refused to apply inline style because it violates the following Content Security Policy Directive: "xyz". uvw.`
- `Refused to execute inline script because it violates the following Content Security Policy directive: "xyz". uvw.`
- `Refused to run the JavaScript URL because it violates the following Content Security Policy directive: "xyz". uvw.`
- `Refused to execute inline event handler because it violates the following Content Security Policy directive: "xyz". uvw.`

với:

- `xyz`
  - : Tên của chỉ thị CSP đã chặn tài nguyên. Điều này có thể được biểu thị là chỉ tên của chỉ thị, hoặc là toàn bộ chuỗi chỉ thị chính sách.
- `uvw`
  - : Văn bản cung cấp thông tin có thể giúp bạn giải quyết vấn đề, có thể bao gồm các thay đổi cụ thể bạn có thể thực hiện đối với cấu hình CSP.

## Điều gì đã xảy ra sai?

Thông báo cảnh báo này có nghĩa là do sự tồn tại của một chỉ thị CSP cụ thể, một tài nguyên không được tải.

## Xem thêm

- [Lỗi và cảnh báo CSP](/en-US/docs/Web/HTTP/Guides/CSP/Errors)
- [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP)
- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
