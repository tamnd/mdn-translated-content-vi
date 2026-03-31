---
title: Keep-Alive header
short-title: Keep-Alive
slug: Web/HTTP/Reference/Headers/Keep-Alive
page-type: http-header
browser-compat: http.headers.Keep-Alive
sidebar: http
---

Tiêu đề HTTP **`Keep-Alive`** {{Glossary("request header", "yêu cầu")}} và {{Glossary("response header", "phản hồi")}} cho phép người gửi gợi ý cách kết nối có thể được sử dụng về thời gian chờ và số lượng yêu cầu tối đa.

> [!NOTE]
> Để `Keep-Alive` có hiệu lực, thông điệp cũng phải bao gồm tiêu đề {{HTTPHeader("Connection", "Connection: keep-alive")}}.

HTTP/1.0 đóng kết nối sau mỗi tương tác yêu cầu/phản hồi theo mặc định, vì vậy các kết nối liên tục trong HTTP/1.0 phải được thỏa thuận rõ ràng.
Một số máy khách và máy chủ có thể muốn tương thích với các phương pháp trước đây đối với kết nối liên tục, và có thể làm điều này với tiêu đề yêu cầu `Connection: keep-alive`.
Các tham số bổ sung cho kết nối có thể được yêu cầu bằng tiêu đề `Keep-Alive`.

> [!WARNING]
> Các trường tiêu đề dành riêng cho kết nối như {{HTTPHeader("Connection")}} và `Keep-Alive` bị cấm trong [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) và [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting).
> Chrome và Firefox bỏ qua chúng trong các phản hồi HTTP/2, nhưng Safari tuân theo các yêu cầu đặc tả HTTP/2 và không tải bất kỳ phản hồi nào chứa chúng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
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
Keep-Alive: <parameters>
```

## Chỉ thị

- `<parameters>`
  - : Danh sách các tham số phân tách bằng dấu phẩy, mỗi tham số bao gồm định danh và giá trị phân tách bằng dấu bằng (`=`).
    Các định danh có thể là:
    - `timeout`
      - : Số nguyên là thời gian tính bằng giây mà máy chủ sẽ cho phép kết nối nhàn rỗi duy trì mở trước khi đóng nó.
        Kết nối nhàn rỗi nếu không có dữ liệu nào được gửi hoặc nhận bởi máy chủ. Máy chủ có thể giữ kết nối nhàn rỗi mở lâu hơn `timeout` giây, nhưng máy chủ nên cố giữ kết nối ít nhất `timeout` giây.
    - `max`
      - : Số nguyên là số yêu cầu tối đa có thể được gửi trên kết nối này trước khi đóng nó.
        Trừ khi `0`, giá trị này bị bỏ qua cho các kết nối không có pipeline vì yêu cầu khác sẽ được gửi trong phản hồi tiếp theo.
        HTTP pipeline có thể sử dụng nó để giới hạn việc pipeline.

## Ví dụ

Phản hồi chứa tiêu đề `Keep-Alive`:

```http
HTTP/1.1 200 OK
Connection: Keep-Alive
Content-Encoding: gzip
Content-Type: text/html; charset=utf-8
Date: Thu, 11 Aug 2016 15:23:13 GMT
Keep-Alive: timeout=5, max=200
Last-Modified: Mon, 25 Jul 2016 04:32:39 GMT
Server: Apache

(body)
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Connection")}}
- [Quản lý kết nối trong HTTP/1.x](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x)
