---
title: Site
slug: Glossary/Site
page-type: glossary-definition
sidebar: glossarysidebar
---

Theo nghĩa thông thường, _site_ (trang web) là một website, là tập hợp các trang web được phục vụ từ cùng một tên miền và được duy trì bởi một tổ chức duy nhất, được xác định bởi {{Glossary("registrable domain","tên miền có thể đăng ký")}} của nó.

Trình duyệt đôi khi cần phân biệt chính xác giữa các site khác nhau. Ví dụ, trình duyệt chỉ được gửi cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) đến cùng site đã đặt chúng.

Đối với định nghĩa chính xác hơn này, một site được xác định bởi phần _tên miền có thể đăng ký_ của tên miền. Tên miền có thể đăng ký bao gồm một mục trong [Public Suffix List](https://publicsuffix.org/list/) cộng với phần tên miền ngay trước nó. Điều này có nghĩa là, ví dụ, `theguardian.co.uk`, `sussex.ac.uk` và `bookshop.org` đều là các tên miền có thể đăng ký.

Theo định nghĩa này, `support.mozilla.org` và `developer.mozilla.org` là cùng một site, vì `mozilla.org` là tên miền có thể đăng ký.

Trong một số ngữ cảnh, scheme cũng được xem xét khi phân biệt các site. Điều này sẽ làm cho `http://vpl.ca` và `https://vpl.ca` là các site khác nhau. Việc bao gồm scheme ngăn một site không an toàn (HTTP) được coi là cùng site với site an toàn (HTTPS). Định nghĩa có xem xét scheme đôi khi được gọi là _schemeful same-site_. Định nghĩa nghiêm ngặt hơn này được áp dụng trong các quy tắc xử lý cookie [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value).

> [!NOTE]
> Trình duyệt đôi khi đưa ra quyết định bảo mật (ví dụ, quyết định tài nguyên nào một script có thể truy cập) dựa trên {{Glossary("Origin","Nguồn gốc")}} của tài nguyên. Đây là khái niệm hạn chế hơn so với site, bao gồm scheme, toàn bộ tên miền và cổng. Xem thêm [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

## Ví dụ

Đây là cùng site vì tên miền có thể đăng ký của `mozilla.org` là giống nhau:

- `https://developer.mozilla.org/en-US/docs/`
- `https://support.mozilla.org/en-US/`

Đây được coi là cùng site vì số cổng bị bỏ qua khi xác định site:

- `https://example.com:8080`
- `https://example.com`

Đây không phải là cùng site vì tên miền có thể đăng ký của hai URL khác nhau:

- `https://developer.mozilla.org/en-US/docs/`
- `https://example.com`

Đây là cùng site, hoặc các site khác nhau nếu scheme được xem xét:

- `http://example.com`
- `https://example.com`

## Xem thêm

- [URL là gì](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
- Các thuật ngữ liên quan:
  - {{Glossary("Origin")}}
  - {{Glossary("Registrable domain")}}
- [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
