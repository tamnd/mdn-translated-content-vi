---
title: Xác minh kiểu MIME
slug: Web/Security/Practical_implementation_guides/MIME_types
page-type: guide
sidebar: security
---

Tiêu đề [`X-Content-Type-Options`](/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options) thông báo cho trình duyệt không tải các script và stylesheet trừ khi máy chủ chỉ ra đúng [kiểu MIME](/en-US/docs/Glossary/MIME_type).

## Vấn đề

Nếu không xác minh kiểu MIME đúng cách, trình duyệt có thể nhận diện sai các tệp không phải script và không phải stylesheet thành script hoặc stylesheet. Lỗi này cho phép các tệp có khả năng độc hại được tải qua các phần tử {{htmlelement("script")}} và {{htmlelement("link")}} như một phần của các cuộc tấn công Cross-site scripting ({{Glossary("Cross-site_scripting", "XSS")}}).

## Giải pháp

Tất cả các trang web phải đặt tiêu đề `X-Content-Type-Options` với giá trị `nosniff`, và đặt các kiểu MIME phù hợp cho các tệp mà chúng phục vụ (tức là, qua tiêu đề [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type)).

`nosniff` chặn một yêu cầu nếu đích đến của yêu cầu:

- là kiểu `style` và kiểu MIME không phải `text/css`.
- là kiểu `script` và kiểu MIME không phải là một [kiểu MIME JavaScript](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript) hợp lệ.

## Ví dụ

Ngăn trình duyệt nhận diện sai các tệp không phải stylesheet thành stylesheet và các tệp không phải script thành script:

```http
X-Content-Type-Options: nosniff
```

## Xem thêm

- [Kiểu MIME (kiểu media IANA): MIME sniffing](/en-US/docs/Web/HTTP/Guides/MIME_types#mime_sniffing)
- [Cấu hình đúng kiểu MIME của máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Configuring_server_MIME_types)
