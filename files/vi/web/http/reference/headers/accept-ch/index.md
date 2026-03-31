---
title: Accept-CH header
short-title: Accept-CH
slug: Web/HTTP/Reference/Headers/Accept-CH
page-type: http-header
browser-compat: http.headers.Accept-CH
sidebar: http
---

{{securecontext_header}}

Tiêu đề HTTP **`Accept-CH`** {{Glossary("response header", "phản hồi")}} có thể được máy chủ đặt để chỉ định những tiêu đề [client hint](/en-US/docs/Web/HTTP/Guides/Client_hints) nào nên được máy khách bao gồm trong các yêu cầu tiếp theo.
Để đảm bảo các client hint được gửi một cách đáng tin cậy, tiêu đề `Accept-CH` nên được duy trì cho tất cả các yêu cầu an toàn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Accept-CH: <client-hints-headers>

// Các tiêu đề client hint trong danh sách phân tách bằng dấu phẩy
Accept-CH: <ch-header-one>, <ch-header-two>
```

## Ví dụ

### Tiêu đề phản hồi client hint

Các tiêu đề phản hồi sau cho thấy rằng máy chủ chấp nhận `Sec-CH-Viewport-Width` và `Sec-CH-Width` [device client hints](/en-US/docs/Web/HTTP/Guides/Client_hints#device_client_hints) trong các yêu cầu tiếp theo.
Tiêu đề {{HTTPHeader("Vary")}} chỉ ra những giá trị nào được sử dụng để [thay đổi phản hồi](/en-US/docs/Web/HTTP/Guides/Client_hints#caching_and_client_hints) dựa trên các client hint được chấp nhận.

```http
Accept-CH: Sec-CH-Viewport-Width, Sec-CH-Width
Vary: Sec-CH-Viewport-Width, Sec-CH-Width
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Vary")}}
