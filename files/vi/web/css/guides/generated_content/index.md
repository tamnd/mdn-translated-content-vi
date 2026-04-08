---
title: CSS generated content
short-title: Generated content
slug: Web/CSS/Guides/Generated_content
page-type: css-module
spec-urls: https://drafts.csswg.org/css-content/
sidebar: cssref
---

Module **CSS generated content** định nghĩa cách thay thế nội dung của một phần tử và cách thêm nội dung vào tài liệu bằng CSS.

Generated content có thể được dùng để thay thế nội dung, trong đó nội dung của một DOM node được thay bằng một `<image>` CSS. CSS generated content cũng cho phép tạo các dấu ngoặc kép phù hợp với ngôn ngữ, tạo số thứ tự và ký hiệu danh sách tùy chỉnh, cũng như thêm nội dung trực quan bằng cách tạo nội dung trên các pseudo-element được chọn dưới dạng các anonymous replaced element.

## Generated content trong thực tế

```html hidden live-sample___generated_content
<div></div>
```

```css hidden live-sample___generated_content
body,
div {
  background-repeat: no-repeat;
}
body {
  background-image: linear-gradient(#3a67ab, #e8f6ff 100%);
}
div {
  position: relative;
  width: 400px;
  height: 400px;
  background-image:
    linear-gradient(
      115deg,
      transparent 48%,
      brown,
      #996600,
      brown,
      transparent 52%
    ),
    linear-gradient(
      60deg,
      transparent 48%,
      brown,
      #996600,
      brown,
      transparent 52%
    ),
    radial-gradient(
      circle 10px at 50% 50%,
      #333333 30%,
      #999999 50%,
      transparent 50%
    ),
    radial-gradient(
      circle 10px at 50% 50%,
      #333333 30%,
      #999999 50%,
      transparent 50%
    ),
    radial-gradient(circle at 50% 50%, white 30%, #eeeeee 50%, transparent 50%),
    radial-gradient(circle at 50% 50%, white 30%, #eeeeee 50%, transparent 50%),
    radial-gradient(circle at 50% 50%, white 30%, #eeeeee 50%, transparent 50%);
  background-size:
    100px 100px,
    100px 100px,
    15px 15px,
    15px 15px,
    200px 200px,
    300px 300px,
    400px 400px;
  background-position:
    95% 120px,
    5% 120px,
    46% 80px,
    54% 80px,
    50% 0,
    50% 90px,
    50% 220px;
}
div::after {
  content: "";
  border: transparent solid 4px;
  border-left: orange 30px solid;
  height: 1px;
  width: 1px;
  position: absolute;
  left: 50%;
  top: 100px;
}

div::before {
  content: "Only one <div>";
  font-size: min(6vh, 2rem);
  justify-content: center;
  display: flex;
  font-family: "Comic Sans", "Papyrus", sans-serif;
}
```

{{EmbedLiveSample("generated_content", "", "400px")}}

HTML của ví dụ này là một {{HTMLElement("div")}} trống bên trong một {{HTMLElement("body")}} trống. Người tuyết được tạo bằng [CSS images](/en-US/docs/Web/CSS/Guides/Images) và [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders). Mũi cà rốt được thêm bằng generated content: một hộp trống với [left border](/en-US/docs/Web/CSS/Reference/Properties/border-left) màu cam rộng được thêm vào pseudo-element {{cssxref("::before")}}. Văn bản cũng là generated content: "only one &lt;div>" được tạo bằng thuộc tính {{cssxref("content")}} áp dụng cho pseudo-element {{cssxref("::after")}}.

Nhấp vào "Play" trong ví dụ trên để xem hoặc chỉnh sửa code trong MDN Playground.

## Tham chiếu

### Thuộc tính

- {{cssxref("content")}}
- {{cssxref("quotes")}}

Module CSS generated content cũng giới thiệu bốn thuộc tính có nguy cơ không được hỗ trợ: `string-set`, `bookmark-label`, `bookmark-level`, và `bookmark-state`. Hiện tại, chưa có trình duyệt nào hỗ trợ các tính năng này.

### Hàm

Module CSS generated content giới thiệu sáu hàm CSS chưa được triển khai, bao gồm `content()`, `string()`, và `leader()`, cùng với ba hàm [`<target>`](/en-US/docs/Web/CSS/Reference/Properties/content#target): `target-counter()`, `target-counters()`, và `target-text()`.

### Kiểu dữ liệu

- [`<content-list>`](/en-US/docs/Web/CSS/Reference/Properties/content#values)
- `<content-replacement>` (xem {{cssxref("image")}})
- {{cssxref("image")}}
- [`<counter>`](/en-US/docs/Web/CSS/Reference/Properties/content#counter)
- [`<quote>`](/en-US/docs/Web/CSS/Reference/Properties/content#quote)
- [`<target>`](/en-US/docs/Web/CSS/Reference/Properties/content#target)

## Hướng dẫn

- [Hướng dẫn "How to" về generated content](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Generated_content)
  - : Tìm hiểu cách thêm nội dung văn bản hoặc hình ảnh vào tài liệu bằng thuộc tính {{cssxref("content")}}.

- [Tạo các hộp ưa nhìn với generated content](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Create_fancy_boxes)
  - : Ví dụ về tạo kiểu cho generated content để tạo hiệu ứng trực quan.

## Khái niệm liên quan

- Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
  - Pseudo-element {{cssxref("::before")}}
  - Pseudo-element {{cssxref("::after")}}
  - Pseudo-element {{cssxref("::marker")}}

- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
  - Hàm {{cssxref("counter()")}}
  - Hàm {{cssxref("counters()")}}
  - Thuộc tính {{cssxref("counter-increment")}}
  - Thuộc tính {{cssxref("counter-reset")}}

- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
  - Pseudo-element {{cssxref("::scroll-button()")}}
  - Pseudo-element {{cssxref("::scroll-marker")}}
  - Pseudo-class {{cssxref(":target-current")}}

- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
  - Hàm {{cssxref("attr()")}}
  - Kiểu dữ liệu {{cssxref("string")}}
  - Kiểu dữ liệu {{cssxref("image")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
- {{glossary("Replaced elements")}}
