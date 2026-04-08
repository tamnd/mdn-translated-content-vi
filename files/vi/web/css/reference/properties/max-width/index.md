---
title: max-width
slug: Web/CSS/Reference/Properties/max-width
page-type: css-property
browser-compat: css.properties.max-width
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`max-width`** đặt chiều rộng tối đa của một phần tử. Nó ngăn [giá trị được dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) của thuộc tính {{cssxref("width")}} trở nên lớn hơn giá trị được chỉ định bởi `max-width`.

{{InteractiveExample("CSS Demo: max-width")}}

```css interactive-example-choice
max-width: 150px;
```

```css interactive-example-choice
max-width: 20em;
```

```css interactive-example-choice
max-width: 75%;
```

```css interactive-example-choice
max-width: 20ch;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    Change the maximum width.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  height: 80%;
  justify-content: center;
  color: white;
}
```

`max-width` ghi đè {{cssxref("width")}}, nhưng {{cssxref("min-width")}} ghi đè `max-width`.

## Cú pháp

```css
/* Giá trị <length> */
max-width: 3.5em;
max-width: anchor-size(--my-anchor inline, 245px);
max-width: calc(anchor-size(width) + 4em);

/* Giá trị <percentage> */
max-width: 75%;

/* Giá trị từ khóa */
max-width: none;
max-width: max-content;
max-width: min-content;
max-width: fit-content;
max-width: fit-content(20em);
max-width: stretch;

/* Giá trị toàn cục */
max-width: inherit;
max-width: initial;
max-width: revert;
max-width: revert-layer;
max-width: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định `max-width` là một giá trị tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định `max-width` là một tỷ lệ phần trăm theo chiều rộng của khối chứa.
- `none`
  - : Không giới hạn kích thước của hộp.
- {{cssxref("max-content")}}
  - : `max-width` ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : `max-width` tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không vượt quá [max-content](/en-US/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức `fit-content` với không gian có sẵn được thay thế bằng đối số được chỉ định, tức là `min(max-content, max(min-content, argument))`.
- `stretch`
  - : Giới hạn chiều rộng tối đa của [margin box](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều rộng của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho margin box lấp đầy không gian có sẵn trong khối chứa, tương tự như `100%` nhưng áp dụng kích thước kết quả cho margin box thay vì hộp được xác định bởi [box-sizing](/en-US/docs/Web/CSS/Reference/Properties/box-sizing).

    > [!NOTE]
    > Để kiểm tra các bí danh được sử dụng bởi trình duyệt cho giá trị `stretch` và trạng thái triển khai của nó, hãy xem phần [Tương thích trình duyệt](#browser_compatibility).

## Khả năng tiếp cận

Đảm bảo rằng các phần tử được đặt `max-width` không bị cắt bớt và/hoặc không che khuất nội dung khác khi trang được thu phóng để tăng kích thước chữ.

- [MDN Tìm hiểu WCAG, Giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Tìm hiểu Tiêu chí Thành công 1.4.4 | W3C Tìm hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt chiều rộng tối đa bằng pixel

Trong ví dụ này, phần tử "child" sẽ có chiều rộng 150 pixel hoặc chiều rộng của "parent", tùy theo giá trị nào nhỏ hơn.

#### HTML

```html
<div id="parent">
  <div id="child">
    Fusce pulvinar vestibulum eros, sed luctus ex lobortis quis.
  </div>
</div>
```

#### CSS

```css
#parent {
  background: lightblue;
  width: 300px;
}

#child {
  background: gold;
  width: 100%;
  max-width: 150px;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_max_width_in_pixels", 350, 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("min-width")}}
- {{Cssxref("width")}}
- {{cssxref("max-inline-size")}}
- {{cssxref("max-block-size")}}
- {{cssxref("box-sizing")}}
- Hướng dẫn [Giới thiệu mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
