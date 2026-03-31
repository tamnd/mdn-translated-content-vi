---
title: Connection header
short-title: Connection
slug: Web/HTTP/Reference/Headers/Connection
page-type: http-header
browser-compat: http.headers.Connection
sidebar: http
---

Tiêu đề HTTP **`Connection`** kiểm soát xem kết nối mạng có tiếp tục mở sau khi giao dịch hiện tại kết thúc không.
Nếu giá trị được gửi là `keep-alive`, kết nối là liên tục và không bị đóng, cho phép các yêu cầu tiếp theo đến cùng máy chủ trên cùng kết nối.

> [!WARNING]
> Các trường tiêu đề đặc thù kết nối như `Connection` và {{HTTPHeader("Keep-Alive")}} bị cấm trong [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) và [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting).
> Chrome và Firefox bỏ qua chúng trong các phản hồi HTTP/2, nhưng Safari tuân thủ các yêu cầu thông số kỹ thuật HTTP/2 và không tải bất kỳ phản hồi nào chứa chúng.

Tất cả các tiêu đề hop-by-hop, bao gồm cả [các tiêu đề hop-by-hop](/en-US/docs/Web/HTTP/Reference/Headers#hop-by-hop_headers) tiêu chuẩn ({{HTTPHeader("Keep-Alive")}}, {{HTTPHeader("Transfer-Encoding")}}, {{HTTPHeader("TE")}}, `Connection`, {{HTTPHeader("Trailer")}}, {{HTTPHeader("Upgrade")}}, {{HTTPHeader("Proxy-Authorization")}}, và {{HTTPHeader("Proxy-Authenticate")}}) phải được liệt kê trong tiêu đề `Connection`, để proxy đầu tiên biết rằng nó phải tiêu thụ chúng và không chuyển tiếp chúng.

Giá trị mặc định của `Connection` đã thay đổi giữa HTTP/1.0 và HTTP/1.1.
Do đó, để đảm bảo khả năng tương thích ngược, các trình duyệt thường gửi `Connection: keep-alive` một cách rõ ràng, ngay cả khi đó là mặc định trong HTTP/1.1.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header", "Tiêu đề yêu cầu")}},
        {{Glossary("Response header", "Tiêu đề phản hồi")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Connection: keep-alive
Connection: close
```

## Chỉ thị

- `close`
  - : Chỉ ra rằng máy khách hoặc máy chủ muốn đóng kết nối. Đây là mặc định trong các yêu cầu HTTP/1.0.
- bất kỳ danh sách phân tách bằng dấu phẩy nào của các tiêu đề HTTP (thường chỉ là `keep-alive`)
  - : Chỉ ra rằng máy khách muốn giữ kết nối mở. Giữ kết nối mở là mặc định trong các yêu cầu HTTP/1.1. Danh sách các tiêu đề là tên của tiêu đề cần được xóa bởi proxy không minh bạch đầu tiên hoặc bộ nhớ đệm ở giữa: các tiêu đề này xác định kết nối giữa trình phát và thực thể đầu tiên, không phải nút đích.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Quản lý kết nối trong HTTP/1.x](/en-US/docs/Web/HTTP/Guides/Connection_management_in_HTTP_1.x)
- [Cơ chế nâng cấp giao thức](/en-US/docs/Web/HTTP/Guides/Protocol_upgrade_mechanism)
