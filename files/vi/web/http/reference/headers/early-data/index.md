---
title: Early-Data header
short-title: Early-Data
slug: Web/HTTP/Reference/Headers/Early-Data
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Early-Data
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Early-Data`** {{Glossary("request header")}} được đặt bởi một trung gian để chỉ báo rằng yêu cầu đã được truyền trong dữ liệu TLS sớm, và cũng chỉ báo rằng trung gian hiểu mã trạng thái {{HTTPStatus("425", "425 Too Early")}}.

Nếu một máy khách đã tương tác với máy chủ gần đây, dữ liệu sớm (còn được gọi là dữ liệu zero round-trip time (0-RTT)) cho phép máy khách gửi dữ liệu đến máy chủ trong vòng đầu tiên của kết nối, mà không cần chờ [bắt tay](/en-US/docs/Glossary/TCP_handshake) TLS hoàn tất.
Điều này giảm độ trễ cho các kết nối lặp lại giữa máy khách và máy chủ, nhưng có ý nghĩa bảo mật vì dữ liệu sớm dễ bị tấn công phát lại.

Tiêu đề `Early-Data` **không** được đặt bởi người khởi tạo yêu cầu (tức là trình duyệt).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Early-Data: 1
```

## Ví dụ

### Yêu cầu GET với tiêu đề Early-Data

Máy khách muốn sử dụng dữ liệu sớm có thể gửi các yêu cầu HTTP ngay lập tức sau khi gửi `ClientHello` TLS.
Việc gửi yêu cầu trong dữ liệu sớm ngụ ý rằng máy khách sẵn sàng thử lại yêu cầu để phản hồi với mã trạng thái {{HTTPStatus("425", "425 Too Early")}}, vì vậy tiêu đề `Early-Data` không được bao gồm:

```http
GET /resource HTTP/1.1
Host: example.com
```

Một trung gian chuyển tiếp yêu cầu trước khi bắt tay TLS hoàn tất với máy khách của nó sẽ gửi nó với tiêu đề `Early-Data` được đặt thành `1`:

```http
GET /resource HTTP/1.1
Host: example.com
Early-Data: 1
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("425", "425 Too Early")}}
- [Replay Attacks on 0-RTT](https://www.rfc-editor.org/rfc/rfc8446#appendix-E.5)
