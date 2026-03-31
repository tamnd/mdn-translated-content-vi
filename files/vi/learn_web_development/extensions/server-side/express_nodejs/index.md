---
title: Framework web Express (Node.js/JavaScript)
slug: Learn_web_development/Extensions/Server-side/Express_Nodejs
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction", "Learn_web_development/Extensions/Server-side")}}

Express là một framework web phổ biến, không áp đặt quan điểm, được viết bằng JavaScript và chạy trong môi trường thực thi Node.js. Module này giải thích một số lợi ích chính của framework, cách thiết lập môi trường phát triển và cách thực hiện các tác vụ phát triển và triển khai web phổ biến.

## Điều kiện tiên quyết

Trước khi bắt đầu module này, bạn cần hiểu lập trình web phía máy chủ và các framework web là gì, lý tưởng nhất là bằng cách đọc các chủ đề trong module [Các bước đầu tiên về lập trình web phía máy chủ](/en-US/docs/Learn_web_development/Extensions/Server-side/First_steps) của chúng tôi. Kiến thức chung về các khái niệm lập trình và [JavaScript](/en-US/docs/Web/JavaScript) được khuyến nghị cao, nhưng không cần thiết để hiểu các khái niệm cốt lõi.

> [!NOTE]
> Trang web này có nhiều tài nguyên hữu ích để học JavaScript _trong ngữ cảnh phát triển phía máy khách_: [JavaScript](/en-US/docs/Web/JavaScript), [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide), [Kiến thức cơ bản về JavaScript](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Adding_interactivity), [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) (học). Ngôn ngữ và khái niệm JavaScript cốt lõi giống nhau đối với phát triển phía máy chủ trên Node.js và tài liệu này sẽ có liên quan. Node.js cung cấp [các API bổ sung](https://nodejs.org/dist/latest-v10.x/docs/api/) để hỗ trợ các chức năng hữu ích trong các môi trường không có trình duyệt (ví dụ: để tạo máy chủ HTTP và truy cập hệ thống tệp), nhưng không hỗ trợ các JavaScript API để làm việc với trình duyệt và DOM.
>
> Loạt bài viết này sẽ cung cấp một số thông tin về làm việc với Node.js và Express, và có nhiều tài nguyên xuất sắc khác trên Internet và trong sách — một số được liên kết từ [Làm thế nào để tôi bắt đầu với Node.js](https://stackoverflow.com/questions/2353818/how-do-i-get-started-with-node-js/5511507) (Stack Overflow) và [Tài nguyên tốt nhất để học Node.js là gì?](https://www.quora.com/What-is-the-greatest-resource-for-learning-Node-js-for-a-newbie) (Quora).

## Hướng dẫn

- [Giới thiệu Express/Node](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction)
  - : Trong bài viết Express đầu tiên này, chúng tôi trả lời các câu hỏi "Node là gì?" và "Express là gì?" và cho bạn cái nhìn tổng quan về điều gì làm cho framework web Express đặc biệt. Chúng tôi sẽ phác thảo các tính năng chính và hiển thị cho bạn một số khối xây dựng chính của ứng dụng Express (mặc dù ở thời điểm này bạn chưa có môi trường phát triển để kiểm tra nó).
- [Thiết lập môi trường phát triển Node (Express)](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/development_environment)
  - : Bây giờ bạn đã biết Express dùng để làm gì, chúng tôi sẽ chỉ cho bạn cách thiết lập và kiểm tra môi trường phát triển Node/Express trên Windows, Linux (Ubuntu) và macOS. Dù bạn đang sử dụng hệ điều hành phổ biến nào, bài viết này sẽ cung cấp những gì bạn cần để có thể bắt đầu phát triển ứng dụng Express.
- [Hướng dẫn Express: Trang web Thư viện cục bộ](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Tutorial_local_library_website)
  - : Bài viết đầu tiên trong loạt hướng dẫn thực hành của chúng tôi giải thích những gì bạn sẽ học và cung cấp cái nhìn tổng quan về trang web ví dụ "thư viện cục bộ" mà chúng tôi sẽ làm việc và phát triển qua các bài viết tiếp theo.
- [Hướng dẫn Express Phần 2: Tạo trang web khung](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/skeleton_website)
  - : Bài viết này chỉ cho bạn cách tạo dự án trang web "khung", mà bạn có thể tiếp tục điền vào với các tuyến đường, mẫu/views và cơ sở dữ liệu dành riêng cho trang web.
- [Hướng dẫn Express Phần 3: Sử dụng Cơ sở dữ liệu (với Mongoose)](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/mongoose)
  - : Bài viết này giới thiệu ngắn gọn về cơ sở dữ liệu cho Node/Express. Sau đó nó tiếp tục chỉ cho bạn cách chúng tôi có thể sử dụng [Mongoose](https://mongoosejs.com/) để cung cấp quyền truy cập cơ sở dữ liệu cho trang web _LocalLibrary_. Nó giải thích cách lược đồ đối tượng và các mô hình được khai báo, các loại trường chính và xác thực cơ bản. Nó cũng chỉ ra ngắn gọn một số cách chính bạn có thể truy cập dữ liệu mô hình.
- [Hướng dẫn Express Phần 4: Tuyến đường và bộ điều khiển](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/routes)
  - : Trong hướng dẫn này, chúng tôi sẽ thiết lập các tuyến đường (mã xử lý URL) với các hàm xử lý "giả" cho tất cả các điểm cuối tài nguyên mà cuối cùng chúng tôi sẽ cần trong trang web _LocalLibrary_. Khi hoàn thành, chúng tôi sẽ có cấu trúc mô-đun cho mã xử lý tuyến đường của mình, mà chúng tôi có thể mở rộng với các hàm xử lý thực trong các bài viết sau. Chúng tôi cũng sẽ có hiểu biết rất tốt về cách tạo tuyến đường mô-đun bằng Express.
- [Hướng dẫn Express Phần 5: Hiển thị dữ liệu thư viện](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/Displaying_data)
  - : Bây giờ chúng tôi đã sẵn sàng thêm các trang hiển thị sách trang web _LocalLibrary_ và dữ liệu khác. Các trang sẽ bao gồm trang chủ hiển thị số lượng bản ghi chúng tôi có cho mỗi loại mô hình và các trang danh sách và chi tiết cho tất cả các mô hình của chúng tôi. Trong quá trình đó, chúng tôi sẽ có kinh nghiệm thực tế trong việc lấy bản ghi từ cơ sở dữ liệu và sử dụng mẫu.
- [Hướng dẫn Express Phần 6: Làm việc với biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/forms)
  - : Trong hướng dẫn này, chúng tôi sẽ chỉ cho bạn cách làm việc với [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) trong Express, sử dụng Pug và cụ thể là cách viết biểu mẫu để tạo, cập nhật và xóa tài liệu từ cơ sở dữ liệu.
- [Hướng dẫn Express Phần 7: Triển khai lên môi trường sản xuất](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs/deployment)
  - : Bây giờ bạn đã tạo trang web _LocalLibrary_ tuyệt vời, bạn muốn cài đặt nó trên máy chủ web công cộng để nhân viên thư viện và thành viên có thể truy cập qua Internet. Bài viết này cung cấp cái nhìn tổng quan về cách bạn có thể tìm máy chủ để triển khai trang web của mình và những gì bạn cần làm để đưa trang web vào môi trường sản xuất.

## Thêm hướng dẫn

Tất cả các hướng dẫn hiện có được liệt kê ở trên, nhưng nếu bạn muốn mở rộng module này, một số chủ đề thú vị khác để đề cập bao gồm:

- Sử dụng phiên.
- Xác thực người dùng.
- Phân quyền và quyền người dùng.
- Kiểm thử ứng dụng web Express.
- Bảo mật web cho các ứng dụng web Express.

Đánh giá cho module cũng sẽ là một bổ sung tuyệt vời!

{{NextMenu("Learn_web_development/Extensions/Server-side/Express_Nodejs/Introduction", "Learn_web_development/Extensions/Server-side")}}
