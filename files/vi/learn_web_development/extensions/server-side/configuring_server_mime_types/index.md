---
title: Cấu hình đúng các kiểu MIME của máy chủ
short-title: Cấu hình kiểu MIME của máy chủ
slug: Learn_web_development/Extensions/Server-side/Configuring_server_MIME_types
page-type: guide
sidebar: learnsidebar
---

Kiểu MIME mô tả kiểu phương tiện của nội dung, dù là trong email, hay được phục vụ bởi máy chủ web hoặc ứng dụng web. Chúng được thiết kế để cung cấp gợi ý về cách nội dung nên được xử lý và hiển thị.

Ví dụ về các kiểu MIME:

- `text/html` cho tài liệu HTML.
- `text/plain` cho văn bản thuần túy.
- `text/css` cho Cascading Style Sheets.
- `text/javascript` cho các tệp JavaScript.
- `text/markdown` cho các tệp Markdown.
- `application/octet-stream` cho các tệp nhị phân nơi hành động của người dùng được mong đợi.

Các cấu hình mặc định của máy chủ rất khác nhau và đặt các giá trị kiểu MIME _mặc định_ khác nhau cho các tệp không có kiểu nội dung được xác định.

Các phiên bản Apache Web Server **trước 2.2.7** được cấu hình để báo cáo kiểu MIME là `text/plain` hoặc `application/octet-stream` cho các kiểu nội dung không xác định. Các phiên bản Apache hiện đại báo cáo `none` cho các tệp có kiểu nội dung không xác định.

[Nginx](https://nginx.org/) sẽ báo cáo `text/plain` nếu bạn không xác định kiểu nội dung mặc định.

Khi các kiểu nội dung mới được phát minh hoặc được thêm vào máy chủ web, quản trị viên web có thể không thêm các kiểu MIME mới vào cấu hình máy chủ web của họ. Đây là nguồn gốc chính của các vấn đề cho người dùng các trình duyệt có tôn trọng các kiểu MIME được báo cáo bởi máy chủ web và ứng dụng.

## Tại sao các kiểu MIME chính xác lại quan trọng?

Nếu máy chủ web hoặc ứng dụng báo cáo kiểu MIME không chính xác cho nội dung (bao gồm "kiểu mặc định" cho nội dung không xác định), trình duyệt web không có cách nào để biết ý định của tác giả. Điều này có thể gây ra hành vi không mong muốn.

Một số trình duyệt web có thể cố gắng _đoán_ kiểu MIME chính xác. Điều này cho phép các máy chủ web và ứng dụng được cấu hình sai tiếp tục hoạt động đối với những trình duyệt đó (nhưng không phải các trình duyệt khác thực hiện đúng tiêu chuẩn). Ngoài việc vi phạm đặc tả HTTP, đây là một ý tưởng tồi vì một số lý do quan trọng khác:

- Mất kiểm soát
  - : Nếu trình duyệt bỏ qua kiểu MIME được báo cáo, quản trị viên web và tác giả không còn kiểm soát được cách nội dung của họ được xử lý.

    Ví dụ, một trang web dành cho nhà phát triển web có thể muốn gửi một số tài liệu HTML ví dụ dưới dạng `text/html` hoặc `text/plain` để tài liệu được xử lý và hiển thị dưới dạng HTML hoặc dưới dạng mã nguồn. Nếu trình duyệt đoán kiểu MIME, tùy chọn này không còn khả dụng cho tác giả.

- Bảo mật
  - : Một số kiểu nội dung, chẳng hạn như các chương trình thực thi, vốn không an toàn. Vì lý do này, các kiểu MIME này thường bị hạn chế về những hành động mà trình duyệt web sẽ thực hiện khi nhận được loại nội dung đó. Một chương trình thực thi không nên được thực thi trên máy tính của người dùng và ít nhất nên khiến xuất hiện hộp thoại **hỏi người dùng** xem họ có muốn tải xuống tệp không.

## Các kiểu MIME JavaScript cũ

Khi tìm kiếm thông tin về các kiểu MIME JavaScript, bạn có thể thấy một số kiểu MIME tham chiếu đến JavaScript. Một số kiểu MIME này bao gồm:

- `application/javascript`
- `application/ecmascript`
- `application/x-ecmascript`
- `application/x-javascript`
- `text/ecmascript`
- `text/javascript1.0`
- `text/javascript1.1`
- `text/javascript1.2`
- `text/javascript1.3`
- `text/javascript1.4`
- `text/javascript1.5`
- `text/x-ecmascript`
- `text/x-javascript`

Mặc dù các trình duyệt có thể hỗ trợ bất kỳ, một số, hoặc tất cả các kiểu MIME thay thế này, bạn **chỉ** nên sử dụng `text/javascript` để chỉ ra kiểu MIME của các tệp JavaScript.

> [!NOTE]
> Xem [Kiểu MIME (kiểu phương tiện IANA)](/en-US/docs/Web/HTTP/Guides/MIME_types) để biết thêm thông tin.

## Cách xác định kiểu MIME cần đặt

Có một số cách để xác định giá trị kiểu MIME chính xác cần dùng để phục vụ nội dung của bạn.

- Nếu nội dung của bạn được tạo bằng phần mềm thương mại, hãy đọc tài liệu của nhà cung cấp để xem kiểu MIME nào nên được báo cáo cho ứng dụng.
- Tra cứu trong [Cơ quan đăng ký kiểu phương tiện MIME](https://www.iana.org/assignments/media-types/media-types.xhtml) của IANA, nơi chứa thông tin về tất cả các kiểu MIME đã đăng ký.
- Tìm kiếm phần mở rộng tệp trong [FILExt](https://filext.com/) hoặc [Tham chiếu phần mở rộng tệp](https://www.file-extensions.org/) để xem các kiểu MIME nào được liên kết với phần mở rộng đó. Hãy chú ý vì ứng dụng có thể có nhiều kiểu MIME chỉ khác nhau một chữ cái.

## Cách kiểm tra kiểu MIME của nội dung nhận được

- Trong Firefox
  - Tải tệp và đi đến **Công cụ > Thông tin trang** để lấy kiểu nội dung của trang bạn đã truy cập.
  - Bạn cũng có thể đi đến **Công cụ > Nhà phát triển web > Mạng** và tải lại trang. Tab yêu cầu cho bạn thấy danh sách tất cả các tài nguyên mà trang đã tải. Nhấp vào bất kỳ tài nguyên nào sẽ liệt kê tất cả thông tin có sẵn, bao gồm tiêu đề [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) của trang.

- Trong Chrome
  - Tải tệp và đi đến **Xem > Nhà phát triển > Công cụ dành cho nhà phát triển** và chọn tab _Mạng_. Tải lại trang và chọn tài nguyên bạn muốn kiểm tra. Trong phần tiêu đề tìm `Content-Type` và nó sẽ báo cáo kiểu nội dung của tài nguyên.

- Tìm kiếm phần tử `<meta>` trong mã nguồn trang cung cấp kiểu MIME, ví dụ `<meta http-equiv="Content-Type" content="text/html">`.
  - Theo tiêu chuẩn, phần tử `<meta>` xác định kiểu MIME nên được bỏ qua nếu có tiêu đề Content-Type.

[IANA](https://www.iana.org/) lưu giữ danh sách các [Kiểu phương tiện MIME](https://www.iana.org/assignments/media-types/media-types.xhtml) đã đăng ký. [Đặc tả HTTP](https://www.w3.org/Protocols/rfc2616/rfc2616.html) định nghĩa một tập cha của các kiểu MIME, được sử dụng để mô tả các kiểu phương tiện được sử dụng trên web.

## Cách thiết lập máy chủ của bạn để gửi đúng kiểu MIME

Mục tiêu là cấu hình máy chủ của bạn để gửi tiêu đề {{HTTPHeader("Content-Type")}} chính xác cho mỗi tài liệu.

- Nếu bạn đang sử dụng máy chủ web Apache, hãy kiểm tra phần **_Kiểu phương tiện và mã hóa ký tự_** của [Cấu hình Apache: .htaccess](/en-US/docs/Learn_web_development/Extensions/Server-side/Apache_Configuration_htaccess) để xem các ví dụ về các loại tài liệu khác nhau và các kiểu MIME tương ứng của chúng.
- Nếu bạn đang sử dụng Nginx, lưu ý rằng Nginx không có công cụ tương đương `.htaccess`, vì vậy tất cả các thay đổi sẽ đi vào tệp cấu hình chính.
- Nếu bạn đang sử dụng script hoặc framework phía máy chủ để tạo nội dung, cách chỉ ra kiểu nội dung sẽ phụ thuộc vào công cụ bạn đang sử dụng. Kiểm tra tài liệu của framework hoặc thư viện.

Bất kể bạn sử dụng hệ thống máy chủ nào, hiệu quả bạn cần đạt được là đặt tiêu đề phản hồi với tên {{httpheader("Content-Type")}}, theo sau là dấu hai chấm và khoảng trắng, theo sau là kiểu MIME. Các môi trường cấp cao thường cho phép đặt các tiêu đề như vậy khi tạo trang. Ví dụ, trong môi trường PHP, bạn có thể đặt tiêu đề phản hồi cho tài nguyên PDF như thế này:

```php
header('Content-Type: application/pdf')
```

Cố gắng đặt nó chỉ với `header('application/pdf')` sẽ không hoạt động.

## Liên kết liên quan

- [IANA | Kiểu phương tiện MIME](https://www.iana.org/assignments/media-types/media-types.xhtml)
- [Giao thức truyền siêu văn bản — HTTP/1.1](https://www.w3.org/Protocols/rfc2616/rfc2616.html)
- [Kiểu MIME (kiểu phương tiện IANA)](/en-US/docs/Web/HTTP/Guides/MIME_types)
- [Apache vs Nginx: Những cân nhắc thực tế](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations)
- [Di chuyển Apache .htaccess sang khối máy chủ Nginx](https://barryvanveen.nl/articles/56-migrate-apache-htaccess-to-nginx-server-block/)
