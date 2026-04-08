---
title: column-span
slug: Web/CSS/Reference/Properties/column-span
page-type: css-property
browser-compat: css.properties.column-span
sidebar: cssref
---

Thuộc tính **`column-span`** [CSS](/en-US/docs/Web/CSS) cho phép một phần tử trải dài trên tất cả các cột khi giá trị của nó được đặt thành `all`.

Một phần tử trải dài qua nhiều hơn một cột được gọi là **phần tử trải dài**.

{{InteractiveExample("CSS Demo: column-span")}}

```css interactive-example-choice
column-span: none;
```

```css interactive-example-choice
column-span: all;
```

```html interactive-example
<section id="default-example">
  <div class="multicol-element">
    <p>
      London. Michaelmas term lately over, and the Lord Chancellor sitting in
      Lincoln's Inn Hall.
    </p>
    <div id="example-element">Spanner?</div>
    <p>
      Implacable November weather. As much mud in the streets as if the waters
      had but newly retired from the face of the earth, and it would not be
      wonderful to meet a Megalosaurus, forty feet long or so, waddling like an
      elephantine lizard up Holborn Hill.
    </p>
  </div>
</section>
```

```css interactive-example
.multicol-element {
  width: 100%;
  text-align: left;
  column-count: 3;
}

.multicol-element p {
  margin: 0;
}

#example-element {
  background-color: rebeccapurple;
  padding: 10px;
  color: white;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
column-span: none;
column-span: all;

/* Giá trị toàn cục */
column-span: inherit;
column-span: initial;
column-span: revert;
column-span: revert-layer;
column-span: unset;
```

Thuộc tính `column-span` được chỉ định là một trong các giá trị từ khóa liệt kê bên dưới.

### Giá trị

- `none`
  - : Phần tử không trải dài qua nhiều cột.
- `all`
  - : Phần tử trải dài trên tất cả các cột. Nội dung trong luồng bình thường xuất hiện trước phần tử sẽ tự động được cân bằng trên tất cả các cột trước khi phần tử xuất hiện. Phần tử thiết lập một ngữ cảnh định dạng khối mới.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Làm tiêu đề trải dài qua các cột

Trong ví dụ này, tiêu đề được làm cho trải dài trên tất cả các cột của bài viết.

#### HTML

```html
<article>
  <h2>Header spanning all of the columns</h2>
  <p>
    The h2 should span all the columns. The rest of the text should be
    distributed among the columns.
  </p>
  <p>
    This is a bunch of text split into three columns using the CSS `columns`
    property. The text is equally distributed over the columns.
  </p>
  <p>
    This is a bunch of text split into three columns using the CSS `columns`
    property. The text is equally distributed over the columns.
  </p>
  <p>
    This is a bunch of text split into three columns using the CSS `columns`
    property. The text is equally distributed over the columns.
  </p>
  <p>
    This is a bunch of text split into three columns using the CSS `columns`
    property. The text is equally distributed over the columns.
  </p>
</article>
```

#### CSS

```css
article {
  columns: 3;
}

h2 {
  column-span: all;
}
```

#### Kết quả

{{EmbedLiveSample('Making_a_heading_span_columns', 'auto', 260)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Trải dài và cân bằng các cột](/en-US/docs/Web/CSS/Guides/Multicol_layout/Spanning_balancing_columns)
- [Các phần tử cấp nội tuyến](/en-US/docs/Glossary/Inline-level_content)
- {{domxref("HTMLSpanElement")}}
