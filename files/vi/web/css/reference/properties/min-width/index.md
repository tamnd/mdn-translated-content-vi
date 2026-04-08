---
title: min-width
slug: Web/CSS/Reference/Properties/min-width
page-type: css-property
browser-compat: css.properties.min-width
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`min-width`** đặt chiều rộng tối thiểu của một phần tử. Nó ngăn [giá trị được dùng](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) của thuộc tính {{cssxref("width")}} trở nên nhỏ hơn giá trị được chỉ định cho `min-width`.

{{InteractiveExample("CSS Demo: min-width")}}

```css interactive-example-choice
min-width: 150px;
```

```css interactive-example-choice
min-width: 20em;
```

```css interactive-example-choice
min-width: 75%;
```

```css interactive-example-choice
min-width: 40ch;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    Change the minimum width.
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

Chiều rộng của phần tử được đặt thành giá trị `min-width` bất cứ khi nào `min-width` lớn hơn {{Cssxref("max-width")}} hoặc {{Cssxref("width")}}.

## Cú pháp

```css
/* Giá trị <length> */
min-width: 3.5em;
min-width: anchor-size(width);
min-width: anchor-size(--my-anchor self-inline, 200%);

/* Giá trị <percentage> */
min-width: 10%;

/* Giá trị từ khóa */
min-width: max-content;
min-width: min-content;
min-width: fit-content;
min-width: fit-content(20em);
min-width: stretch;

/* Giá trị toàn cục */
min-width: inherit;
min-width: initial;
min-width: revert;
min-width: revert-layer;
min-width: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định `min-width` là một giá trị tuyệt đối.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định `min-width` là một tỷ lệ phần trăm theo chiều rộng của khối chứa.
- `auto`
  - : Giá trị mặc định. Nguồn của giá trị tự động cho phần tử được chỉ định phụ thuộc vào giá trị hiển thị của nó. Đối với các hộp block, hộp inline, inline-block và tất cả các hộp bố cục bảng, `auto` phân giải về `0`.

    Đối với [flex item](/en-US/docs/Glossary/Flex_Item) và grid item, giá trị chiều rộng tối thiểu là kích thước được đề xuất đã chỉ định, chẳng hạn như giá trị của thuộc tính `width`, kích thước được chuyển đổi, được tính nếu phần tử có `aspect-ratio` được đặt và chiều cao là kích thước xác định, ngược lại sẽ dùng kích thước `min-content`. Nếu flex item hoặc grid item là {{glossary("scroll container")}}, hoặc nếu một grid item trải rộng hơn một track cột linh hoạt, kích thước tối thiểu tự động là `0`.

- {{cssxref("max-content")}}
  - : `min-width` ưu tiên nội tại.
- {{cssxref("min-content")}}
  - : `min-width` tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không vượt quá {{cssxref("max-content")}}, tức là `min(max-content, max(min-content, stretch))`.
- [`fit-content(<length-percentage>)`](/en-US/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức `fit-content` với không gian có sẵn được thay thế bằng đối số được chỉ định, tức là `min(max-content, max(min-content, argument))`.
- `stretch`
  - : Giới hạn chiều rộng tối thiểu của [margin box](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều rộng của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho margin box lấp đầy không gian có sẵn trong khối chứa, tương tự như `100%` nhưng áp dụng kích thước kết quả cho margin box thay vì hộp được xác định bởi [box-sizing](/en-US/docs/Web/CSS/Reference/Properties/box-sizing).

    > [!NOTE]
    > Để kiểm tra các bí danh được sử dụng bởi trình duyệt cho giá trị `stretch` và trạng thái triển khai của nó, hãy xem phần [Tương thích trình duyệt](#browser_compatibility).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt chiều rộng tối thiểu của phần tử

```css
table {
  min-width: 75%;
}

form {
  min-width: 0;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("max-width")}}
- {{Cssxref("width")}}
- {{cssxref("min-inline-size")}}
- {{cssxref("min-block-size")}}
- {{cssxref("box-sizing")}}
- Hướng dẫn [Giới thiệu mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
