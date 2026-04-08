---
title: max-height
slug: Web/CSS/Reference/Properties/max-height
page-type: css-property
browser-compat: css.properties.max-height
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`max-height`** đặt chiều cao tối đa của một phần tử. Nó ngăn [giá trị được dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) của thuộc tính {{cssxref("height")}} trở nên lớn hơn giá trị được chỉ định cho `max-height`.

{{InteractiveExample("CSS Demo: max-height")}}

```css interactive-example-choice
max-height: 150px;
```

```css interactive-example-choice
max-height: 7em;
```

```css interactive-example-choice
max-height: 75%;
```

```css interactive-example-choice
max-height: 10px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the maximum height. <br />This will limit
    how tall the box can be, potentially causing an overflow.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  justify-content: center;
  color: white;
}
```

`max-height` ghi đè {{cssxref("height")}}, nhưng {{cssxref("min-height")}} ghi đè `max-height`.

## Cú pháp

```css
/* Giá trị <length> */
max-height: 3.5em;
max-height: anchor-size(height);
max-height: calc(anchor-size(--my-anchor self-block, 250px) + 2em);

/* Giá trị <percentage> */
max-height: 75%;

/* Giá trị từ khóa */
max-height: none;
max-height: max-content;
max-height: min-content;
max-height: fit-content;
max-height: fit-content(20em);
max-height: stretch;

/* Giá trị toàn cục */
max-height: inherit;
max-height: initial;
max-height: revert;
max-height: revert-layer;
max-height: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định `max-height` là một giá trị tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định `max-height` là một tỷ lệ phần trăm theo chiều cao của khối chứa.
- `none`
  - : Không giới hạn kích thước của hộp.
- {{cssxref("max-content")}}
  - : `max-height` ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : `max-height` tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không vượt quá [max-content](/en-US/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức `fit-content` với không gian có sẵn được thay thế bằng đối số được chỉ định, tức là `min(max-content, max(min-content, argument))`.
- `stretch`
  - : Giới hạn chiều cao tối đa của [margin box](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều cao của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho margin box lấp đầy không gian có sẵn trong khối chứa, tương tự như `100%` nhưng áp dụng kích thước kết quả cho margin box thay vì hộp được xác định bởi [box-sizing](/en-US/docs/Web/CSS/Reference/Properties/box-sizing).

    > [!NOTE]
    > Để kiểm tra các bí danh được sử dụng bởi trình duyệt cho giá trị `stretch` và trạng thái triển khai của nó, hãy xem phần [Tương thích trình duyệt](#browser_compatibility).

## Khả năng tiếp cận

Đảm bảo rằng các phần tử được đặt `max-height` không bị cắt bớt và/hoặc không che khuất nội dung khác khi trang được thu phóng để tăng kích thước chữ.

- [MDN Tìm hiểu WCAG, Giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Tìm hiểu Tiêu chí Thành công 1.4.4 | W3C Tìm hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt max-height bằng giá trị phần trăm và từ khóa

```css
table {
  max-height: 75%;
}

form {
  max-height: none;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("min-height")}}
- {{Cssxref("height")}}
- {{cssxref("max-inline-size")}}
- {{cssxref("max-block-size")}}
- {{cssxref("box-sizing")}}
- Hướng dẫn [Giới thiệu mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
