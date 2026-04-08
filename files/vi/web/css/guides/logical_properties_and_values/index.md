---
title: CSS logical properties and values
short-title: Logical properties and values
slug: Web/CSS/Guides/Logical_properties_and_values
page-type: css-module
spec-urls: https://drafts.csswg.org/css-logical/
sidebar: cssref
---

Module **CSS logical properties and values** định nghĩa các thuộc tính và giá trị logic có thể kiểm soát bố cục thông qua các ánh xạ hướng và chiều logic thay vì vật lý. Logical properties định nghĩa các tương đương hướng tương đối với các thuộc tính vật lý tương ứng của chúng.

Điểm bắt đầu của một dòng không phải lúc nào cũng là phía bên trái của dòng. Các hệ thống viết khác nhau hoạt động theo nhiều hướng khác nhau. Ví dụ:

- Tiếng Anh và tiếng Bồ Đào Nha được viết từ trái sang phải với các dòng mới được thêm vào bên dưới các dòng trước.
- Tiếng Do Thái và tiếng Ả Rập là các ngôn ngữ viết từ phải sang trái với các dòng mới cũng được thêm vào bên dưới các dòng trước.
- Trong một số chế độ viết, các dòng văn bản là dọc, được viết từ trên xuống dưới. Tiếng Trung, tiếng Việt, tiếng Hàn và tiếng Nhật theo truyền thống được viết theo chiều dọc, từ trên xuống dưới, với mỗi dòng dọc mới được thêm vào bên trái dòng trước.
- Tiếng Mông Cổ truyền thống cũng là ngôn ngữ từ trên xuống dưới, nhưng các dòng mới nằm ở bên phải của các dòng trước.

Các logical properties được định nghĩa trong module này cho phép định nghĩa các thuộc tính tương đối với hướng viết của nội dung, thay vì một hướng vật lý. Điều này có nghĩa là nội dung được dịch sang các ngôn ngữ với các chế độ viết khác nhau sẽ được hiển thị như dự định.

Logical properties và values sử dụng các thuật ngữ trừu tượng _block_ và _inline_ để mô tả hướng mà chúng chảy. Ý nghĩa vật lý của các thuật ngữ này phụ thuộc vào [writing mode](/en-US/docs/Web/CSS/Guides/Writing_modes).

**Block dimension** vuông góc với luồng văn bản trong một dòng, tức là chiều dọc trong các chế độ viết ngang và chiều ngang trong các chế độ viết dọc. Đối với văn bản tiếng Anh tiêu chuẩn, đó là chiều dọc.

**Inline dimension** song song với luồng văn bản trong một dòng, tức là chiều ngang trong các chế độ viết ngang và chiều dọc trong các chế độ viết dọc. Đối với văn bản tiếng Anh tiêu chuẩn, đó là chiều ngang.

CSS ban đầu được thiết kế chỉ với tọa độ vật lý. Module logical properties và values định nghĩa các tương đương flow-relative cho nhiều [giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units) và [thuộc tính](/en-US/docs/Glossary/Property/CSS). Các thuộc tính trước đây chỉ chấp nhận các giá trị vật lý (`top`, `bottom`, `left`, `right`) giờ đây cũng chấp nhận các giá trị logic flow-relative (`block-start`, `block-end`, `inline-start`, `inline-end`).

## Tham khảo

### Thuộc tính

- {{cssxref("block-size")}}
- {{cssxref("border-block")}}
- {{cssxref("border-block-color")}}
- {{cssxref("border-block-end")}}
- {{cssxref("border-block-end-color")}}
- {{cssxref("border-block-end-style")}}
- {{cssxref("border-block-end-width")}}
- {{cssxref("border-block-start")}}
- {{cssxref("border-block-start-color")}}
- {{cssxref("border-block-start-style")}}
- {{cssxref("border-block-start-width")}}
- {{cssxref("border-block-style")}}
- {{cssxref("border-block-width")}}
- {{cssxref("border-end-end-radius")}}
- {{cssxref("border-end-start-radius")}}
- {{cssxref("border-inline")}}
- {{cssxref("border-inline-color")}}
- {{cssxref("border-inline-end")}}
- {{cssxref("border-inline-end-color")}}
- {{cssxref("border-inline-end-style")}}
- {{cssxref("border-inline-end-width")}}
- {{cssxref("border-inline-start")}}
- {{cssxref("border-inline-start-color")}}
- {{cssxref("border-inline-start-style")}}
- {{cssxref("border-inline-start-width")}}
- {{cssxref("border-inline-style")}}
- {{cssxref("border-inline-width")}}
- {{cssxref("border-start-end-radius")}}
- {{cssxref("border-start-start-radius")}}
- {{cssxref("inline-size")}}
- {{cssxref("inset")}}
- {{cssxref("inset-block")}}
- {{cssxref("inset-block-end")}}
- {{cssxref("inset-block-start")}}
- {{cssxref("inset-inline")}}
- {{cssxref("inset-inline-end")}}
- {{cssxref("inset-inline-start")}}
- {{cssxref("margin-block")}}
- {{cssxref("margin-block-end")}}
- {{cssxref("margin-block-start")}}
- {{cssxref("margin-inline")}}
- {{cssxref("margin-inline-end")}}
- {{cssxref("margin-inline-start")}}
- {{cssxref("max-block-size")}}
- {{cssxref("max-inline-size")}}
- {{cssxref("min-block-size")}}
- {{cssxref("min-inline-size")}}
- {{cssxref("padding-block")}}
- {{cssxref("padding-block-end")}}
- {{cssxref("padding-block-start")}}
- {{cssxref("padding-inline")}}
- {{cssxref("padding-inline-end")}}
- {{cssxref("padding-inline-start")}}

### Kiểu dữ liệu và giá trị

{{glossary("Flow relative values")}}:

- `block-start`
- `block-end`
- `inline-start`
- `inline-end`
- `start`
- `end`

### Thuật ngữ trong Glossary

- {{glossary("Flow relative values")}}
- {{glossary("Inset properties")}}
- {{glossary("Logical properties")}}
- {{glossary("Physical properties")}}

## Hướng dẫn

- [Basic concepts of logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts)
  - : Tổng quan về các thuộc tính và giá trị flow relative.

- [Logical properties for sizing](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Sizing)
  - : Ánh xạ flow-relative giữa các thuộc tính vật lý và logical properties được sử dụng để điều chỉnh kích thước phần tử trên trang.

- [Logical properties for margins, borders, and padding](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Margins_borders_padding)
  - : Ánh xạ flow-relative cho các thuộc tính margin, border và padding khác nhau cùng các shorthands của chúng.

- [Logical properties for floating and positioning](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Floating_and_positioning)
  - : Trình bày chi tiết về ánh xạ giữa các giá trị vật lý và logic cho `float` và `clear`, [inset properties](/en-US/docs/Glossary/Inset_properties) và `resize`.

## Khái niệm liên quan

- {{CSSxRef("caption-side")}}
- {{CSSxRef("clear")}}
- {{CSSxRef("float")}}
- {{CSSxRef("resize")}}
- {{CSSxRef("text-align")}}

[CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)

- {{CSSxRef("margin")}} shorthand
- {{CSSxRef("padding")}} shorthand

[CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)

- {{CSSxRef("max-height")}}
- {{CSSxRef("max-width")}}
- {{CSSxRef("min-height")}}
- {{CSSxRef("min-width")}}

[CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)

- {{CSSxRef("border-color")}}
- {{CSSxRef("border-style")}}
- {{CSSxRef("border-width")}}
- {{CSSxRef("border")}} shorthand
- {{CSSxRef("border-radius")}}

[CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)

- {{CSSxRef("top")}}
- {{CSSxRef("right")}}
- {{CSSxRef("bottom")}}
- {{CSSxRef("left")}}

[CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)

- {{CSSxRef("direction")}}
- {{CSSxRef("text-orientation")}}
- {{CSSxRef("writing-mode")}}

[CSS containment](/en-US/docs/Web/CSS/Guides/Containment)

- {{CSSxRef("contain-intrinsic-block-size")}}
- {{CSSxRef("contain-intrinsic-inline-size")}}

[CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)

- {{CSSxRef("overflow-block")}}
- {{CSSxRef("overflow-inline")}}

[CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior)

- {{CSSxRef("overscroll-behavior-block")}}
- {{CSSxRef("overscroll-behavior-inline")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [Flow layout and writing modes](/en-US/docs/Web/CSS/Guides/Display/Flow_layout_and_writing_modes)
- Module [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
