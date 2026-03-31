---
title: "Reason: CORS header 'Access-Control-Allow-Origin' missing"
slug: Web/HTTP/Guides/CORS/Errors/CORSMissingAllowOrigin
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS header 'Access-Control-Allow-Origin' missing
```

## Điều gì đã xảy ra sai?

Phản hồi cho yêu cầu {{Glossary("CORS")}} thiếu header {{HTTPHeader("Access-Control-Allow-Origin")}} bắt buộc, được sử dụng để xác định liệu tài nguyên có thể được truy cập bởi nội dung hoạt động trong nguồn gốc hiện tại hay không.

Nếu máy chủ nằm dưới sự kiểm soát của bạn, hãy thêm nguồn gốc của trang yêu cầu vào tập hợp các domain được phép truy cập bằng cách thêm nó vào giá trị header `Access-Control-Allow-Origin`.

Ví dụ: để cho phép trang tại `https://example.com` truy cập tài nguyên bằng CORS, header nên là:

```http
Access-Control-Allow-Origin: https://example.com
```

Bạn cũng có thể cấu hình trang web để cho phép bất kỳ trang web nào truy cập bằng ký tự đại diện `*`. Bạn chỉ nên sử dụng điều này cho các API công khai. API riêng tư không bao giờ nên sử dụng `*`, và thay vào đó nên có một domain hoặc các domain cụ thể được đặt. Ngoài ra, ký tự đại diện chỉ hoạt động cho các yêu cầu được thực hiện với thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) được đặt thành `anonymous`, và nó ngăn gửi thông tin xác thực như cookie trong các yêu cầu.

```http
Access-Control-Allow-Origin: *
```

> [!WARNING]
> Sử dụng ký tự đại diện để cho phép tất cả các trang web truy cập API riêng tư là ý tưởng tồi.

## Ví dụ cho các máy chủ web phổ biến

Chỉ thị chính xác để đặt header phụ thuộc vào máy chủ web của bạn.

Trong các ví dụ bên dưới,

Trong **Apache** ([tài liệu](https://httpd.apache.org/docs/2.4/mod/mod_headers.html#header)), thêm một dòng như sau vào cấu hình máy chủ (trong phần `<Directory>`, `<Location>`, `<Files>`, hoặc `<VirtualHost>` thích hợp). Cấu hình thường được tìm thấy trong tệp `.conf` (`httpd.conf` và `apache.conf` là tên phổ biến cho các tệp này), hoặc trong tệp `.htaccess`:

```apacheconf
Header set Access-Control-Allow-Origin 'https://example.com'
```

Đối với **Nginx** ([tài liệu](https://nginx.org/en/docs/http/ngx_http_headers_module.html#add_header)), lệnh để thiết lập header này là:

```nginx
add_header 'Access-Control-Allow-Origin' 'https://example.com' always;
```

## Nếu bạn không kiểm soát máy chủ

Nếu máy chủ từ xa không nằm dưới sự kiểm soát của bạn và không bao gồm header `Access-Control-Allow-Origin`, bạn không thể sửa lỗi này ở phía máy chủ. Hãy xem xét các phương án thay thế sau:

- Cấu trúc lại yêu cầu của bạn thành [yêu cầu đơn giản](/en-US/docs/Web/HTTP/Guides/CORS#simple_requests) để tránh kích hoạt preflight, nếu máy chủ xử lý các yêu cầu xuyên nguồn gốc đơn giản.
- Nếu bạn không cần đọc phản hồi, hãy sử dụng [`mode: "no-cors"`](/en-US/docs/Web/API/Request/mode) trong lời gọi `fetch()`. Phản hồi sẽ mờ (không thể đọc), nhưng yêu cầu sẽ thành công.
- Định tuyến yêu cầu qua máy chủ proxy bạn kiểm soát, máy chủ này tải tài nguyên và trả về nó với các CORS header thích hợp.

Xem [Cân nhắc phía client](/en-US/docs/Web/HTTP/Guides/CORS/Errors#client-side_considerations) để biết thêm chi tiết.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- Thuật ngữ: {{Glossary("CORS")}}
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
