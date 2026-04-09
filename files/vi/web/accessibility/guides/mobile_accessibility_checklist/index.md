---
title: Danh sách kiểm tra trợ năng trên thiết bị di động
slug: Web/Accessibility/Guides/Mobile_accessibility_checklist
page-type: guide
sidebar: accessibilitysidebar
---

Tài liệu này cung cấp một danh sách kiểm tra ngắn gọn các yêu cầu trợ năng cho nhà phát triển ứng dụng di động. Nó được thiết kế để liên tục phát triển khi các mẫu mới xuất hiện.

## Màu sắc

- Tương phản màu phải tuân thủ [yêu cầu mức AA của WCAG 2.2](https://w3c.github.io/wcag/guidelines/22/#contrast-minimum):
  - Tỷ lệ tương phản 4,5:1 cho văn bản bình thường (nhỏ hơn 18 point hoặc 14 point đậm).
  - Tỷ lệ tương phản 3:1 cho văn bản lớn (ít nhất 18 point hoặc 14 point đậm).

- Thông tin được truyền tải bằng màu sắc cũng phải có cách khác để tiếp cận (ví dụ văn bản gạch chân cho liên kết, v.v.).

## Tính hiển thị

- Không được chỉ dùng các kỹ thuật ẩn nội dung như độ trong suốt bằng 0, thứ tự z-index và đặt ra ngoài màn hình để xử lý tính hiển thị.
- Mọi thứ ngoài màn hình hiện đang hiển thị phải _thực sự_ vô hình (đặc biệt liên quan đến các ứng dụng một trang có nhiều _thẻ_):
  - Dùng thuộc tính `hidden` hoặc các thuộc tính kiểu `visibility` hay `display`.
  - Trừ khi hoàn toàn không thể tránh, không nên dùng thuộc tính `aria-hidden`.

## Tiêu điểm

- Mọi phần tử có thể kích hoạt phải có thể nhận tiêu điểm:
  - Các điều khiển chuẩn như liên kết, nút và trường biểu mẫu mặc định đều có thể nhận tiêu điểm.
  - Các điều khiển không chuẩn phải được gán một [vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) phù hợp, chẳng hạn `button`, `link`, hoặc `checkbox`.

- Tiêu điểm nên được xử lý theo thứ tự hợp lý và nhất quán.

## Tương đương văn bản

- Phải cung cấp tương đương văn bản cho mọi phần tử không phải văn bản và không thuần trình bày trong ứng dụng.
  - Dùng _alt_ và _title_ khi phù hợp (đọc bài viết của Steve Faulkner về [Using the HTML title attribute](https://vispero.com/resources/using-the-html-title-attribute-updated/) để có hướng dẫn tốt).
  - Nếu các thuộc tính trên không phù hợp, hãy dùng các [trạng thái và thuộc tính ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes) thích hợp như `aria-label`, `aria-labelledby`, hoặc `aria-describedby`.

- Phải tránh hình ảnh chứa văn bản.
- Tất cả thành phần giao diện có văn bản hiển thị (hoặc hình ảnh văn bản) làm nhãn phải có cùng văn bản đó trong [tên](https://w3c.github.io/wcag/guidelines/22/#dfn-name) có thể lập trình của thành phần. [WCAG 2.1: Label in name.](https://www.w3.org/WAI/WCAG21/Understanding/label-in-name.html)
- Tất cả các điều khiển biểu mẫu phải có nhãn (các phần tử {{ htmlelement("label") }}) để hỗ trợ người dùng trình đọc màn hình.

## Xử lý trạng thái

- Các điều khiển chuẩn như nút chọn một và checkbox được hệ điều hành xử lý. Tuy nhiên, với các điều khiển tùy chỉnh khác, thay đổi trạng thái phải được cung cấp qua [trạng thái ARIA](https://w3c.github.io/aria/#state_prop_def) như `aria-checked`, `aria-disabled`, `aria-selected`, `aria-expanded`, và `aria-pressed`.

## Hướng màn hình

- Nội dung không nên bị giới hạn chỉ ở một hướng, như dọc hoặc ngang, trừ khi điều đó là thiết yếu. [WCAG 2.1: Orientation](https://www.w3.org/WAI/WCAG21/Understanding/orientation.html)
  - Ví dụ về trường hợp hướng là thiết yếu: một ứng dụng piano hoặc một tờ séc ngân hàng.

## Hướng dẫn chung

- Phải cung cấp tiêu đề ứng dụng.
- Các tiêu đề không được phá vỡ cấu trúc phân cấp

  ```html
  <h1>Tiêu đề cấp cao nhất</h1>
  <h2>Tiêu đề cấp hai</h2>
  <h2>Tiêu đề cấp hai khác</h2>
  <h3>Tiêu đề cấp thấp</h3>
  ```

- [Vai trò Landmark ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#3._landmark_roles) nên được dùng để mô tả cấu trúc ứng dụng hoặc tài liệu, chẳng hạn `banner`, `complementary`, `contentinfo`, `main`, `navigation`, `search`.
- Với các sự kiện cảm ứng, hãy bảo đảm các điều sau ([WCAG 2.1: Pointer Cancellation](https://www.w3.org/WAI/WCAG21/Understanding/pointer-cancellation.html)):
  - Không được dùng sự kiện xuống để thực hiện bất kỳ phần nào của chức năng;
  - Nếu không thể làm điều trên, việc _hoàn thành_ chức năng phải diễn ra ở sự kiện lên, và phải có cơ chế để hủy hành động trước khi hoàn thành hoặc hoàn tác hành động sau khi hoàn thành;
  - Nếu không thể làm điều trên, sự kiện lên phải có thể hoàn tác mọi hành động đã được kích hoạt bởi sự kiện xuống;
  - Tất cả các điều trên có thể bị vi phạm nếu bắt buộc phải kích hoạt hành động ở sự kiện xuống, thường để mô phỏng trải nghiệm đời thực hoặc cung cấp phản hồi theo thời gian thực. Ví dụ: điều khiển trò chơi, phím đàn piano, hoặc bàn phím ảo.

- Mục tiêu cảm ứng phải đủ lớn để người dùng tương tác được (xem [BBC Mobile Accessibility Guidelines](https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/target-touch-size) để có hướng dẫn hữu ích về kích thước vùng chạm).

> [!NOTE]
> [Bản gốc của tài liệu này](https://yzen.github.io/firefoxos/2014/04/30/mobile-accessibility-checklist.html) được viết bởi [Yura Zenevich](https://yzen.github.io/).
