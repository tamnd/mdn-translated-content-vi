---
title: Chiếm quyền subdomain
slug: Web/Security/Attacks/Subdomain_takeover
page-type: guide
sidebar: security
---

Một cuộc chiếm quyền subdomain xảy ra khi kẻ tấn công giành được quyền kiểm soát một subdomain của miền mục tiêu. Thông thường, điều này xảy ra khi subdomain có một tên chuẩn ([CNAME](https://en.wikipedia.org/wiki/CNAME_record)) trong Domain Name System ([DNS](/en-US/docs/Glossary/DNS)), nhưng không có host nào cung cấp nội dung cho nó. Điều này có thể xảy ra vì hoặc là một virtual host chưa được công bố, hoặc là một virtual host đã bị gỡ bỏ. Kẻ tấn công có thể chiếm quyền subdomain đó bằng cách tự cung cấp virtual host của riêng họ rồi lưu trữ nội dung của họ tại đó.

Nếu kẻ tấn công làm được điều này, họ có thể đọc [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) được đặt từ miền chính, thực hiện [cross-site scripting](/en-US/docs/Web/Security/Attacks/XSS), hoặc lách [content security policies](/en-US/docs/Web/HTTP/Guides/CSP), từ đó có thể thu thập thông tin được bảo vệ (bao gồm cả đăng nhập) hoặc gửi nội dung độc hại tới những người dùng không nghi ngờ.

Một subdomain giống như một ổ cắm điện. Nếu bạn cắm thiết bị của riêng mình (host) vào đó, mọi thứ đều ổn. Tuy nhiên, nếu bạn rút thiết bị ra khỏi ổ cắm (hoặc chưa cắm gì vào), người khác có thể cắm một thiết bị khác. Bạn phải ngắt điện tại cầu dao hoặc hộp cầu chì (DNS) để ngăn người khác sử dụng ổ cắm đó.

## Chúng xảy ra như thế nào?

Nếu quy trình cấp phát hoặc thu hồi (gỡ bỏ) một virtual host không được xử lý đúng cách, sẽ có cơ hội để kẻ tấn công chiếm quyền một subdomain.

### Trong quá trình cấp phát

Kẻ tấn công thiết lập một virtual host cho tên subdomain mà bạn đã mua trên nhà cung cấp hosting, trước khi bạn kịp làm điều đó.

Giả sử bạn kiểm soát miền example.com. Bạn muốn thêm một blog tại blog.example.com, và bạn quyết định dùng một nhà cung cấp hosting có duy trì nền tảng blog. (Với "blog", bạn có thể thay bằng "nền tảng thương mại điện tử", "nền tảng dịch vụ khách hàng", hoặc bất kỳ tình huống host ảo nào kiểu "đám mây" khác.) Quy trình bạn thực hiện có thể trông như sau:

1. Bạn đăng ký tên "blog.example.com" với một nhà đăng ký miền.
2. Bạn thiết lập các bản ghi DNS để hướng trình duyệt muốn truy cập blog.example.com tới virtual host.
3. Bạn tạo một virtual host tại nhà cung cấp hosting.

Trừ khi nhà cung cấp hosting rất cẩn thận xác minh rằng thực thể thiết lập virtual host thực sự là chủ sở hữu của tên subdomain đó, một kẻ tấn công nhanh tay hơn bạn có thể tạo một virtual host với chính nhà cung cấp hosting đó, bằng cách dùng tên subdomain của bạn. Trong trường hợp như vậy, ngay khi bạn thiết lập DNS ở bước 2, kẻ tấn công có thể lưu trữ nội dung trên subdomain của bạn.

### Trong quá trình thu hồi

Bạn gỡ virtual host của mình xuống, nhưng kẻ tấn công thiết lập một virtual host mới bằng cùng tên và cùng nhà cung cấp hosting.

Bạn (hoặc công ty của bạn) quyết định rằng không muốn duy trì một blog nữa, nên bạn gỡ virtual host khỏi nhà cung cấp hosting. Tuy nhiên, nếu bạn không xóa bản ghi DNS trỏ tới nhà cung cấp hosting, kẻ tấn công giờ có thể tạo virtual host riêng với nhà cung cấp đó, chiếm subdomain của bạn, và lưu trữ nội dung của họ dưới subdomain đó.

## Phòng vệ chống chiếm quyền subdomain

Ngăn chặn việc chiếm quyền subdomain là vấn đề về thứ tự thao tác trong quản lý vòng đời cho virtual host và DNS. Tùy vào quy mô tổ chức, điều này có thể đòi hỏi giao tiếp và phối hợp giữa nhiều bộ phận, mà điều đó chỉ làm tăng khả năng xảy ra một cấu hình sai dễ bị tấn công.

- Định nghĩa quy trình chuẩn cho việc cấp phát và thu hồi host. Thực hiện tất cả các bước càng sát nhau càng tốt.
  - Bắt đầu cấp phát bằng cách giành host ảo; tạo bản ghi DNS _sau cùng_.
  - Bắt đầu thu hồi bằng cách xóa bản ghi DNS _trước tiên_.

- Tạo một danh mục tất cả các miền và nhà cung cấp hosting của tổ chức bạn, và cập nhật khi có thay đổi, để bảo đảm không có thứ gì bị bỏ treo.
- Gây áp lực lên các nhà cung cấp hosting để họ khép kín các khoảng trống; hỏi họ cách họ xác minh rằng người yêu cầu một virtual host thực sự có quyền hợp lệ với tên miền. Làm việc trong tổ chức của bạn để biến điều này thành một phần của quy trình đánh giá nhà cung cấp.

## Subdomain của tôi đã bị chiếm. Tôi nên làm gì?

Nếu bạn phát hiện một subdomain của miền của mình đã bị chiếm quyền, bước đầu tiên, nếu có thể, là "cắt điện" bằng cách xóa bản ghi DNS cho subdomain đó. Nếu site của bạn có nhiều lớp ảo hóa (ví dụ, một [CDN](/en-US/docs/Glossary/CDN) ngoài virtual hosting), bạn có thể cần kiểm tra từng lớp để xem chính xác ở đâu kẻ tấn công đã xác lập claim virtual host của họ để chiếm miền của bạn.

## Tìm hiểu thêm

- ['Deep Thoughts' on Subdomain Takeover Vulnerabilities](https://claudijd.github.io/2017/02/03/deep-thoughts-on-subdomain-takeovers/)
- [Subdomain Takeover: Basics](https://0xpatrik.com/subdomain-takeover-basics/)
