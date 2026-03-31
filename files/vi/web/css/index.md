---
title: "CSS: Cascading Style Sheets"
short-title: CSS
slug: Web/CSS
page-type: landing-page
sidebar: cssref
---

**Cascading Style Sheets** (**CSS**) là ngôn ngữ [stylesheet](/en-US/docs/Web/API/StyleSheet) dùng để mô tả cách trình bày của một tài liệu được viết bằng [HTML](/en-US/docs/Web/HTML) hoặc [XML](/en-US/docs/Web/XML/Guides/XML_introduction) (bao gồm các phương ngữ XML như [SVG](/en-US/docs/Web/SVG), [MathML](/en-US/docs/Web/MathML) hoặc {{Glossary("XHTML")}}). CSS mô tả cách các phần tử được hiển thị trên màn hình, trên giấy, trong giọng nói, hoặc trên các phương tiện khác.

CSS là một trong những ngôn ngữ cốt lõi của **web mở** và được chuẩn hóa trên các trình duyệt web theo [đặc tả W3C](https://www.w3.org/Style/CSS/#specs). Trước đây, việc phát triển các phần khác nhau của đặc tả CSS được thực hiện đồng bộ, cho phép tạo phiên bản cho các khuyến nghị mới nhất. Bạn có thể đã nghe về CSS1, CSS2.1, hoặc thậm chí CSS3. Sẽ không bao giờ có CSS3 hay CSS4; thay vào đó, mọi thứ hiện nay chỉ đơn giản là "CSS" với các mô-đun CSS riêng lẻ có số phiên bản.

Sau CSS 2.1, phạm vi của đặc tả đã mở rộng đáng kể và tiến trình trên các mô-đun CSS khác nhau bắt đầu khác biệt đến mức việc [phát triển và phát hành các khuyến nghị riêng lẻ theo từng mô-đun](https://www.w3.org/Style/CSS/current-work) trở nên hiệu quả hơn. Thay vì tạo phiên bản cho đặc tả CSS, W3C hiện định kỳ chụp ảnh [trạng thái ổn định mới nhất của đặc tả CSS](https://www.w3.org/TR/css/) và các mô-đun riêng lẻ tiến triển độc lập. Các mô-đun CSS hiện có số phiên bản hoặc cấp độ, chẳng hạn như [CSS Color Module Level 5](https://drafts.csswg.org/css-color-5/).

## Hướng dẫn cho người mới bắt đầu

Các [mô-đun cốt lõi về học phát triển web](/en-US/docs/Learn_web_development/Core) của chúng tôi chứa các hướng dẫn hiện đại, cập nhật về các kiến thức CSS cơ bản.

- [Trang web đầu tiên của bạn: Tạo kiểu cho nội dung](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Styling_the_content)
  - : Bài viết này cung cấp một chuyến tham quan ngắn gọn về CSS là gì và cách sử dụng nó, dành cho những người hoàn toàn mới với phát triển web.
- [Kiến thức cơ bản về tạo kiểu CSS](/en-US/docs/Learn_web_development/Core/Styling_basics)
  - : Mô-đun này cung cấp tất cả các kiến thức CSS cơ bản bạn cần để bắt đầu học công nghệ một cách hiệu quả, bao gồm cú pháp, tính năng và kỹ thuật.
- [Tạo kiểu văn bản CSS](/en-US/docs/Learn_web_development/Core/Text_styling)
  - : Ở đây chúng ta xem xét các kiến thức cơ bản về văn bản trong CSS, bao gồm cài đặt font chữ, độ đậm, chữ nghiêng, khoảng cách dòng và chữ, cũng như đổ bóng. Chúng ta kết thúc mô-đun bằng cách xem xét việc áp dụng font chữ tùy chỉnh cho trang của bạn, cũng như tạo kiểu cho danh sách và liên kết.
- [Bố cục CSS](/en-US/docs/Learn_web_development/Core/CSS_layout)
  - : Mô-đun này xem xét các float, định vị, các công cụ bố cục hiện đại khác, và xây dựng các thiết kế responsive sẽ thích ứng với các thiết bị, kích thước màn hình và độ phân giải khác nhau.

## Hướng dẫn

Các hướng dẫn CSS được tổ chức theo mô-đun và giúp bạn tìm hiểu những gì có thể đạt được khi sử dụng CSS. Xem danh sách đầy đủ tại [CSS guides](/en-US/docs/Web/CSS/Guides), bao gồm các chủ đề như:

- [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction) bao gồm khai báo và bộ quy tắc.
- [Độ ưu tiên (specificity)](/en-US/docs/Web/CSS/Guides/Cascade/Specificity), [kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance), và [tầng (cascade)](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Lồng nhau (nesting)](/en-US/docs/Web/CSS/Guides/Nesting), [phạm vi (scoping)](/en-US/docs/Web/CSS/Guides/Scoping) và [shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts)
- Truy vấn [media](/en-US/docs/Web/CSS/Guides/Media_queries) và [container](/en-US/docs/Web/CSS/Guides/Containment)
- Kiểu dữ liệu [số (numeric)](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) và [văn bản (textual)](/en-US/docs/Web/CSS/Guides/Values_and_units/Textual_data_types)
- [Mô hình hộp (box model)](/en-US/docs/Web/CSS/Guides/Box_model/Introduction) và [thu gọn lề (margin collapse)](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- [Khối chứa (containing block)](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- Ngữ cảnh [xếp chồng (stacking)](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) và [định dạng khối (block-formatting)](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- [Xử lý giá trị thuộc tính](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing)
- [Thuộc tính viết tắt (shorthand properties)](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
- Bố cục [hộp linh hoạt (flexible box)](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), [đa cột (multi-column)](/en-US/docs/Web/CSS/Guides/Multicol_layout) và [lưới (grid)](/en-US/docs/Web/CSS/Guides/Grid_layout)
- [Hoạt ảnh (animations)](/en-US/docs/Web/CSS/Guides/Animations/Using), [chuyển tiếp (transitions)](/en-US/docs/Web/CSS/Guides/Transitions/Using), và [biến đổi (transforms)](/en-US/docs/Web/CSS/Guides/Transforms/Using)

## Hướng dẫn thực hành

- [Sách nấu ăn bố cục CSS](/en-US/docs/Web/CSS/How_to/Layout_cookbook)
  - : Các công thức cho các mẫu bố cục phổ biến mà bạn có thể cần triển khai trên các trang web của mình. Các công thức này cung cấp mã bạn có thể sử dụng làm điểm khởi đầu trong các dự án. Chúng cũng làm nổi bật các cách khác nhau mà các đặc tả bố cục có thể được sử dụng và các lựa chọn bạn có thể thực hiện với tư cách là nhà phát triển.

## Công cụ

- [Trình tạo border-image](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-image_generator)
  - : Tạo giá trị CSS {{cssxref("border-image")}}.
- [Trình tạo border-radius](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator)
  - : Tạo hiệu ứng CSS {{cssxref("border-radius")}}.
- [Trình tạo box-shadow](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Box-shadow_generator)
  - : Thêm hiệu ứng {{cssxref("box-shadow")}} vào các đối tượng CSS của bạn.
- [Trình chuyển đổi định dạng màu](/en-US/docs/Web/CSS/Guides/Colors/Color_format_converter)
  - : Nhập hoặc chọn màu và sao chép giá trị tương ứng của nó trong bất kỳ [định dạng màu](/en-US/docs/Web/CSS/Reference/Values/color_value) CSS nào.
- [Trình trộn màu](/en-US/docs/Web/CSS/Guides/Colors/Color_mixer)
  - : Trộn hai màu trong bất kỳ không gian màu nào bằng hàm {{cssxref("color_value/color-mix", "color-mix()")}} và sao chép màu kết quả trong bất kỳ định dạng màu CSS nào.
- [Trình tạo hình dạng](/en-US/docs/Web/CSS/Guides/Shapes/Shape_generator)
  - : Xác định tọa độ và cú pháp cho các tính năng {{cssxref("basic-shape")}}.

Bạn cũng có thể sử dụng các tài nguyên sau:

- [Dịch vụ xác thực CSS W3C](https://jigsaw.w3.org/css-validator/): Để kiểm tra xem CSS của bạn có hợp lệ không. Đây là công cụ gỡ lỗi vô giá.
- [Firefox Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/index.html): Để xem và chỉnh sửa CSS trực tiếp của trang qua các công cụ [Inspector](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/index.html) và [Style Editor](https://firefox-source-docs.mozilla.org/devtools-user/style_editor/index.html).
- [Tiện ích mở rộng Web Developer](https://addons.mozilla.org/en-US/firefox/addon/web-developer/): Để theo dõi và chỉnh sửa CSS trực tiếp trên các trang web trong Firefox.

## Tài liệu tham khảo

Xem tài liệu [tham khảo CSS](/en-US/docs/Web/CSS/Reference) đầy đủ.

- [Thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties)
  - : Tài liệu tham khảo cho tất cả các thuộc tính CSS.
- [Bộ chọn CSS](/en-US/docs/Web/CSS/Reference/Selectors)
  - : Tài liệu tham khảo cho các bộ chọn CSS, [tổ hợp (combinators)](/en-US/docs/Web/CSS/Reference/Selectors/Combinators), [pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes), và [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements).
- [At-rules CSS](/en-US/docs/Web/CSS/Reference/At-rules)
  - : Tài liệu tham khảo cho các at-rules CSS bao gồm media queries.
- [Giá trị CSS](/en-US/docs/Web/CSS/Reference/Values)
  - : Tài liệu tham khảo cho các từ khóa CSS, [kiểu dữ liệu](/en-US/docs/Web/CSS/Reference/Values/Data_types), và [hàm](/en-US/docs/Web/CSS/Reference/Values/Functions).

## Xem thêm

- Các ngôn ngữ web mà CSS thường được áp dụng: [HTML](/en-US/docs/Web/HTML), [SVG](/en-US/docs/Web/SVG), [MathML](/en-US/docs/Web/MathML), {{Glossary("XHTML")}}, và [XML](/en-US/docs/Web/XML/Guides/XML_introduction).
- [Câu hỏi về CSS trên Stack Overflow](https://stackoverflow.com/questions/tagged/css)
