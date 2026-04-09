---
title: Thực hành tốt nhất cho PWA
slug: Web/Progressive_web_apps/Guides/Best_practices
page-type: guide
sidebar: pwasidebar
---

[Ứng dụng Web Tiến bộ](/en-US/docs/Web/Progressive_web_apps) (PWA) có thể được cài đặt trên thiết bị và được dùng như website truyền thống trong trình duyệt web. Điều này có nghĩa là PWA cần có khả năng thích ứng với các môi trường khác nhau và với các kỳ vọng khác nhau của người dùng.

Bài viết này cung cấp một danh sách thực hành tốt nhất để giúp bạn bảo đảm PWA của mình tốt nhất có thể.

## Thích ứng với mọi trình duyệt

PWA của bạn được xây dựng trên công nghệ web. Điều này có nghĩa là, ngoài việc có thể được cài đặt lên thiết bị, PWA còn có thể chạy trong trình duyệt web. Để bảo đảm tương thích, điều thiết yếu là phải [kiểm thử ứng dụng](/en-US/docs/Learn_web_development/Extensions/Testing) trên nhiều trình duyệt và hệ điều hành khác nhau.

Hãy cân nhắc dải trình duyệt đa dạng mà người dùng có thể sử dụng và phục vụ một phổ rộng người dùng tiềm năng. Dùng [phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) giúp bạn mang lại trải nghiệm hữu dụng cho đông đảo khán giả nhất.

Phát hiện tính năng cũng giúp với {{Glossary("Progressive Enhancement")}}, một triết lý thiết kế cho phép mang lại trải nghiệm tốt cho nhiều người dùng nhất có thể.

Với Progressive Enhancement, bạn tập trung trước hết vào việc làm cho các chức năng cốt lõi của ứng dụng hoạt động phổ quát bằng công nghệ đơn giản nhất, rồi tăng cường trải nghiệm cho các thiết bị hỗ trợ.

Ví dụ, xử lý việc gửi biểu mẫu bằng phần tử HTML {{htmlelement("form")}} có nghĩa là biểu mẫu sẽ hoạt động trên mọi trình duyệt, kể cả những trình duyệt không hỗ trợ JavaScript. Sau đó bạn có thể tăng cường dần biểu mẫu bằng xác thực phía client và xử lý gửi bằng JavaScript để có trải nghiệm tốt hơn trên các thiết bị tương thích.

## Thích ứng với mọi thiết bị

Tương tự như việc kiểm thử ứng dụng trên nhiều trình duyệt là quan trọng, kiểm thử trên nhiều thiết bị cũng bảo đảm ứng dụng của bạn có thể truy cập tới đông đảo người dùng nhất.

[Thiết kế đáp ứng](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design) là yếu tố then chốt đối với PWA để bảo đảm nội dung có thể truy cập trên mọi kích cỡ màn hình. Người dùng nên có thể truy cập mọi tính năng và nội dung bất kể kích cỡ màn hình thiết bị của họ. Bằng cách sắp xếp lại nội dung ở các kích thước khung nhìn khác nhau, bạn có thể ưu tiên dữ liệu và hành động quan trọng.

Hãy bảo đảm người dùng có thể tương tác với ứng dụng của bạn bằng bất kỳ cách nào họ truy cập nội dung. Hỗ trợ bàn phím và chuột, cũng như các phương thức nhập bằng cảm ứng hoặc bút stylus. Hãy chắc chắn mọi tính năng của ứng dụng đều có thể truy cập qua bất kỳ phương thức nhập nào.

Cuối cùng, hãy dùng [các phần tử HTML ngữ nghĩa](/en-US/docs/Glossary/Semantics#semantics_in_html) thay vì tự tạo nút hay phần tử biểu mẫu riêng, vì các phần tử HTML ngữ nghĩa hỗ trợ sẵn mọi phương thức nhập của người dùng.

## Cung cấp trải nghiệm ngoại tuyến

Người dùng các ứng dụng đã cài đặt kỳ vọng chúng luôn hoạt động; ngay cả khi kết nối với mạng chậm hoặc không ổn định, hoặc khi thiết bị hoàn toàn ngoại tuyến.

### Trang ngoại tuyến tùy chỉnh

Ít nhất, PWA của bạn nên cung cấp một trang ngoại tuyến tùy chỉnh để thông báo cho người dùng rằng họ đang ngoại tuyến thay vì hiển thị trang lỗi chung của trình duyệt. Một trang ngoại tuyến tùy chỉnh cung cấp trải nghiệm nhất quán hơn trên các trình duyệt và thiết bị, đồng thời giữ người dùng tiếp tục tương tác với ứng dụng của bạn.

Bạn có thể cung cấp một trang ngoại tuyến tùy chỉnh bằng cách dùng [service worker](/en-US/docs/Web/API/Service_Worker_API) để chặn các yêu cầu mạng và phản hồi bằng trang ngoại tuyến tùy chỉnh khi người dùng ngoại tuyến.

### Hoạt động ngoại tuyến

Để tiến xa hơn và cung cấp trải nghiệm giống ứng dụng, PWA của bạn nên hoạt động khi người dùng ngoại tuyến. Điều này có nghĩa là người dùng có thể tiếp tục dùng một phần, và tốt hơn là toàn bộ, chức năng của ứng dụng ngay cả khi họ ngoại tuyến.

Hãy xem tình huống sau: người dùng soạn một email dài và nhấn "Send", không nhận ra rằng họ đã mất kết nối mạng. Vì ứng dụng của bạn hoạt động ngoại tuyến, email sẽ được lưu cục bộ và gửi tự động khi thiết bị kết nối lại.

Tìm hiểu thêm về [hoạt động ngoại tuyến và chạy nền](/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation).

## Hỗ trợ deep link

Deep link là các siêu liên kết trỏ tới những trang cụ thể trong miền của ứng dụng. Ví dụ, trang chủ của bạn có thể ở `https://example.com/`, nhưng bạn cũng có thể liên kết tới một trang sản phẩm cụ thể ở `https://example.com/products/123`.

Khả năng tham chiếu tới bất kỳ tài nguyên nào bằng một URL duy nhất là một trong những tính năng mạnh nhất của web. Vì được xây dựng trên công nghệ web, PWA có thể và nên tận dụng tính năng này.

Việc làm cho các phần khác nhau của ứng dụng có thể truy cập qua các URL riêng biệt cho phép người dùng đánh dấu trang, điều hướng trực tiếp tới, và chia sẻ nội dung cụ thể trong ứng dụng của bạn. Nó cũng cho phép công cụ tìm kiếm lập chỉ mục nội dung ứng dụng của bạn và làm cho nó có thể được khám phá qua tìm kiếm web.

## Làm cho nó nhanh

Người dùng có kỳ vọng khác nhau đối với ứng dụng đã cài đặt so với website. Người dùng chấp nhận website cần thời gian để tải và điều hướng, đặc biệt trên kết nối mạng kém. Tuy nhiên, họ kỳ vọng ứng dụng đã cài đặt phải luôn nhanh và phản hồi tốt.

Tốc độ tải và thực hiện các chức năng cốt lõi của ứng dụng đóng vai trò quan trọng đối với mức độ gắn bó và giữ chân người dùng. Càng lâu để ứng dụng phản hồi, càng có nhiều người dùng bỏ đi.

Có các công cụ, API, và thực hành tốt nhất giúp đo lường và cải thiện hiệu năng. Để biết thêm, xem [web performance](/en-US/docs/Web/Performance).

## Làm cho nó có thể truy cập

Trợ năng rất quan trọng để bảo đảm mọi người đều có thể dùng ứng dụng của bạn, bất kể khả năng của từng người hay thiết bị họ dùng để truy cập ứng dụng. Trợ năng bảo đảm càng nhiều người càng có thể dùng ứng dụng của bạn càng tốt. Trợ năng cũng là yêu cầu pháp lý. Hơn nữa, trợ năng thường dẫn đến trải nghiệm người dùng tốt hơn cho tất cả mọi người, không chỉ những người có khuyết tật tạm thời hoặc vĩnh viễn.

Tìm hiểu cách làm cho ứng dụng của bạn có thể truy cập trong [accessibility](/en-US/docs/Web/Accessibility).

## Cung cấp trải nghiệm giống ứng dụng

### Tích hợp với hệ điều hành

Người dùng kỳ vọng PWA đã cài đặt sẽ hoạt động giống như bất kỳ ứng dụng gốc nào của nền tảng. Để mang lại trải nghiệm giống ứng dụng mà người dùng mong đợi, hãy tích hợp ứng dụng của bạn với hệ điều hành theo một cách nào đó. Ví dụ:

- Dùng [Notifications API](/en-US/docs/Web/API/Notifications_API) để gửi thông báo tới thiết bị của người dùng.
- Xử lý tệp với thành phần manifest web app [`file_handlers`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/file_handlers).
- [Hiển thị huy hiệu](/en-US/docs/Web/Progressive_web_apps/How_to/Display_badge_on_app_icon) trên biểu tượng ứng dụng.
- Bật [chia sẻ dữ liệu giữa các ứng dụng](/en-US/docs/Web/Progressive_web_apps/How_to/Share_data_between_apps).

Nhiều [thành phần manifest ứng dụng web](/en-US/docs/Web/Progressive_web_apps/Manifest#members) có thể được dùng để tùy biến cách ứng dụng của bạn hiển thị trên thiết bị người dùng và tích hợp sâu hơn với hệ điều hành.

### Giao diện và cảm giác của ứng dụng

Người dùng cài đặt ứng dụng để có trải nghiệm tập trung hơn so với website và thực hiện tác vụ hiệu quả hơn. Họ kỳ vọng ứng dụng gọn gàng hơn, ít rối mắt hơn, và tập trung vào các tác vụ quan trọng nhất.

Hãy bảo đảm PWA của bạn mang lại trải nghiệm giống ứng dụng bằng cách cân nhắc các hướng dẫn sau:

- Dùng [chế độ hiển thị standalone](/en-US/docs/Web/Progressive_web_apps/How_to/Create_a_standalone_app) để cho ứng dụng có cửa sổ riêng.
- [Xác định biểu tượng ứng dụng của bạn](/en-US/docs/Web/Progressive_web_apps/How_to/Define_app_icons).
- Phát hiện giao diện người dùng thích bằng tính năng media {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}} và điều chỉnh theme của ứng dụng cho phù hợp.
- [Tùy biến màu theme và màu nền của ứng dụng](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors) để tạo trải nghiệm chỉn chu hơn, giống ứng dụng nền tảng hơn.
- Giảm bớt nội dung rối và tập trung vào các tác vụ quan trọng nhất mà ứng dụng cho phép người dùng làm. Điều này có thể có nghĩa là bỏ các header và footer lớn thường thấy trên website, và thay bằng một ẩn dụ menu.
- Dùng {{cssxref("font-family")}} `system-ui` để nội dung của bạn có cảm giác gốc nền tảng hơn và tải nhanh hơn mà không cần người dùng tải một phông chữ tùy chỉnh.

## Xem thêm

- [What makes a good Progressive Web App](https://web.dev/articles/pwa-checklist) trên web.dev (2022).
- [Best practices for PWAs](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/best-practices) trên learn.microsoft.com (2023).
