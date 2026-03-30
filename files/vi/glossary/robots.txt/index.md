---
title: Robots.txt
slug: Glossary/Robots.txt
page-type: glossary-definition
sidebar: glossarysidebar
---

**robots.txt** là tệp thường được đặt ở thư mục gốc của một trang web (ví dụ: `https://www.example.com/robots.txt`). Tệp này xác định liệu {{Glossary("crawler", "các trình thu thập thông tin")}} có được phép truy cập vào toàn bộ trang web hay chỉ các tài nguyên được chỉ định hay không. Tệp `robots.txt` có tính hạn chế cao có thể giúp ngăn chặn các trình thu thập tiêu tốn băng thông quá mức.

Chủ sở hữu trang web có thể ngăn trình thu thập phát hiện một đường dẫn nhất định (và tất cả các tệp trong đường dẫn đó) hoặc một tệp cụ thể. Điều này thường được thực hiện để ngăn các tài nguyên đó bị lập chỉ mục hoặc hiển thị trong kết quả tìm kiếm.

Nếu trình thu thập được phép truy cập tài nguyên, bạn có thể định nghĩa [quy tắc lập chỉ mục](/en-US/docs/Web/HTTP/Reference/Headers/X-Robots-Tag#directives) cho các tài nguyên đó thông qua các phần tử [`<meta name="robots">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots) (thường gọi là "thẻ robots") và HTTP header {{HTTPHeader("X-Robots-Tag")}}. Các trình thu thập liên quan đến tìm kiếm sử dụng các quy tắc này để xác định cách lập chỉ mục và hiển thị tài nguyên trong kết quả tìm kiếm, hoặc để điều chỉnh tốc độ thu thập cho các tài nguyên cụ thể theo thời gian.

## Xem thêm

- Hướng dẫn bảo mật [cấu hình robots.txt](/en-US/docs/Web/Security/Practical_implementation_guides/Robots_txt)
- Thuật ngữ {{Glossary("Search engine")}}
- {{RFC("9309", "Robots Exclusion Protocol")}}
- [Cách Google diễn giải đặc tả robots.txt](https://developers.google.com/crawling/docs/robots-txt/robots-txt-spec) trên developers.google.com
- https://www.robotstxt.org
- [Robots.txt](https://en.wikipedia.org/wiki/Robots.txt) trên Wikipedia
