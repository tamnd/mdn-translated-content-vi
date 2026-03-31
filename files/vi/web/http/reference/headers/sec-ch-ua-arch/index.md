---
title: Sec-CH-UA-Arch header
short-title: Sec-CH-UA-Arch
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Arch
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Arch
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Arch`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) chứa kiến trúc CPU cơ bản của tác nhân người dùng, chẳng hạn như ARM hoặc x86.

Ví dụ, máy chủ có thể dùng thông tin này để chọn và cung cấp định dạng nhị phân phù hợp của tệp thực thi cho người dùng tải xuống.

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
Sec-CH-UA-Arch: <arch>
```

### Chỉ thị

- `<arch>`
  - : Chuỗi cho biết kiến trúc nền tảng cơ bản, chẳng hạn: `"x86"`, `"ARM"`, `"[arm64-v8a, armeabi-v7a, armeabi]"`.

## Ví dụ

### Sử dụng Sec-CH-UA-Arch

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Arch` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong phản hồi cho một yêu cầu từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Arch
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Arch` vào các yêu cầu tiếp theo.
Ví dụ: trên máy tính Windows X86, máy khách có thể thêm tiêu đề như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Platform: "Windows"
Sec-CH-UA-Arch: "x86"
```

Lưu ý rằng [các tiêu đề entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints) được thêm vào yêu cầu ngay cả khi không được chỉ định trong phản hồi của máy chủ.

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
