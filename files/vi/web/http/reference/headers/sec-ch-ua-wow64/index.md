---
title: Sec-CH-UA-WoW64 header
short-title: Sec-CH-UA-WoW64
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-WoW64
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-WoW64
sidebar: http
---

{{SecureContext_Header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-UA-WoW64`** {{Glossary("Request header", "request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cho biết liệu ứng dụng tác nhân người dùng 32-bit có đang chạy trên máy Windows 64-bit hay không.

[WoW64](https://en.wikipedia.org/wiki/WoW64) thường được dùng để biết trình cài đặt plugin [NPAPI](https://en.wikipedia.org/wiki/NPAPI) nào nên được cung cấp để tải xuống.
Tiêu đề gợi ý máy khách này được sử dụng cho các cân nhắc tương thích ngược, để cung cấp ánh xạ một-một từ chuỗi tác nhân người dùng của một số trình duyệt nhất định sang các gợi ý máy khách UA.

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
Sec-CH-UA-WoW64: <boolean>
```

### Chỉ thị

- `<boolean>`
  - : `?1` cho biết nhị phân của tác nhân người dùng đang chạy ở chế độ 32-bit trên Windows 64-bit (true), trong khi `?0` có nghĩa là không (false).

## Ví dụ

### Sử dụng Sec-CH-UA-WoW64

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-WoW64` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-WoW64
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-WoW64` vào các yêu cầu tiếp theo.
Thêm `Sec-CH-UA-WoW64: ?1` có nghĩa là nhị phân của tác nhân người dùng đang chạy ở chế độ 32-bit trên Windows 64-bit:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA-WoW64: ?1
Sec-CH-UA-Platform: "Windows"
Sec-CH-UA-Form-Factors: "Desktop"
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
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) trên developer.chrome.com
