---
title: Cấu hình robots.txt
slug: Web/Security/Practical_implementation_guides/Robots_txt
page-type: guide
sidebar: security
---

[`robots.txt`](/en-US/docs/Glossary/Robots.txt) là một tệp văn bản cho các robot (chẳng hạn bộ lập chỉ mục của công cụ tìm kiếm) biết cách hành xử, bằng cách hướng dẫn chúng không thu thập dữ liệu ở một số đường dẫn nhất định trên website. Tệp này được đặt trong thư mục gốc của một website.

## Vấn đề

Nhiều yếu tố có thể làm tăng tải trên website của bạn; điều này bao gồm cả web crawler. Ngoài ra, nếu được phép thu thập toàn bộ một trang web, web crawler có thể gây ô nhiễm kết quả tìm kiếm bằng các tài nguyên không mang lại lợi ích gì khi được tìm thấy qua tìm kiếm.

## Giải pháp

Dùng `robots.txt` để giảm tải cho website và ngăn nội dung không phù hợp xuất hiện trong kết quả tìm kiếm. Việc dùng tệp này là tùy chọn và chỉ nên dùng cho các mục đích đó. Nó không nên được dùng như một cách để ngăn tiết lộ thông tin riêng tư hoặc ẩn các phần của một website.

Mặc dù việc dùng tệp này có thể ngăn các trang xuất hiện trong kết quả của công cụ tìm kiếm, nó không bảo vệ website khỏi kẻ tấn công. Trái lại, nó thậm chí có thể vô tình giúp họ: `robots.txt` có thể truy cập công khai, và bằng cách thêm các đường dẫn trang nhạy cảm vào đó, bạn đang cho các vị trí của chúng cho những kẻ tấn công tiềm năng.

Cũng cần biết rằng một số robot, chẳng hạn robot phần mềm độc hại và trình thu thập địa chỉ email, sẽ bỏ qua tệp `robots.txt` của bạn.

## Ví dụ

Ngăn mọi công cụ tìm kiếm thu thập dữ liệu một trang web:

```http
User-agent: *
Disallow: /
```

Ẩn một số thư mục nhất định (không được khuyến nghị):

```http example-bad
User-agent: *
Disallow: /secret/admin-interface
```

## Xem thêm

- Tiêu đề HTTP {{HTTPHeader("X-Robots-Tag")}}
- Phần tử HTML [`<meta name="robots">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots) ("robots tag")
- {{RFC("9309", "Robots Exclusion Protocol")}}
- [About /robots.txt](https://www.robotstxt.org/robotstxt.html) trên `robotstxt.org`
