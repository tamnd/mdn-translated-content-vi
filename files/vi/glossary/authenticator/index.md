---
title: Authenticator
slug: Glossary/Authenticator
page-type: glossary-definition
sidebar: glossarysidebar
---

**Bộ xác thực** (authenticator) là một thực thể có thể thực hiện các thao tác mật mã cần thiết để đăng ký và xác thực người dùng, đồng thời lưu trữ an toàn các khóa mật mã được sử dụng trong các thao tác này.

Bộ xác thực có thể được triển khai bằng phần cứng hoặc phần mềm. Nó có thể được tích hợp vào thiết bị, chẳng hạn hệ thống [Touch ID](https://en.wikipedia.org/wiki/Touch_ID) trong các thiết bị Apple hoặc hệ thống [Windows Hello](https://en.wikipedia.org/wiki/Windows_10#System_security), hoặc có thể là một mô-đun tháo rời như [YubiKey](https://en.wikipedia.org/wiki/YubiKey).

[API Xác thực Web](/en-US/docs/Web/API/Web_Authentication_API) cung cấp cho các trang web bộ xác thực như một phần của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API). Điều này cho phép các trang web sử dụng bộ xác thực để tạo {{glossary("credential", "thông tin xác thực")}} dựa trên {{glossary("public-key cryptography", "mật mã khóa công khai")}}, sau đó có thể được sử dụng để đăng nhập người dùng vào các trang web.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Authentication")}}
  - {{glossary("Credential")}}
