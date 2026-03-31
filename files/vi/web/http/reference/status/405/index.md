---
title: 405 Method Not Allowed
slug: Web/HTTP/Reference/Status/405
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.405
sidebar: http
---

Mã trạng thái HTTP **`405 Method Not Allowed`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ biết phương thức yêu cầu nhưng tài nguyên đích không hỗ trợ phương thức này.
Máy chủ **phải** tạo tiêu đề {{HTTPHeader("Allow")}} trong phản hồi 405 với danh sách các phương thức mà tài nguyên đích hiện đang hỗ trợ.

Quyền phía máy chủ được đặt không đúng cách trên tệp hoặc thư mục có thể gây ra phản hồi 405 khi yêu cầu đáng lẽ phải thành công.

## Trạng thái

```http
405 Method Not Allowed
```

## Ví dụ

### Phương thức TRACE không được phép

Chủ sở hữu máy chủ thường vô hiệu hóa việc sử dụng phương thức `TRACE` vì lý do bảo mật.
Ví dụ sau cho thấy phản hồi điển hình khi máy chủ không cho phép sử dụng `TRACE`:

```http
TRACE / HTTP/1.1
Host: example.com
```

```http
HTTP/1.1 405 Method Not Allowed
Content-Length: 0
Date: Fri, 28 Jun 2024 14:30:31 GMT
Server: ECLF (nyd/D179)
Allow: GET, POST, HEAD
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Allow")}}
- {{HTTPStatus("501", "501 Not Implemented")}}, {{HTTPStatus("510", "510 Not Extended")}}
- [HTTP Status Code Definitions](https://httpwg.org/specs/rfc9110.html#status.405)
- [How to Fix 405 Method Not Allowed](https://kinsta.com/blog/405-method-not-allowed-error/)
- [Troubleshooting HTTP 405](https://learn.microsoft.com/en-us/aspnet/web-api/overview/testing-and-debugging/troubleshooting-http-405-errors-after-publishing-web-api-applications)
