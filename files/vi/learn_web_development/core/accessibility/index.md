---
title: Khả năng tiếp cận trên web
short-title: Khả năng tiếp cận
slug: Learn_web_development/Core/Accessibility
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Core/Accessibility/What_is_accessibility", "Learn_web_development/Core")}}

Việc truy cập vào nội dung web như các dịch vụ công cộng, giáo dục, trang thương mại điện tử và giải trí là quyền của con người. Không ai nên bị loại trừ dựa trên khuyết tật, chủng tộc, địa lý hoặc các đặc điểm con người khác. Mô-đun này thảo luận về các thực hành tốt nhất và kỹ thuật bạn nên học để làm cho trang web của mình có khả năng tiếp cận tốt nhất có thể.

## Điều kiện tiên quyết

Bạn nên quen thuộc với [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) trước khi bắt đầu mô-đun này.

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác mà bạn không thể tạo tệp, bạn có thể thử chạy mã trong trình chỉnh sửa trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn và thử thách

- [Khả năng tiếp cận là gì?](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility)
  - : Bài viết này bắt đầu mô-đun với một cái nhìn toàn diện về khả năng tiếp cận — bao gồm việc chúng ta cần xem xét những nhóm người nào và tại sao, những công cụ khác nhau mà mọi người sử dụng để tương tác với web, và cách chúng ta có thể đưa khả năng tiếp cận vào quy trình phát triển web của mình.
- [Công cụ hỗ trợ khả năng tiếp cận và công nghệ hỗ trợ](/en-US/docs/Learn_web_development/Core/Accessibility/Tooling)
  - : Tiếp theo, chúng ta chuyển sự chú ý sang các công cụ hỗ trợ khả năng tiếp cận, cung cấp thông tin về các loại công cụ bạn có thể sử dụng để giải quyết các vấn đề về khả năng tiếp cận, và các công nghệ hỗ trợ mà người khuyết tật sử dụng khi duyệt web. Bạn sẽ sử dụng những công cụ này trong các bài viết tiếp theo.
- [HTML: Nền tảng tốt cho khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/HTML)
  - : Phần lớn nội dung web có thể được làm dễ tiếp cận chỉ bằng cách đảm bảo các phần tử HTML đúng luôn được sử dụng cho đúng mục đích. Bài viết này xem xét chi tiết cách HTML có thể được sử dụng để đảm bảo khả năng tiếp cận tối đa.
- [Thực hành tốt nhất về khả năng tiếp cận với CSS và JavaScript](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript)
  - : CSS và JavaScript, khi được sử dụng đúng cách, cũng có tiềm năng cho phép trải nghiệm web dễ tiếp cận, nhưng nếu bị lạm dụng, chúng có thể gây hại đáng kể cho khả năng tiếp cận. Bài viết này đưa ra một số thực hành tốt nhất về CSS và JavaScript cần được xem xét để đảm bảo rằng ngay cả nội dung phức tạp cũng dễ tiếp cận nhất có thể.
- [Kiến thức cơ bản về WAI-ARIA](/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics)
  - : Tiếp nối bài viết trước, đôi khi việc tạo các điều khiển giao diện người dùng phức tạp liên quan đến HTML không có ngữ nghĩa và nội dung được cập nhật động bằng JavaScript có thể khó khăn. WAI-ARIA là một công nghệ có thể giúp giải quyết các vấn đề như vậy bằng cách thêm ngữ nghĩa bổ sung mà trình duyệt và công nghệ hỗ trợ có thể nhận biết và sử dụng để cho người dùng biết điều gì đang xảy ra. Ở đây chúng ta sẽ chỉ ra cách sử dụng nó ở mức độ cơ bản để cải thiện khả năng tiếp cận.
- [Đa phương tiện dễ tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/Multimedia)
  - : Một loại nội dung khác có thể tạo ra các vấn đề về khả năng tiếp cận là đa phương tiện — nội dung video, âm thanh và hình ảnh cần được cung cấp các phương án thay thế bằng văn bản phù hợp, để các công nghệ hỗ trợ và người dùng của chúng có thể hiểu được. Bài viết này chỉ ra cách thực hiện.
- [Khả năng tiếp cận trên thiết bị di động](/en-US/docs/Learn_web_development/Core/Accessibility/Mobile)
  - : Với việc truy cập web trên thiết bị di động ngày càng phổ biến, và các nền tảng phổ biến như iOS và Android có đầy đủ các công cụ hỗ trợ khả năng tiếp cận, điều quan trọng là phải xem xét khả năng tiếp cận nội dung web của bạn trên các nền tảng này. Bài viết này xem xét các cân nhắc về khả năng tiếp cận dành riêng cho thiết bị di động.
- [Xử lý sự cố khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/Accessibility_troubleshooting) <sup>Thử thách</sup>
  - : Trong thử thách này, chúng tôi trình bày cho bạn một trang web đơn giản với một số vấn đề về khả năng tiếp cận mà bạn cần chẩn đoán và sửa chữa.

## Kiểm tra kỹ năng của bạn

Bạn sẽ tìm thấy các bài viết "Kiểm tra kỹ năng của bạn" được đặt giữa các bài viết hướng dẫn để kiểm tra xem bạn đã nắm được thông tin quan trọng nhất trước khi tiếp tục hay chưa. Nếu bạn muốn khám phá tất cả những điều này cùng nhau, bạn có thể tìm thấy chúng được liệt kê tại [Kiểm tra kỹ năng: Khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/Test_your_skills).

## Xem thêm

- [Bắt đầu xây dựng ứng dụng web dễ tiếp cận ngay hôm nay](https://egghead.io/courses/start-building-accessible-web-applications-today)
  - : Một chuỗi hướng dẫn video xuất sắc của Marcy Sutton.
- [Tài nguyên của Đại học Deque](https://dequeuniversity.com/resources/)
  - : Bao gồm các ví dụ mã, tài liệu tham khảo về trình đọc màn hình và các tài nguyên hữu ích khác.
- [Tài nguyên WebAIM](https://webaim.org/resources/)
  - : Bao gồm hướng dẫn, danh sách kiểm tra, công cụ và nhiều hơn nữa.
- [Danh sách công cụ đánh giá khả năng tiếp cận web](https://www.w3.org/WAI/ER/tools/)
  - : Bao gồm danh sách các công cụ đánh giá khả năng tiếp cận web.
- [Học thiết kế web dễ tiếp cận](https://scrimba.com/learn-accessible-web-design-c031?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Học thiết kế web dễ tiếp cận_ của [Scrimba](https://scrimba.com/?via=mdn) dạy bạn cách viết HTML dễ tiếp cận bằng cách giải quyết các thử thách mã hóa tương tác và sửa một trang web thực tế.

{{NextMenu("Learn_web_development/Core/Accessibility/What_is_accessibility", "Learn_web_development/Core")}}
