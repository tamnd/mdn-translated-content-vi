---
title: 304 Not Modified
slug: Web/HTTP/Reference/Status/304
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.304
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`304 Not Modified`** cho biết rằng không cần truyền lại các tài nguyên được yêu cầu.

Mã phản hồi này được gửi khi yêu cầu là yêu cầu {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}} [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests) với tiêu đề {{HTTPHeader("If-None-Match")}} hoặc {{HTTPHeader("If-Modified-Since")}} và điều kiện đánh giá là 'false'.
Nó xác nhận rằng tài nguyên được client lưu đệm vẫn còn hợp lệ và máy chủ sẽ gửi phản hồi {{HTTPStatus("200", "200 OK")}} với tài nguyên nếu điều kiện đánh giá là 'true'.
Xem [Bộ đệm HTTP](/en-US/docs/Web/HTTP/Guides/Caching) để biết thêm thông tin.

Phản hồi không được chứa thân và phải bao gồm các tiêu đề đã được gửi trong phản hồi {{HTTPStatus("200")}} tương đương, chẳng hạn như:

- {{HTTPHeader("Cache-Control")}}
- {{HTTPHeader("Content-Location")}}
- {{HTTPHeader("Date")}}
- {{HTTPHeader("ETag")}}
- {{HTTPHeader("Expires")}}
- {{HTTPHeader("Vary")}}

> [!NOTE]
> Nhiều [bảng điều khiển mạng của công cụ dành cho nhà phát triển](https://firefox-source-docs.mozilla.org/devtools-user/network_monitor/index.html) của trình duyệt tạo ra các yêu cầu thừa dẫn đến phản hồi `304`, để các nhà phát triển có thể thấy quyền truy cập vào bộ đệm cục bộ.

## Trạng thái

```http
304 Not Modified
```

## Ví dụ

### Phản hồi 304 cho các yêu cầu có điều kiện

Các ví dụ dưới đây cho thấy các yêu cầu {{HTTPMethod("GET")}} được thực hiện bằng [curl](https://curl.se/) với các tiêu đề yêu cầu có điều kiện.
Cờ `--http1.1` được dùng để buộc giao thức HTTP/1.1 cho dễ đọc.

Yêu cầu đầu tiên sử dụng điều kiện `If-Modified-Since` với ngày trong tương lai là ngày 21 tháng 11 năm 2050.
Điều này phải đánh giá là `false`, vì tài nguyên không thể đã được cập nhật sau một thời điểm chưa xảy ra:

```bash
curl --http1.1 -I --header 'If-Modified-Since: Tue, 21 Nov 2050 08:00:00 GMT' \
 https://developer.mozilla.org/en-US/
```

Điều này sẽ dẫn đến yêu cầu HTTP sau:

```http
GET /en-US/ HTTP/1.1
Host: developer.mozilla.org
User-Agent: curl/8.7.1
Accept: */*
If-Modified-Since: Tue, 21 Nov 2050 08:00:00 GMT
```

Phản hồi sẽ là {{HTTPStatus("200", "200 OK")}} với phiên bản hiện tại của tài nguyên nếu tài nguyên đã được cập nhật sau dấu thời gian trong tiêu đề {{HTTPHeader("If-Modified-Since")}}.
Thay vào đó, chúng ta nhận được phản hồi `304` bao gồm các tiêu đề {{HTTPHeader("ETag")}}, {{HTTPHeader("Age")}} và {{HTTPHeader("Expires")}}, cho chúng ta biết phiên bản đệm của tài nguyên vẫn còn hợp lệ:

```http
HTTP/1.1 304 Not Modified
Date: Wed, 28 Aug 2024 09:52:35 GMT
Expires: Wed, 28 Aug 2024 10:01:53 GMT
Age: 3279
ETag: "b20a0973b226eeea30362acb81f9e0b3"
Cache-Control: public, max-age=3600
Vary: Accept-Encoding
X-cache: hit
Alt-Svc: clear
```

Bây giờ chạy lệnh `curl` khác sử dụng giá trị `etag` từ phản hồi trước với điều kiện {{HTTPHeader("If-None-Match")}} (vì `etag` này là phiên bản hiện tại của tài nguyên trên máy chủ, chúng ta mong đợi nhận được phản hồi `304 Not Modified`):

```bash
curl --http1.1 -I --header 'If-None-Match: "b20a0973b226eeea30362acb81f9e0b3"' \
 https://developer.mozilla.org/en-US/
```

Điều này sẽ dẫn đến yêu cầu HTTP sau:

```http
GET /en-US/ HTTP/1.1
Host: developer.mozilla.org
User-Agent: curl/8.7.1
Accept: */*
If-None-Match: "b20a0973b226eeea30362acb81f9e0b3"
```

Vì giá trị `etag` khớp tại thời điểm yêu cầu, entity tag không thỏa mãn điều kiện và trả về phản hồi `304`:

```http
HTTP/1.1 304 Not Modified
Date: Wed, 28 Aug 2024 10:36:35 GMT
Expires: Wed, 28 Aug 2024 11:02:17 GMT
Age: 662
ETag: "b20a0973b226eeea30362acb81f9e0b3"
Cache-Control: public, max-age=3600
Vary: Accept-Encoding
X-cache: hit
Alt-Svc: clear
```

## Đặc tả

{{Specifications}}

## Ghi chú tương thích

Hành vi trình duyệt khác nhau nếu phản hồi này chứa thân một cách không đúng trên các kết nối liên tục.
Xem {{HTTPStatus("204", "204 No Content")}} để biết thêm chi tiết.

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- {{HTTPHeader("If-Modified-Since")}}
- {{HTTPHeader("If-None-Match")}}
