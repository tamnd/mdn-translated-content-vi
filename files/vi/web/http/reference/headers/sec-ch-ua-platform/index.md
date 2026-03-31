---
title: Sec-CH-UA-Platform header
short-title: Sec-CH-UA-Platform
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Platform
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Platform
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Platform`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp nền tảng hoặc hệ điều hành mà tác nhân người dùng đang chạy trên đó.
Ví dụ: "Windows" hoặc "Android".

`Sec-CH-UA-Platform` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints).
Trừ khi bị chặn bởi chính sách quyền của tác nhân người dùng, nó được gửi theo mặc định (mà không cần máy chủ chọn tham gia bằng cách gửi {{HTTPHeader("Accept-CH")}}).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Client hint</a>
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-CH-UA-Platform: <platform>
```

### Chỉ thị

- `<platform>`
  - : Một trong các chuỗi sau: `"Android"`, `"Chrome OS"`, `"Chromium OS"`, `"iOS"`, `"Linux"`, `"macOS"`, `"Windows"`, hoặc `"Unknown"`.

## Ví dụ

### Sử dụng Sec-CH-UA-Platform

Vì `Sec-CH-UA-Platform` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints), nó thường được gửi trong tất cả các yêu cầu.
Trình duyệt chạy trên máy tính macOS có thể thêm tiêu đề sau vào tất cả các yêu cầu.

```http
Sec-CH-UA-Platform: "macOS"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
