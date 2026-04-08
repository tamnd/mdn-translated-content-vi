---
title: min-height
slug: Web/CSS/Reference/Properties/min-height
page-type: css-property
browser-compat: css.properties.min-height
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`min-height`** đặt chiều cao tối thiểu của một phần tử. Nó ngăn [giá trị được dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) của thuộc tính {{cssxref("height")}} trở nên nhỏ hơn giá trị được chỉ định cho `min-height`.

{{InteractiveExample("CSS Demo: min-height")}}

```css interactive-example-choice
min-height: 150px;
```

```css interactive-example-choice
min-height: 7em;
```

```css interactive-example-choice
min-height: 75%;
```

```css interactive-example-choice
min-height: 10px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the minimum height. <br />If there is
    more content than the minimum the box will grow to the height needed by the
    content.
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

Chiều cao của phần tử được đặt thành giá trị `min-height` bất cứ khi nào `min-height` lớn hơn {{cssxref("max-height")}} hoặc {{cssxref("height")}}.

## Cú pháp

```css
/* Giá trị <length> */
min-height: 3.5em;
min-height: anchor-size(height);
min-height: anchor-size(--my-anchor block, 200px);

/* Giá trị <percentage> */
min-height: 10%;

/* Giá trị từ khóa */
min-height: max-content;
min-height: min-content;
min-height: fit-content;
min-height: fit-content(20em);
min-height: stretch;

/* Giá trị toàn cục */
min-height: inherit;
min-height: initial;
min-height: revert;
min-height: revert-layer;
min-height: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định `min-height` là một giá trị tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định `min-height` là một tỷ lệ phần trăm theo chiều cao của khối chứa.
- `auto`
  - : Trình duyệt sẽ tính toán và chọn `min-height` cho phần tử được chỉ định.
- {{cssxref("max-content")}}
  - : `min-height` ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : `min-height` tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không vượt quá [max-content](/en-US/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức `fit-content` với không gian có sẵn được thay thế bằng đối số được chỉ định, tức là `min(max-content, max(min-content, argument))`.
- `stretch`
  - : Giới hạn chiều cao tối thiểu của [margin box](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều cao của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho margin box lấp đầy không gian có sẵn trong khối chứa, tương tự như `100%` nhưng áp dụng kích thước kết quả cho margin box thay vì hộp được xác định bởi [box-sizing](/en-US/docs/Web/CSS/Reference/Properties/box-sizing).

    > [!NOTE]
    > Để kiểm tra các bí danh được sử dụng bởi trình duyệt cho giá trị `stretch` và trạng thái triển khai của nó, hãy xem phần [Tương thích trình duyệt](#browser_compatibility).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt min-height

```css
table {
  min-height: 75%;
}

form {
  min-height: 0;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("max-height")}}
- {{Cssxref("height")}}
- {{cssxref("min-inline-size")}}
- {{cssxref("min-block-size")}}
- {{cssxref("box-sizing")}}
- Hướng dẫn [Giới thiệu mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
