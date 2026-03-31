---
title: 411 Length Required
slug: Web/HTTP/Reference/Status/411
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.411
sidebar: http
---

Mã trạng thái HTTP **`411 Length Required`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ từ chối chấp nhận yêu cầu khi không có tiêu đề {{HTTPHeader("Content-Length")}} được xác định.

> [!NOTE]
> Khi gửi dữ liệu theo từng phần, tiêu đề `Content-Length` bị bỏ qua, và ở đầu mỗi phần, độ dài của phần hiện tại cần được bao gồm ở định dạng thập lục phân.
> Xem {{HTTPHeader("Transfer-Encoding")}} để biết thêm chi tiết.

## Trạng thái

```http
411 Length Required
```

## Ví dụ

### Yêu cầu POST theo từng phần

Yêu cầu sau được gửi theo từng phần, đây là phương thức mặc định để gửi dữ liệu trong một số trường hợp, chẳng hạn khi [ghi vào streams](https://nodejs.org/api/http.html#requestwritechunk-encoding-callback):

```http
POST /translate/de HTTP/1.1
Host: api.example.com
Content-Type: application/json
Transfer-encoding: chunked

2C
{"text": "Hurry up, Ayşe is hungry!"}
0
```

Trong trường hợp này, máy chủ mong nhận yêu cầu trong một phần với tiêu đề {{HTTPHeader("Content-Length")}} và trả về phản hồi 411:

```http
HTTP/1.1 411 Length Required
Content-Type: application/json
Content-Length: 110

{
  "message": "Requests must have a content length header.",
  "documentation": "http://api/example.com/docs/errors",
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Content-Length")}}
- {{HTTPHeader("Transfer-Encoding")}}
