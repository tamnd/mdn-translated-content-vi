---
title: HTTP
slug: Glossary/HTTP
page-type: glossary-definition
sidebar: glossarysidebar
---

HyperText Transfer Protocol (**HTTP**) là {{glossary("protocol","giao thức")}} mạng cơ bản cho phép truyền tải các tài liệu siêu phương tiện trên {{glossary("World Wide Web","Web")}}, thường giữa trình duyệt và máy chủ để con người có thể đọc chúng. Phiên bản hiện tại của đặc tả HTTP được gọi là {{glossary("HTTP_2", "HTTP/2")}}.

Là một phần của {{glossary("URI")}}, "http" trong "http\://example.com/" được gọi là "scheme" (giao thức). Các tài nguyên sử dụng scheme "http" thường được truyền qua các kết nối không được mã hóa sử dụng giao thức HTTP. Scheme "https" (như trong "https\://developer.mozilla.org") chỉ ra rằng một tài nguyên được truyền bằng giao thức HTTP, nhưng qua kênh {{glossary("TLS")}} bảo mật.

HTTP là giao thức dạng văn bản (mọi giao tiếp đều dưới dạng văn bản thuần túy) và phi trạng thái (mỗi yêu cầu không nhận biết các yêu cầu trước đó). Đặc điểm này làm cho nó lý tưởng để con người đọc tài liệu (trang web) trên Web. Tuy nhiên, HTTP cũng có thể dùng làm nền tảng cho các dịch vụ web {{glossary("REST")}} giữa các máy chủ, hoặc cho các yêu cầu {{domxref("Window/fetch", "fetch()")}} trong trang web để làm chúng trở nên động hơn.

## Xem thêm

- [HTTP trên MDN](/en-US/docs/Web/HTTP)
- [HTTP](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol) trên Wikipedia
