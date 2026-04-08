---
title: Introduction to the CSS box model
short-title: Introduction
slug: Web/CSS/Guides/Box_model/Introduction
page-type: guide
sidebar: cssref
---

Khi bố trí một tài liệu, rendering engine của trình duyệt biểu diễn mỗi phần tử như một hộp hình chữ nhật theo **CSS basic box model** tiêu chuẩn. CSS xác định kích thước, vị trí và các thuộc tính (màu sắc, nền, kích thước border, v.v.) của các hộp này.

Mỗi hộp bao gồm bốn phần (hay _vùng_), được xác định bởi các cạnh tương ứng của chúng: _content edge_, _padding edge_, _border edge_ và _margin edge_.

![CSS Box model](boxmodel.png)

## Vùng content (content area)

**Vùng content**, được giới hạn bởi content edge, chứa nội dung "thực" của phần tử, chẳng hạn như văn bản, hình ảnh hoặc trình phát video. Kích thước của nó là _content width_ (hay _content-box width_) và _content height_ (hay _content-box height_). Nó thường có màu nền hoặc hình ảnh nền.

Nếu thuộc tính {{cssxref("box-sizing")}} được đặt thành `content-box` (mặc định) và nếu phần tử là block element, kích thước vùng content có thể được xác định rõ ràng bằng các thuộc tính {{cssxref("width")}}, {{cssxref("min-width")}}, {{cssxref("max-width")}}, {{ cssxref("height") }}, {{cssxref("min-height")}} và {{cssxref("max-height")}}.

## Vùng padding (padding area)

**Vùng padding**, được giới hạn bởi padding edge, mở rộng vùng content để bao gồm padding của phần tử. Kích thước của nó là _padding-box width_ và _padding-box height_.

Độ dày của padding được xác định bởi các thuộc tính {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, {{cssxref("padding-bottom")}}, {{cssxref("padding-left")}} và thuộc tính viết tắt {{cssxref("padding")}}.

## Vùng border (border area)

**Vùng border**, được giới hạn bởi border edge, mở rộng vùng padding để bao gồm các border của phần tử. Kích thước của nó là _border-box width_ và _border-box height_.

Độ dày của các border được xác định bởi thuộc tính {{cssxref("border-width")}} và thuộc tính viết tắt {{cssxref("border")}}. Nếu thuộc tính {{cssxref("box-sizing")}} được đặt thành `border-box`, kích thước vùng border có thể được xác định rõ ràng bằng các thuộc tính {{cssxref("width")}}, {{cssxref("min-width")}}, {{cssxref("max-width")}}, {{ cssxref("height") }}, {{cssxref("min-height")}} và {{cssxref("max-height")}}. Khi có background ({{cssxref("background-color")}} hoặc {{cssxref("background-image")}}) được đặt trên một hộp, nó mở rộng đến cạnh ngoài của border (tức là mở rộng xuống dưới border theo thứ tự z). Hành vi mặc định này có thể được thay đổi bằng thuộc tính CSS {{cssxref("background-clip")}}.

## Vùng margin (margin area)

**Vùng margin**, được giới hạn bởi margin edge, mở rộng vùng border để bao gồm một vùng trống dùng để tách phần tử khỏi các phần tử lân cận. Kích thước của nó là _margin box width_ và _margin box height_.

Kích thước của vùng margin được xác định bởi các thuộc tính {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}}, {{cssxref("margin-left")}} và thuộc tính viết tắt {{cssxref("margin")}}. Khi [margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) xảy ra, vùng margin không được xác định rõ ràng vì các margin được chia sẻ giữa các hộp.

Cuối cùng, lưu ý rằng đối với các inline element không phải replaced element, lượng không gian chiếm dụng (đóng góp vào chiều cao của dòng) được xác định bởi thuộc tính {{cssxref('line-height')}}, mặc dù các border và padding vẫn được hiển thị xung quanh nội dung.

## Xem thêm

- Module [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
- [Layout and the containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- [Introducing the CSS Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Learn: Handling conflicts](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
- Các khái niệm CSS cơ bản:
  - [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
  - [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
  - [Comments](/en-US/docs/Web/CSS/Guides/Syntax/Comments)
  - [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
  - [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
  - [Layout modes](/en-US/docs/Glossary/Layout_mode)
  - [Visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
  - [Margin collapsing](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
  - Giá trị:
    - [Initial values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value)
    - [Computed values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value)
    - [Used values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value)
    - [Actual values](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
  - [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
  - [Shorthand properties](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties)
  - {{glossary("Replaced elements")}}
