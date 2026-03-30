---
title: Thread
slug: Glossary/Thread
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong khoa học máy tính, luồng (thread) là quá trình thực thi nhiều tác vụ hoặc chương trình cùng một lúc. Mỗi đơn vị có khả năng thực thi mã được gọi là một **luồng**.

**{{Glossary("main thread", "Luồng chính")}}** là luồng mà trình duyệt sử dụng để xử lý các sự kiện người dùng, kết xuất và vẽ màn hình, và chạy phần lớn mã tạo nên một trang web hoặc ứng dụng web thông thường. Vì tất cả các việc này xảy ra trong một luồng, một trang web hoặc tập lệnh ứng dụng chậm sẽ làm chậm toàn bộ trình duyệt; tệ hơn, nếu một tập lệnh trang web hoặc ứng dụng rơi vào vòng lặp vô tận, toàn bộ trình duyệt sẽ bị treo. Điều này dẫn đến trải nghiệm người dùng khó chịu và chậm chạp (hoặc tệ hơn).

{{Glossary("JavaScript")}} hiện đại cung cấp các cách tạo thêm các luồng, mỗi luồng thực thi độc lập trong khi có thể giao tiếp với nhau. Điều này được thực hiện bằng các công nghệ như [web workers](/en-US/docs/Web/API/Web_Workers_API), có thể được dùng để khởi chạy một chương trình con chạy song song với luồng chính trong luồng riêng của nó. Điều này cho phép các tác vụ chậm, phức tạp hoặc chạy lâu được thực thi độc lập khỏi luồng chính, giữ nguyên hiệu suất tổng thể của trang web hoặc ứng dụng — cũng như hiệu suất của trình duyệt nói chung. Đa luồng cũng cho phép các ứng dụng web tận dụng lợi thế của các bộ xử lý đa nhân hiện đại: giúp đạt hiệu suất thậm chí còn tốt hơn so với các ứng dụng đa luồng chạy trên một lõi đơn.

Một loại worker đặc biệt, gọi là **[service worker](/en-US/docs/Web/API/Service_Worker_API)**, có thể được tạo ra để lại bởi một trang web — với sự cho phép của người dùng — để chạy ngay cả khi người dùng hiện tại không sử dụng trang đó. Điều này được dùng để tạo các trang web có khả năng thông báo cho người dùng khi có sự kiện xảy ra trong khi họ không tích cực tương tác với trang. Ví dụ thông báo cho người dùng rằng họ đã nhận được email mới ngay cả khi họ hiện không đăng nhập vào dịch vụ email của mình.

Nhìn chung, có thể thấy rằng các luồng trong hệ điều hành của chúng ta cực kỳ hữu ích. Chúng giúp giảm thiểu thời gian chuyển đổi ngữ cảnh, cho phép giao tiếp hiệu quả hơn và cho phép sử dụng thêm kiến trúc đa xử lý.

## Xem thêm

- [JavaScript bất đồng bộ](/en-US/docs/Learn_web_development/Extensions/Async_JS)
- [Web worker API](/en-US/docs/Web/API/Web_Workers_API)
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)
- Các thuật ngữ liên quan:
  - {{Glossary("Main thread")}}
