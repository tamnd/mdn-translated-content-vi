---
title: Trailer header
short-title: Trailer
slug: Web/HTTP/Reference/Headers/Trailer
page-type: http-header
browser-compat: http.headers.Trailer
sidebar: http
---

Tiêu đề HTTP **Trailer** {{glossary("request header", "request")}} và {{glossary("response header")}} cho phép người gửi bao gồm các trường bổ sung ở cuối các thông điệp phân khúc để cung cấp siêu dữ liệu có thể được tạo động trong khi phần thân thông điệp đang được gửi.

> [!NOTE]
> Tiêu đề yêu cầu {{HTTPHeader("TE")}} cần được đặt thành `trailers` để cho phép các trường trailer.

> [!WARNING]
> Nhà phát triển không thể truy cập HTTP trailers qua Fetch API hoặc XHR.
> Ngoài ra, trình duyệt bỏ qua HTTP trailers, ngoại trừ {{HTTPHeader("Server-Timing")}}.
> Xem [Tương thích trình duyệt](#browser_compatibility) để biết thêm thông tin.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}},
        {{Glossary("Content header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Trailer: header-names
```

## Chỉ thị

- `header-names`
  - : Các trường tiêu đề HTTP sẽ có mặt trong phần trailer của các thông điệp phân khúc.
    Các tên tiêu đề sau **không được phép**:
    - {{HTTPHeader("Content-Encoding")}}, {{HTTPHeader("Content-Type")}}, {{HTTPHeader("Content-Range")}}, và `Trailer`
    - Tiêu đề xác thực (ví dụ, {{HTTPHeader("Authorization")}} hoặc {{HTTPHeader("Set-Cookie")}})
    - Tiêu đề đóng khung thông điệp (ví dụ, {{HTTPHeader("Transfer-Encoding")}} và {{HTTPHeader("Content-Length")}})
    - Tiêu đề định tuyến (ví dụ, {{HTTPHeader("Host")}})
    - Bộ điều chỉnh yêu cầu (ví dụ, điều khiển và điều kiện, như {{HTTPHeader("Cache-Control")}}, {{HTTPHeader("Max-Forwards")}}, hoặc {{HTTPHeader("TE")}})

## Ví dụ

### Server-Timing như HTTP trailer

Một số trình duyệt hỗ trợ hiển thị dữ liệu server timing trong công cụ dành cho nhà phát triển khi tiêu đề {{HTTPHeader("Server-Timing")}} được gửi dưới dạng trailer.
Trong phản hồi sau, tiêu đề `Trailer` được sử dụng để cho biết rằng tiêu đề `Server-Timing` sẽ theo sau phần thân phản hồi.
Một chỉ số `custom-metric` với thời gian `123.4` mili giây được gửi:

```http
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Trailer: Server-Timing

--- response body ---
Server-Timing: custom-metric;dur=123.4
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Server-Timing")}}
- {{HTTPHeader("Transfer-Encoding")}}
- {{HTTPHeader("TE")}}
- [Chunked transfer encoding](https://en.wikipedia.org/wiki/Chunked_transfer_encoding)
