---
title: "Thử thách: Xử lý sự cố khả năng tiếp cận"
short-title: "Thử thách: Gỡ lỗi khả năng tiếp cận"
slug: Learn_web_development/Core/Accessibility/Accessibility_troubleshooting
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Mobile","Learn_web_development/Core/Design_for_developers", "Learn_web_development/Core/Accessibility")}}

Trong thử thách của mô-đun này, chúng tôi trình bày cho bạn một trang web đơn giản với một số vấn đề về khả năng tiếp cận mà bạn cần chẩn đoán và sửa chữa.

## Điểm bắt đầu

Để bắt đầu thử thách này, bạn nên lấy [tệp ZIP chứa các tệp tạo nên ví dụ](https://raw.githubusercontent.com/mdn/learning-area/main/accessibility/assessment-start/assessment-files.zip). Giải nén nội dung vào một thư mục mới ở đâu đó trên máy tính cục bộ của bạn.

Ngoài ra, bạn có thể sử dụng trình chỉnh sửa trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

Trang web thử thách hoàn chỉnh sẽ trông như thế này:

![Ảnh chụp màn hình của trang thử thách hoàn chỉnh với độ tương phản màu sắc tốt. Đầu vào tìm kiếm có văn bản giữ chỗ và nút gửi với nội dung "go", nhưng không có nhãn hiển thị.](assessment-site-finished.png)

Bạn sẽ thấy một số sự khác biệt/vấn đề với màn hình hiển thị của trạng thái ban đầu của thử thách — đây chủ yếu là do sự khác biệt trong đánh dấu, từ đó gây ra một số vấn đề về kiểu dáng vì CSS không được áp dụng đúng cách. Đừng lo lắng — bạn sẽ sửa những vấn đề này trong các phần sắp tới!

> [!NOTE]
> Nếu bạn bị kẹt, bạn có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Tóm tắt dự án

Trong dự án này, bạn được trình bày một trang web thiên nhiên hư cấu hiển thị một bài viết "thực tế" về gấu. Hiện tại, nó có một số vấn đề về khả năng tiếp cận — nhiệm vụ của bạn là khám phá trang web hiện có và sửa chúng tốt nhất có thể, trả lời các câu hỏi được đưa ra dưới đây.

### Màu sắc

Văn bản khó đọc do sơ đồ màu hiện tại. Bạn có thể thực hiện kiểm tra độ tương phản màu hiện tại (văn bản/nền), báo cáo kết quả kiểm tra, và sau đó sửa nó bằng cách thay đổi màu sắc được chỉ định không?

### HTML ngữ nghĩa

1. Nội dung vẫn chưa dễ tiếp cận lắm — báo cáo điều gì xảy ra khi bạn cố điều hướng nó bằng trình đọc màn hình.
2. Bạn có thể cập nhật văn bản bài viết để giúp người dùng trình đọc màn hình điều hướng dễ hơn không?
3. Phần menu điều hướng của trang (được bao bọc trong `<div class="nav"></div>`) có thể được làm dễ tiếp cận hơn bằng cách đặt nó trong một phần tử HTML ngữ nghĩa thích hợp. Phần tử nào nên được cập nhật thành? Thực hiện cập nhật.

> [!NOTE]
> Bạn cần cập nhật các bộ chọn quy tắc CSS định kiểu các thẻ thành các phần tử tương đương thích hợp cho các tiêu đề ngữ nghĩa. Khi bạn thêm các phần tử đoạn văn, bạn sẽ nhận thấy kiểu dáng trông đẹp hơn.

### Hình ảnh

Các hình ảnh hiện tại không thể tiếp cận được đối với người dùng trình đọc màn hình. Bạn có thể sửa điều này không?

### Trình phát âm thanh

1. Trình phát `<audio>` không thể tiếp cận với những người suy giảm thính giác (điếc) — bạn có thể thêm một loại phương án thay thế dễ tiếp cận cho những người dùng này không?
2. Trình phát `<audio>` không thể tiếp cận với những người sử dụng các trình duyệt cũ hơn không hỗ trợ HTML audio. Làm thế nào bạn có thể cho phép họ vẫn truy cập âm thanh?

### Các form

1. Phần tử `<input>` trong form tìm kiếm ở đầu có thể cần nhãn, nhưng chúng ta không muốn thêm nhãn văn bản hiển thị có thể làm hỏng thiết kế và không thực sự cần thiết cho người dùng có thị lực. Làm thế nào bạn có thể thêm nhãn chỉ có thể tiếp cận bởi trình đọc màn hình?
2. Hai phần tử `<input>` trong form bình luận có nhãn văn bản hiển thị, nhưng chúng không được liên kết rõ ràng với nhãn của chúng — làm thế nào bạn đạt được điều này? Lưu ý rằng bạn cũng cần cập nhật một số quy tắc CSS.

### Điều khiển hiển thị/ẩn bình luận

Nút điều khiển hiển thị/ẩn bình luận hiện không thể điều hướng bằng bàn phím. Bạn có thể làm cho nó có thể điều hướng bằng bàn phím không, cả về việc tập trung vào nó bằng phím tab và kích hoạt nó bằng phím Enter không?

### Bảng

Bảng dữ liệu hiện tại không thể tiếp cận lắm — người dùng trình đọc màn hình khó liên kết các hàng và cột dữ liệu với nhau, và bảng cũng không có loại tóm tắt nào để làm rõ những gì nó hiển thị. Bạn có thể thêm một số tính năng vào HTML của mình để sửa vấn đề này không?

### Các cân nhắc khác?

Bạn có thể liệt kê thêm hai ý tưởng cải tiến để làm cho trang web dễ tiếp cận hơn không?

{{PreviousMenuNext("Learn_web_development/Core/Accessibility/Mobile","Learn_web_development/Core/Design_for_developers", "Learn_web_development/Core/Accessibility")}}
