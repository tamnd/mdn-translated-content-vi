---
title: HTTP
slug: Glossary/HTTP
page-type: glossary-definition
sidebar: glossarysidebar
---

HyperText Transfer Protocol (**HTTP**) là {{glossary("protocol","giao thức")}} mạng cơ bản cho phép truyền tải các tài liệu siêu phương tiện trên {{glossary("World Wide Web","Web")}}, thường giữa trình duyệt và máy chủ để con người có thể đọc chúng. Phiên bản hiện tại của đặc tả HTTP được gọi là {{glossary("HTTP_2", "HTTP/2")}}.

Là một phần của {{glossary("URI")}}, "http" trong "http\://example.com/" được gọi là "scheme" (giao thức). Các tài nguyên sử dụng scheme "http" thường được truyền qua các kết nối không được mã hóa sử dụng giao thức HTTP. Scheme "https" (như trong "https\://developer.mozilla.org") chỉ ra rằng một tài nguyên được truyền bằng giao thức HTTP, nhưng qua kênh {{glossary("TLS")}} bảo mật.

HTTP là văn bản (tất cả giao tiếp được thực hiện bằng văn bản thuần túy) và không trạng thái (không có giao tiếp nào nhận biết các giao tiếp trước đó). Thuộc tính này làm cho nó lý tưởng để con người đọc các tài liệu (trang web) trên world wide web. Tuy nhiên, HTTP cũng có thể được sử dụng làm cơ sở cho các dịch vụ web {{glossary("REST")}} từ máy chủ đến máy chủ hoặc các yêu cầu {{domxref("Window/fetch", "fetch()")}} trong các trang web để làm cho chúng động hơn.

## Xem thêm

- [HTTP trên MDN](/en-US/docs/Web/HTTP)
- [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) trên Wikipedia
