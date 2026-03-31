---
title: Lập trình web phía máy chủ
short-title: Trang web phía máy chủ
slug: Learn_web_development/Extensions/Server-side
page-type: learn-topic
sidebar: learnsidebar
---

Chủ đề **_Trang web động_** – **Lập trình phía máy chủ (server-side)** là một chuỗi các mô-đun hướng dẫn cách tạo trang web động; các trang web phân phối thông tin tùy chỉnh theo từng yêu cầu HTTP. Các mô-đun cung cấp giới thiệu tổng quát về lập trình phía máy chủ, cùng với các hướng dẫn cụ thể dành cho người mới bắt đầu về cách sử dụng framework web Django (Python) và Express (Node.js/JavaScript) để tạo các ứng dụng cơ bản.

Hầu hết các trang web lớn đều sử dụng một số loại công nghệ phía máy chủ để hiển thị dữ liệu một cách động theo yêu cầu. Ví dụ, hãy tưởng tượng có bao nhiêu sản phẩm được bán trên Amazon, và hãy tưởng tượng có bao nhiêu bài đăng đã được viết trên Facebook. Hiển thị tất cả những thứ này bằng các trang tĩnh khác nhau sẽ cực kỳ kém hiệu quả, vì vậy thay vào đó, các trang web như vậy hiển thị các mẫu tĩnh (được xây dựng bằng [HTML](/en-US/docs/Learn_web_development/Core/Structuring_content), [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics), và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting)), sau đó cập nhật động dữ liệu được hiển thị bên trong các mẫu đó khi cần thiết, chẳng hạn như khi bạn muốn xem một sản phẩm khác trên Amazon.

Trong thế giới phát triển web hiện đại, việc học về phát triển phía máy chủ được khuyến khích cao.

## Điều kiện tiên quyết

Bắt đầu với lập trình phía máy chủ thường dễ hơn phát triển phía máy khách (client-side), vì các trang web động thường thực hiện rất nhiều thao tác tương tự nhau (lấy dữ liệu từ cơ sở dữ liệu và hiển thị lên trang, xác thực dữ liệu người dùng nhập và lưu vào cơ sở dữ liệu, kiểm tra quyền người dùng và đăng nhập người dùng, v.v.), và được xây dựng bằng các framework web giúp các thao tác máy chủ web phổ biến này và các thao tác khác trở nên dễ dàng hơn.

Kiến thức cơ bản về khái niệm lập trình (hoặc một ngôn ngữ lập trình cụ thể) thì hữu ích, nhưng không bắt buộc. Tương tự, chuyên môn về lập trình phía máy khách (client-side) không bắt buộc, nhưng kiến thức cơ bản sẽ giúp bạn làm việc tốt hơn với các nhà phát triển đang tạo ra "giao diện người dùng" web phía máy khách của bạn.

Bạn cần phải hiểu "web hoạt động như thế nào". Chúng tôi đề xuất bạn đọc trước các chủ đề sau:

- [Máy chủ web là gì](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_web_server)
- [Tôi cần phần mềm gì để xây dựng trang web?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_software_do_I_need)
- [Làm thế nào để tải tệp lên máy chủ web?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/Upload_files_to_a_web_server)

Với sự hiểu biết cơ bản đó, bạn sẽ sẵn sàng làm việc qua các mô-đun trong phần này.

## Các mô-đun

Chủ đề này chứa các mô-đun sau. Bạn nên bắt đầu với mô-đun đầu tiên, sau đó chuyển sang một trong các mô-đun tiếp theo, nơi trình bày cách làm việc với hai ngôn ngữ phía máy chủ rất phổ biến sử dụng các framework web phù hợp.

- [Các bước đầu tiên trong lập trình trang web phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps)
  - : Mô-đun này cung cấp thông tin độc lập về công nghệ trong lập trình trang web phía máy chủ như "nó là gì?", "nó khác như thế nào với lập trình phía máy khách?", và "tại sao nó hữu ích?". Mô-đun này cũng phác thảo một số framework web phía máy chủ phổ biến hơn và đưa ra hướng dẫn về cách chọn cái tốt nhất cho trang web của bạn. Cuối cùng, phần giới thiệu về bảo mật máy chủ web được cung cấp.
- [Framework web Django (Python)](/en-US/docs/Learn_web_development/Extensions/Server-side/Django)
  - : Django là một framework web phía máy chủ cực kỳ phổ biến và đầy đủ tính năng, được viết bằng Python. Mô-đun giải thích tại sao Django là framework máy chủ web tốt như vậy, cách thiết lập môi trường phát triển và cách thực hiện các tác vụ phổ biến với nó.
- [Framework web Express (Node.js/JavaScript)](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs)
  - : Express là một framework web phổ biến, được viết bằng JavaScript và được lưu trữ trong môi trường runtime Node.js. Mô-đun giải thích một số lợi ích chính của framework này, cách thiết lập môi trường phát triển của bạn và cách thực hiện các tác vụ phát triển và triển khai web thông thường.

## Xem thêm

- [Máy chủ Node.js không có framework](/en-US/docs/Learn_web_development/Extensions/Server-side/Node_server_without_framework)
  - : Bài viết này cung cấp một máy chủ tệp tĩnh đơn giản được xây dựng bằng Node.js thuần túy, dành cho những ai không muốn sử dụng framework.
- [Cấu hình đúng các kiểu MIME của máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/Configuring_server_MIME_types)
  - : Cấu hình máy chủ của bạn để gửi đúng {{Glossary("MIME type", "kiểu MIME")}} (còn được gọi là kiểu phương tiện hoặc kiểu nội dung) đến trình duyệt là quan trọng để trình duyệt có thể xử lý và hiển thị nội dung đúng cách.
    Điều này cũng quan trọng để ngăn nội dung độc hại giả mạo dưới dạng nội dung vô hại.
- [Cấu hình Apache: .htaccess](/en-US/docs/Learn_web_development/Extensions/Server-side/Apache_Configuration_htaccess)
  - : Các tệp .htaccess của Apache cho phép người dùng cấu hình các thư mục của máy chủ web mà họ kiểm soát mà không cần sửa đổi tệp cấu hình chính.
