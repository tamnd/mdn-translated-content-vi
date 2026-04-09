---
title: Ngân sách hiệu năng
slug: Web/Performance/Guides/Performance_budgets
page-type: guide
sidebar: performancesidebar
---

Ngân sách hiệu năng là một giới hạn để ngăn chặn các hồi quy. Nó có thể áp dụng cho một tệp, một loại tệp, tất cả các tệp được tải trên một trang, một chỉ số cụ thể (ví dụ: [Time to Interactive](/en-US/docs/Glossary/Time_to_interactive)), một chỉ số tùy chỉnh (ví dụ: Time to Hero Element), hoặc một ngưỡng trong một khoảng thời gian.

## Tại sao tôi cần ngân sách hiệu năng?

Một ngân sách tồn tại để phản ánh những mục tiêu mà bạn có thể đạt được. Đó là một sự đánh đổi giữa trải nghiệm người dùng và các chỉ số hiệu năng khác (ví dụ: tỷ lệ chuyển đổi).

Những mục tiêu này có thể là:

- Dựa trên thời gian (ví dụ: [Time to Interactive](/en-US/docs/Glossary/Time_to_interactive), [First Contentful Paint](/en-US/docs/Glossary/First_contentful_paint)).
- Dựa trên số lượng (ví dụ: số lượng tệp JS/tổng kích thước hình ảnh).
- Dựa trên quy tắc (ví dụ: chỉ số PageSpeed, điểm Lighthouse).

Mục tiêu chính của chúng là ngăn chặn hồi quy, nhưng chúng cũng có thể cung cấp thông tin để dự báo xu hướng (tức là, trong tháng 9, 50% ngân sách đã được dùng trong một tuần).

Ngoài ra, nó có thể làm lộ ra nhu cầu phát triển (tức là, một thư viện lớn có các lựa chọn thay thế nhỏ hơn thường được chọn để giải quyết một vấn đề phổ biến).

## Tôi định nghĩa ngân sách hiệu năng như thế nào?

Một ngân sách nên bao gồm 2 mức:

- Cảnh báo.
- Lỗi.

Mức cảnh báo cho phép bạn chủ động và lên kế hoạch cho bất kỳ khoản nợ kỹ thuật nào, mà không chặn quá trình phát triển hoặc triển khai.

Mức lỗi là một giới hạn trên, nơi các thay đổi sẽ có tác động tiêu cực và dễ nhận thấy.

Bước đầu tiên là đo các thiết bị và tốc độ kết nối mà người dùng của bạn đang đến từ đó (ví dụ: một thiết bị Android khoảng \~$_200_ qua kết nối 3G), bằng nhiều [công cụ](/en-US/docs/Learn_web_development/Extensions/Performance/Best_practices). Các chỉ số dựa trên thời gian này sẽ được chuyển thành ngân sách kích thước tệp.

Mức cơ sở mặc định để giảm tỷ lệ thoát là đạt [Time to Interactive dưới 5 giây trên 3G/4G, và dưới 2 giây cho các lượt tải tiếp theo](https://infrequently.org/2017/10/can-you-afford-it-real-world-web-performance-budgets/). Tuy nhiên, dựa trên mục tiêu và nội dung cụ thể của trang web, bạn có thể chọn tập trung vào các chỉ số khác.

Đối với một trang nặng về văn bản như blog hoặc trang tin tức, chỉ số [First Contentful Paint](/en-US/docs/Glossary/First_contentful_paint) có thể phản ánh hành vi người dùng sát hơn. (ví dụ: Người dùng bắt đầu đọc nhanh đến mức nào), và điều đó sẽ định hướng các ngân sách cụ thể theo tệp (ví dụ: kích thước phông chữ) cũng như các tối ưu hóa của chúng. (ví dụ: dùng [font-display](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-display) để cải thiện [Perceived Performance](/en-US/docs/Learn_web_development/Extensions/Performance/Perceived_performance)).

Giá trị cuối cùng của ngân sách hiệu năng là liên hệ tác động của hiệu năng với các mục tiêu kinh doanh hoặc sản phẩm. Khi xác định các chỉ số, bạn nên tập trung vào [trải nghiệm người dùng](https://extensionworkshop.com/documentation/develop/user-experience-best-practices/), điều này sẽ quyết định không chỉ tỷ lệ thoát hay chuyển đổi mà còn cả khả năng người dùng đó quay lại.

## Tôi triển khai ngân sách hiệu năng như thế nào?

Trong quá trình phát triển, có một số công cụ để chạy kiểm tra trên các tài nguyên mới hoặc đã chỉnh sửa:

- Một module bundler (ví dụ: [webpack](https://webpack.js.org/)), có [tính năng hiệu năng](https://webpack.js.org/configuration/performance/) sẽ thông báo cho bạn khi tài nguyên vượt quá giới hạn đã chỉ định.
- [Bundlesize](https://github.com/siddharthkp/bundlesize), cho phép bạn định nghĩa và chạy kiểm tra kích thước tệp trong pipeline {{glossary("continuous integration")}} (CI) của mình.

Kiểm tra kích thước tệp là tuyến phòng thủ đầu tiên chống lại hồi quy, nhưng việc quy đổi kích thước trở lại các chỉ số thời gian có thể khó khăn vì môi trường phát triển có thể thiếu các script bên thứ ba, và các tối ưu hóa thường được cung cấp bởi [CDN](/en-US/docs/Glossary/CDN).

Bước đầu tiên là xác định một mức cơ sở phát triển cho từng nhánh để so sánh, và độ chính xác của chênh lệch giữa phát triển và sản xuất có thể được dùng làm mục tiêu để khớp tốt hơn với môi trường thực.

[Lighthouse Bot](https://github.com/GoogleChromeLabs/lighthousebot) tích hợp với [Travis CI](https://www.travis-ci.com/) và có thể được dùng để thu thập các chỉ số [Lighthouse](https://developer.chrome.com/docs/lighthouse/overview/) và [Webpage Test](https://www.webpagetest.org/) từ một URL phát triển. Bot sẽ pass hoặc fail dựa trên các điểm tối thiểu được cung cấp.

## Tôi thực thi ngân sách hiệu năng như thế nào?

Càng sớm nhận diện một bổ sung tiềm năng đang đẩy ngân sách vượt mức, bạn càng có thể phân tích tốt hơn trạng thái hiện tại của trang web và xác định các tối ưu hóa hoặc mã không cần thiết.

Tuy nhiên, bạn nên có nhiều ngân sách và phải linh hoạt. Chúng được thiết kế để phản ánh các mục tiêu đang tiến triển của bạn nhưng vẫn cho phép rủi ro và thử nghiệm. Ví dụ, bạn có thể giới thiệu một tính năng làm tăng tổng thời gian tải nhưng lại cố gắng tăng mức độ gắn kết của người dùng. (tức là, người dùng ở lại trang hoặc site bao lâu).

Ngân sách hiệu năng giúp bạn bảo vệ hành vi tối ưu cho những người dùng hiện tại trong khi vẫn cho phép bạn tiếp cận thị trường mới và mang lại trải nghiệm tùy chỉnh.

## Xem thêm

- [Bắt đầu lập ngân sách hiệu năng](https://addyosmani.com/blog/performance-budgets/) của Addy Osmani
- [Performance Budgets 101](https://web.dev/articles/performance-budgets-101) của Milica Mihajlija
- [Performance Budgets That Stick](https://timkadlec.com/remembers/2019-03-07-performance-budgets-that-stick/) của Tim Kadlec
