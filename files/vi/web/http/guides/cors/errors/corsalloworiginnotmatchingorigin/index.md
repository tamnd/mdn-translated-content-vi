---
title: "Reason: CORS header 'Access-Control-Allow-Origin' does not match 'xyz'"
slug: Web/HTTP/Guides/CORS/Errors/CORSAllowOriginNotMatchingOrigin
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS header 'Access-Control-Allow-Origin' does not match 'xyz'
```

## Điều gì đã xảy ra sai?

Nguồn gốc thực hiện yêu cầu không khớp với nguồn gốc được cho phép bởi header {{HTTPHeader("Access-Control-Allow-Origin")}}. Lỗi này cũng có thể xảy ra nếu phản hồi bao gồm nhiều hơn một header `Access-Control-Allow-Origin`.

Nếu dịch vụ mà code của bạn đang truy cập sử dụng yêu cầu CORS dưới sự kiểm soát của bạn, hãy đảm bảo nó được cấu hình để bao gồm nguồn gốc của bạn trong header `Access-Control-Allow-Origin`. Ngoài ra, xác nhận rằng chỉ có một header như vậy được bao gồm trong các phản hồi và nó chỉ bao gồm một nguồn gốc duy nhất.

Ví dụ, trong Apache, thêm một dòng như sau vào cấu hình máy chủ (trong phần `<Directory>`, `<Location>`, `<Files>` hoặc `<VirtualHost>` thích hợp). Cấu hình thường được tìm thấy trong tệp `.conf` (`httpd.conf` và `apache.conf` là tên phổ biến cho các tệp này), hoặc trong tệp `.htaccess`.

> [!WARNING]
> Bạn phải bao gồm giao thức HTTPS hoặc HTTP như một phần của nguồn gốc.

```apacheconf
Header set Access-Control-Allow-Origin 'origin'
```

Đối với Nginx, lệnh để thiết lập header này là:

```nginx
add_header 'Access-Control-Allow-Origin' 'origin'
```

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [Enable CORS: I want to add CORS support to my server](https://enable-cors.org/server.html)
