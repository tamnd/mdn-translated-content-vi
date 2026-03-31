---
title: Kiểm thử
slug: Learn_web_development/Extensions/Testing
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Testing/Introduction", "Learn_web_development/Extensions")}}

Bất kỳ cơ sở mã nào vượt qua một mức độ phức tạp nhất định đều cần có một hệ thống kiểm thử liên quan, để đảm bảo rằng khi mã mới được thêm vào, cơ sở mã tiếp tục hoạt động đúng và hiệu quả, và tiếp tục đáp ứng nhu cầu người dùng. Mô-đun này liệt kê các nguyên tắc cơ bản mà bạn nên bắt đầu.

> [!NOTE]
> Mô-đun này ban đầu được dành riêng hoàn toàn cho kiểm thử đa trình duyệt, nhưng chúng ta đang trong quá trình tập trung lại nó để bao gồm kiểm thử nói chung. Khi chúng ta tìm thấy thời gian, chúng ta có ý định cập nhật tài liệu để bao gồm các nguyên tắc kiểm thử tổng quát, kiểm thử chức năng và tương thích, và kiểm thử khả năng sử dụng.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn thực sự nên đã học các kiến thức cơ bản về [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting).

## Hướng dẫn

- [Giới thiệu về kiểm thử đa trình duyệt](/en-US/docs/Learn_web_development/Extensions/Testing/Introduction)
  - : Bài viết này bắt đầu mô-đun bằng cách cung cấp tổng quan về chủ đề kiểm thử đa trình duyệt, trả lời các câu hỏi như "kiểm thử đa trình duyệt là gì?", "những loại vấn đề phổ biến nhất mà bạn sẽ gặp là gì?", và "các cách tiếp cận chính để kiểm thử, xác định và khắc phục sự cố là gì?"
- [Chiến lược thực hiện kiểm thử](/en-US/docs/Learn_web_development/Extensions/Testing/Testing_strategies)
  - : Tiếp theo, chúng ta đào sâu vào việc thực hiện kiểm thử, xem xét việc xác định đối tượng mục tiêu (ví dụ: trình duyệt, thiết bị và các phân khúc khác mà bạn nên đảm bảo được kiểm thử), chiến lược kiểm thử đơn giản (lấy cho mình một loạt thiết bị và một số máy ảo và thực hiện các bài kiểm thử đặc biệt khi cần), chiến lược công nghệ cao hơn (tự động hóa, sử dụng các ứng dụng kiểm thử chuyên dụng), và kiểm thử với các nhóm người dùng.
- [Xử lý các vấn đề HTML và CSS thông thường](/en-US/docs/Learn_web_development/Extensions/Testing/HTML_and_CSS)
  - : Với bối cảnh đã được thiết lập, chúng ta sẽ xem xét cụ thể các vấn đề đa trình duyệt thông thường mà bạn sẽ gặp trong mã HTML và CSS, và những công cụ nào có thể được sử dụng để ngăn chặn sự cố xảy ra, hoặc sửa các sự cố xảy ra. Điều này bao gồm kiểm tra mã, xử lý tiền tố CSS, sử dụng các công cụ phát triển trình duyệt để theo dõi sự cố, sử dụng polyfill để thêm hỗ trợ vào trình duyệt, giải quyết các vấn đề thiết kế đáp ứng, và nhiều hơn nữa.
- [Thực hiện phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection)
  - : Phát hiện tính năng liên quan đến việc tìm hiểu xem trình duyệt có hỗ trợ một khối mã nhất định không, và chạy mã khác nhau tùy thuộc vào việc nó có hỗ trợ không, để trình duyệt luôn có thể cung cấp trải nghiệm làm việc thay vì gặp lỗi trong một số trình duyệt. Bài viết này chi tiết cách viết bài kiểm thử phát hiện tính năng đơn giản của riêng bạn, cách sử dụng thư viện để tăng tốc triển khai, và các tính năng gốc để phát hiện tính năng như `@supports`.
- [Giới thiệu về kiểm thử tự động](/en-US/docs/Learn_web_development/Extensions/Testing/Automated_testing)
  - : Chạy thủ công các bài kiểm thử trên nhiều trình duyệt và thiết bị, nhiều lần mỗi ngày, có thể trở nên tẻ nhạt và tốn thời gian. Để xử lý điều này hiệu quả, bạn nên quen thuộc với các công cụ tự động hóa. Trong bài viết này, chúng ta xem xét những gì có sẵn, cách sử dụng trình chạy tác vụ, và những điều cơ bản về cách sử dụng các ứng dụng kiểm thử đa trình duyệt thương mại như Sauce Labs và Browser Stack.
- [Thiết lập môi trường tự động hóa kiểm thử của riêng bạn](/en-US/docs/Learn_web_development/Extensions/Testing/Your_own_automation_environment)
  - : Trong bài viết này, chúng ta sẽ dạy bạn cách cài đặt môi trường tự động hóa của riêng bạn và chạy các bài kiểm thử của riêng bạn bằng Selenium/WebDriver và thư viện kiểm thử như selenium-webdriver cho Node. Chúng ta cũng sẽ xem xét cách tích hợp môi trường kiểm thử cục bộ của bạn với các ứng dụng thương mại như những ứng dụng được thảo luận trong bài viết trước.

{{NextMenu("Learn_web_development/Extensions/Testing/Introduction", "Learn_web_development/Extensions")}}
