---
title: Sec-CH-UA-Mobile header
short-title: Sec-CH-UA-Mobile
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Mobile
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Mobile
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Mobile`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cho biết liệu trình duyệt có đang chạy trên thiết bị di động hay không.
Nó cũng có thể được trình duyệt máy tính để bàn sử dụng để cho biết sở thích về trải nghiệm người dùng "di động".

`Sec-CH-UA-Mobile` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints).
Trừ khi bị chặn bởi chính sách quyền của tác nhân người dùng, nó được gửi theo mặc định mà không cần máy chủ chọn tham gia bằng cách gửi {{HTTPHeader("Accept-CH")}}.

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
Sec-CH-UA-Mobile: <boolean>
```

### Chỉ thị

- `<boolean>`
  - : `?1` cho biết tác nhân người dùng thích trải nghiệm di động (true).
    `?0` cho biết tác nhân người dùng không thích trải nghiệm di động (false).

## Ví dụ

### Sử dụng Sec-CH-UA-Mobile

Vì `Sec-CH-UA-Mobile` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints), nó thường được gửi trong tất cả các yêu cầu.
Trình duyệt máy tính để bàn thường gửi yêu cầu với tiêu đề sau:

```http
Sec-CH-UA-Mobile: ?0
```

Trình duyệt trên thiết bị di động thường gửi yêu cầu với tiêu đề sau:

```http
Sec-CH-UA-Mobile: ?1
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
