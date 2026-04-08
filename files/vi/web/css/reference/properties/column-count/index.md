---
title: column-count
slug: Web/CSS/Reference/Properties/column-count
page-type: css-property
browser-compat: css.properties.column-count
sidebar: cssref
---

Thuộc tính **`column-count`** [CSS](/en-US/docs/Web/CSS) chia nội dung của phần tử thành số cột được chỉ định.

Thuộc tính viết tắt {{cssxref("columns")}} có thể được dùng để đặt các giá trị thuộc tính `column-count`, {{cssxref("column-height")}} và {{cssxref("column-width")}} trong một khai báo duy nhất.

{{InteractiveExample("CSS Demo: column-count")}}

```css interactive-example-choice
column-count: 2;
```

```css interactive-example-choice
column-count: 3;
```

```css interactive-example-choice
column-count: 4;
```

```css interactive-example-choice
column-count: auto;
column-width: 8rem;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
#example-element {
  width: 100%;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
column-count: auto;

/* Giá trị <integer> */
column-count: 3;

/* Giá trị toàn cục */
column-count: inherit;
column-count: initial;
column-count: revert;
column-count: revert-layer;
column-count: unset;
```

### Giá trị

- `auto`
  - : Số cột được xác định bởi các thuộc tính CSS khác, chẳng hạn như {{cssxref("column-width")}}.
- {{cssxref("&lt;integer&gt;")}}
  - : Là một {{cssxref("&lt;integer&gt;")}} dương nghiêm ngặt mô tả số cột lý tưởng mà nội dung của phần tử sẽ được phân bố vào. Nếu {{cssxref("column-width")}} cũng được đặt thành giá trị khác `auto`, nó chỉ chỉ ra số cột tối đa được phép.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chia một đoạn văn thành ba cột

#### HTML

```html
<p class="content-box">
  This is a bunch of text split into three columns using the CSS
  <code>column-count</code>
  property. The text is equally distributed over the columns.
</p>
```

#### CSS

```css
.content-box {
  column-count: 3;
}
```

#### Kết quả

{{EmbedLiveSample('Splitting_a_paragraph_across_three_columns', 'auto', 120)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("column-height")}}
- {{cssxref("column-width")}}
- Thuộc tính viết tắt {{cssxref("columns")}}
- {{CSSXref("column-rule-color")}}, {{CSSXref("column-rule-style")}}, {{CSSXref("column-rule-width")}}, thuộc tính viết tắt {{CSSXref("column-rule")}}
- [Tìm hiểu: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout) (Tìm hiểu Bố cục)
- [Khái niệm cơ bản về Multicol](/en-US/docs/Web/CSS/Guides/Multicol_layout/Basic_concepts)
