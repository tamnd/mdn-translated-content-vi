---
title: 451 Unavailable For Legal Reasons
slug: Web/HTTP/Reference/Status/451
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc7725.html#n-451-unavailable-for-legal-reasons
sidebar: http
---

Mã trạng thái HTTP **`451 Unavailable For Legal Reasons`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết người dùng đã yêu cầu tài nguyên không khả dụng vì lý do pháp lý, chẳng hạn như trang web bị áp dụng biện pháp pháp lý.

## Trạng thái

```http
451 Unavailable For Legal Reasons
```

## Ví dụ

### Phản hồi với tiêu đề Link

Ví dụ phản hồi này được lấy từ RFC của IETF (xem bên dưới) và chứa tham chiếu đến [Monty Python's Life of Brian](https://en.wikipedia.org/wiki/Monty_Python's_Life_of_Brian).

> [!NOTE]
> Tiêu đề {{HTTPHeader("Link")}} cũng có thể chứa quan hệ `rel="blocked-by"` xác định thực thể thực hiện việc chặn, không phải bất kỳ thực thể nào khác ra lệnh chặn.

Mọi nỗ lực xác định thực thể cuối cùng chịu trách nhiệm về việc tài nguyên không khả dụng thuộc về phần thân phản hồi, không phải trong liên kết `rel="blocked-by"`. Điều này bao gồm tên của cá nhân hoặc tổ chức đã đưa ra yêu cầu pháp lý dẫn đến việc xóa nội dung.

```http
HTTP/1.1 451 Unavailable For Legal Reasons
Link: <https://spqr.example.org/legislatione>; rel="blocked-by"
Content-Type: text/html

<html>
      <head><title>Unavailable For Legal Reasons</title></head>
      <body>
            <h1>Unavailable For Legal Reasons</h1>
            <p>This request may not be serviced in the Roman Province
            of Judea due to the Lex Julia Majestatis, which disallows
            access to resources hosted on servers deemed to be
            operated by the People's Front of Judea.</p>
      </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Wikipedia: HTTP 451](https://en.wikipedia.org/wiki/HTTP_451)
- [Wikipedia: Fahrenheit 451](https://en.wikipedia.org/wiki/Fahrenheit_451) (tác phẩm đã đặt tên cho mã trạng thái này)
