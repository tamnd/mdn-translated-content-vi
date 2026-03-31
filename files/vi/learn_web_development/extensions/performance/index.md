---
title: Hiệu suất web
slug: Learn_web_development/Extensions/Performance
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Performance/why_web_performance", "Learn_web_development/Extensions")}}

Xây dựng website đòi hỏi HTML, CSS và JavaScript. Để xây dựng những website và ứng dụng mà mọi người muốn sử dụng, thu hút và giữ chân người dùng, bạn cần tạo ra trải nghiệm người dùng tốt. Một phần của trải nghiệm người dùng tốt là đảm bảo nội dung tải nhanh và phản hồi tương tác của người dùng. Điều này được gọi là **hiệu suất web**, và trong mô-đun này bạn sẽ tập trung vào những kiến thức cơ bản về cách tạo ra những website có hiệu suất cao.

Phần còn lại của tài liệu học tập dành cho người mới bắt đầu cố gắng tuân theo các phương pháp hay nhất của web như hiệu suất và [khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility) càng nhiều càng tốt. Tuy nhiên, việc tập trung cụ thể vào những chủ đề này cũng rất tốt, và hãy chắc chắn rằng bạn đã quen thuộc với chúng.

## Điều kiện tiên quyết

Mặc dù việc biết HTML, CSS và JavaScript là cần thiết để triển khai nhiều khuyến nghị cải thiện hiệu suất web, nhưng biết cách xây dựng ứng dụng không phải là điều kiện tiên quyết cần thiết để hiểu và đo lường hiệu suất web. Tuy nhiên, chúng tôi khuyến nghị rằng trước khi bạn làm việc qua mô-đun này, bạn ít nhất nên có ý tưởng cơ bản về phát triển web bằng cách làm việc qua mô-đun [Website đầu tiên của bạn](/en-US/docs/Learn_web_development/Getting_started/Your_first_website).

Sẽ rất hữu ích nếu bạn đi sâu hơn vào các chủ đề này, với các mô-đun như:

- [Cấu trúc nội dung với HTML](/en-US/docs/Learn_web_development/Core/Structuring_content)
- [Kiến thức cơ bản về tạo kiểu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics)
- [Lập trình động với JavaScript](/en-US/docs/Learn_web_development/Core/Scripting)

## Hướng dẫn

- ["Lý do tại sao" của hiệu suất web](/en-US/docs/Learn_web_development/Extensions/Performance/why_web_performance)
  - : Bài viết này thảo luận về lý do tại sao hiệu suất web quan trọng đối với khả năng tiếp cận, trải nghiệm người dùng và mục tiêu kinh doanh của bạn.
- [Hiệu suất web là gì?](/en-US/docs/Learn_web_development/Extensions/Performance/What_is_web_performance)
  - : Bạn biết hiệu suất web là quan trọng, nhưng điều gì cấu thành nên hiệu suất web? Bài viết này giới thiệu các thành phần của hiệu suất, từ việc tải trang web và kết xuất, bao gồm cả cách nội dung của bạn đến trình duyệt của người dùng để được xem, đến những nhóm người nào chúng ta cần xem xét khi nghĩ về hiệu suất.
- [Người dùng nhận thức hiệu suất như thế nào?](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance)
  - : Quan trọng hơn tốc độ thực tế của website tính bằng mili giây là cảm nhận của người dùng về tốc độ trang web của bạn. Những nhận thức này bị ảnh hưởng bởi thời gian tải trang thực tế, thời gian chờ, độ phản hồi với tương tác người dùng và sự mượt mà của cuộn trang và các hoạt ảnh khác. Trong bài viết này, chúng tôi thảo luận về các số liệu tải, hoạt ảnh và số liệu về độ phản hồi khác nhau, cùng với các phương pháp hay nhất để cải thiện nhận thức của người dùng, ngay cả khi không thay đổi được thời gian thực tế.
- [Đo lường hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance)
  - : Bây giờ bạn đã hiểu một vài số liệu hiệu suất, chúng ta sẽ đi sâu hơn vào các công cụ, số liệu và API hiệu suất và cách chúng ta có thể biến hiệu suất thành một phần của quy trình phát triển web.
- [Đa phương tiện: hình ảnh](/en-US/docs/Learn_web_development/Extensions/Performance/Multimedia)
  - : Điểm cải thiện hiệu suất web dễ đạt nhất thường là tối ưu hóa đa phương tiện. Phục vụ các tệp đa phương tiện khác nhau dựa trên khả năng, kích thước và mật độ điểm ảnh của từng tác nhân người dùng là điều khả thi. Trong bài viết này, chúng tôi thảo luận về ảnh hưởng của hình ảnh đến hiệu suất, và các phương pháp để giảm số lượng byte được gửi trên mỗi hình ảnh.
- [Đa phương tiện: video](/en-US/docs/Learn_web_development/Extensions/Performance/video)
  - : Điểm cải thiện hiệu suất web dễ đạt nhất thường là tối ưu hóa đa phương tiện. Trong bài viết này, chúng tôi thảo luận về ảnh hưởng của nội dung video đến hiệu suất, và đưa ra các mẹo như loại bỏ track âm thanh khỏi video nền có thể cải thiện hiệu suất.
- [Tối ưu hóa hiệu suất JavaScript](/en-US/docs/Learn_web_development/Extensions/Performance/JavaScript)
  - : JavaScript, khi được sử dụng đúng cách, có thể tạo ra những trải nghiệm web tương tác và phong phú — hoặc nó có thể làm giảm đáng kể thời gian tải, thời gian kết xuất, hiệu suất trong ứng dụng, thời lượng pin và trải nghiệm người dùng. Bài viết này trình bày một số phương pháp hay nhất về JavaScript cần được xem xét để đảm bảo ngay cả nội dung phức tạp cũng đạt hiệu suất cao nhất có thể.
- [Tối ưu hóa hiệu suất HTML](/en-US/docs/Learn_web_development/Extensions/Performance/HTML)
  - : Một số thuộc tính và thứ tự nguồn trong mã đánh dấu của bạn có thể ảnh hưởng đến hiệu suất của website. Bằng cách giảm thiểu số lượng nút DOM, đảm bảo thứ tự và thuộc tính tốt nhất được sử dụng để đưa vào nội dung như kiểu, tập lệnh, đa phương tiện và tập lệnh bên thứ ba, bạn có thể cải thiện đáng kể trải nghiệm người dùng. Bài viết này xem xét chi tiết cách HTML có thể được sử dụng để đảm bảo hiệu suất tối đa.
- [Tối ưu hóa hiệu suất CSS](/en-US/docs/Learn_web_development/Extensions/Performance/CSS)
  - : CSS có thể là trọng tâm tối ưu hóa ít quan trọng hơn để cải thiện hiệu suất, nhưng có một số tính năng CSS ảnh hưởng đến hiệu suất nhiều hơn các tính năng khác. Trong bài viết này, chúng tôi xem xét một số thuộc tính CSS ảnh hưởng đến hiệu suất và các cách xử lý kiểu được đề xuất để đảm bảo hiệu suất không bị ảnh hưởng tiêu cực.
- [Lý do kinh doanh cho hiệu suất web](/en-US/docs/Learn_web_development/Extensions/Performance/business_case_for_performance)
  - : Có nhiều thứ một nhà phát triển có thể làm để cải thiện hiệu suất, nhưng nhanh đến mức nào là đủ nhanh? Làm thế nào để bạn thuyết phục những người có quyền lực về tầm quan trọng của những nỗ lực này? Sau khi đã tối ưu hóa, làm thế nào để đảm bảo sự phình to không trở lại? Trong bài viết này, chúng tôi xem xét cách thuyết phục quản lý, phát triển văn hóa hiệu suất và ngân sách hiệu suất, và giới thiệu các cách để đảm bảo rằng sự suy giảm không lén lút vào codebase của bạn.
- [Các phương pháp hay nhất & mẹo về hiệu suất web](/en-US/docs/Learn_web_development/Extensions/Performance/Best_practices)
  - : Bài viết này bao gồm một số chủ đề ở cấp độ cơ bản và cung cấp các liên kết đến các tìm hiểu sâu hơn để cải thiện hiệu suất cho từng chủ đề. Ngoài các chủ đề front-end như HTML, CSS, JavaScript và tệp đa phương tiện, nó còn bao gồm các API, công cụ dành cho nhà phát triển, phương pháp hay nhất và phương pháp xấu liên quan đến hiệu suất web.

## Xem thêm

- [Hình ảnh đáp ứng](/en-US/docs/Web/HTML/Guides/Responsive_images)
  - : Trong bài viết này, chúng ta sẽ tìm hiểu về khái niệm hình ảnh đáp ứng — hình ảnh hoạt động tốt trên các thiết bị có kích thước màn hình, độ phân giải và các tính năng khác nhau rất khác nhau — và xem xét các công cụ HTML cung cấp để giúp triển khai chúng. Điều này giúp cải thiện hiệu suất trên các thiết bị khác nhau. Hình ảnh đáp ứng chỉ là một phần của [thiết kế đáp ứng](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design), một chủ đề CSS tương lai để bạn tìm hiểu.
- [Phần hiệu suất web chính trên MDN](/en-US/docs/Web/Performance)
  - : Phần hiệu suất web chính của chúng tôi — tại đây bạn sẽ tìm thấy nhiều chi tiết hơn về hiệu suất web bao gồm tổng quan về các API hiệu suất, công cụ kiểm tra và phân tích, và những vấn đề thắt cổ chai về hiệu suất.

{{NextMenu("Learn_web_development/Extensions/Performance/why_web_performance", "Learn_web_development/Extensions")}}
