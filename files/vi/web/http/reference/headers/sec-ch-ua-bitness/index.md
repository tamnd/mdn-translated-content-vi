---
title: Sec-CH-UA-Bitness header
short-title: Sec-CH-UA-Bitness
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Bitness
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Bitness
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Bitness`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp "số bit" của kiến trúc CPU cơ bản của tác nhân người dùng.
Đây là kích thước tính bằng bit của một số nguyên hoặc địa chỉ bộ nhớ — thường là 64 hoặc 32 bit.

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
Sec-CH-UA-Bitness: <bitness>
```

## Chỉ thị

- `<bitness>`
  - : Chuỗi cho biết số bit kiến trúc nền tảng cơ bản, chẳng hạn: `"64"`, `"32"`.

## Ví dụ

### Sử dụng Sec-CH-UA-Bitness

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Bitness` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Bitness
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Bitness` vào các yêu cầu tiếp theo.
Ví dụ: trên máy tính Windows 64-bit, máy khách có thể thêm tiêu đề như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Platform: "Windows"
Sec-CH-UA-Bitness: "64"
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
