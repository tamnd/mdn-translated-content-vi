---
title: 404 Not Found
slug: Web/HTTP/Reference/Status/404
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.404
sidebar: http
---

Mã trạng thái HTTP **`404 Not Found`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ không tìm thấy tài nguyên được yêu cầu.
Các liên kết dẫn đến trang 404 thường được gọi là liên kết hỏng hoặc liên kết chết và có thể xảy ra hiện tượng [link rot](https://en.wikipedia.org/wiki/Link_rot).

Mã trạng thái 404 chỉ cho biết tài nguyên bị thiếu mà không cho biết đây là tạm thời hay vĩnh viễn.
Nếu tài nguyên bị xóa vĩnh viễn, máy chủ nên gửi mã trạng thái {{HTTPStatus("410", "410 Gone")}} thay thế.

Lỗi 404 trên một trang web có thể dẫn đến trải nghiệm người dùng kém cho khách truy cập, vì vậy nên giảm thiểu số lượng liên kết hỏng (nội bộ và bên ngoài) để tránh gây khó chịu cho người đọc.
Nguyên nhân phổ biến dẫn đến phản hồi 404 là URL bị nhập sai hoặc các trang bị di chuyển hoặc xóa mà không có chuyển hướng.
Để biết thêm thông tin, hãy xem hướng dẫn [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections).

## Trạng thái

```http
404 Not Found
```

## Ví dụ

### Trang không tìm thấy

Việc truy cập một trang không tồn tại có thể trông như yêu cầu sau:

```http
GET /my-deleted-blog-post HTTP/1.1
Host: example.com
```

Máy chủ trả về phản hồi tương tự như sau:

```http
HTTP/1.1 404 Not Found
Age: 249970
Cache-Control: max-age=604800
Content-Type: text/html; charset=UTF-8
Date: Fri, 28 Jun 2024 11:40:58 GMT
Expires: Fri, 05 Jul 2024 11:40:58 GMT
Last-Modified: Tue, 25 Jun 2024 14:14:48 GMT
Server: ECAcc (nyd/D13E)
Vary: Accept-Encoding
X-Cache: 404-HIT
Content-Length: 1256

<!doctype html>
<head>
    <title>404 not found</title>
    ...
```

### Trang lỗi tùy chỉnh trong Apache

Đối với máy chủ Apache, bạn có thể chỉ định đường dẫn đến trang 404 tùy chỉnh trong tệp `.htaccess`.
Ví dụ dưới đây dùng `notfound.html` làm trang hiển thị cho khách truy cập khi gặp lỗi 404, mặc dù cách tiếp cận phổ biến là đặt tên tệp là `404.html` hoặc `404.php` (tùy thuộc vào công nghệ phía máy chủ) ở thư mục gốc của máy chủ:

```apacheconf
ErrorDocument 404 /notfound.html
```

> [!NOTE]
> Thiết kế trang 404 tùy chỉnh là điều tốt nếu được sử dụng hợp lý.
> Hãy thoải mái tạo trang 404 hài hước và thân thiện, nhưng đừng gây nhầm lẫn cho khách truy cập về lý do họ thấy điều gì đó bất ngờ.
>
> Để xem ví dụ về trang 404 tùy chỉnh, hãy xem [trang 404 của KonMari](https://konmari.com/404).

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("410")}}
- [Wikipedia: HTTP 404](https://en.wikipedia.org/wiki/HTTP_404)
