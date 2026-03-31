---
title: Max-Forwards header
short-title: Max-Forwards
slug: Web/HTTP/Reference/Headers/Max-Forwards
page-type: http-header
spec-urls: https://httpwg.org/specs/rfc9110.html#field.max-forwards
sidebar: http
---

Tiêu đề HTTP **`Max-Forwards`** {{Glossary("request header")}} được sử dụng với phương thức {{HTTPMethod("TRACE")}} và {{HTTPMethod("OPTIONS")}} để giới hạn số nút (thường là {{Glossary("Proxy_server", "proxy")}}) mà yêu cầu đi qua.

Giá trị của nó là số nguyên chỉ ra _số lượng nút tối đa_ mà nó phải ghé qua.
Tại mỗi nút, giá trị được giảm dần và yêu cầu được chuyển tiếp đến nút tiếp theo cho đến khi đến đích hoặc giá trị nhận được của `Max-Forwards` bằng không.
Sau đó yêu cầu được gửi lại (ngoại trừ các tiêu đề nhạy cảm nếu phù hợp) như thân của phản hồi {{HTTPStatus("200")}}.
Điều này cho phép máy khách xem những gì đang được nhận ở đầu kia của chuỗi yêu cầu (tiêu đề {{HTTPHeader("Via")}} đặc biệt thú vị) cho mục đích kiểm tra hoặc chẩn đoán.

Nếu tiêu đề `Max-Forwards` không có trong yêu cầu `TRACE` hoặc `OPTIONS`, một nút sẽ giả định rằng không có số lượng chuyển tiếp tối đa.

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
Max-Forwards: <integer>
```

## Ví dụ

```http
Max-Forwards: 0
Max-Forwards: 10
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

Tính năng này không nhắm đến và cũng không được triển khai trong trình duyệt.

## Xem thêm

- Phương thức {{HTTPMethod("TRACE")}}
- Phương thức {{HTTPMethod("OPTIONS")}}
- {{HTTPStatus("405", "405 Method Not Allowed")}}
