---
title: column-rule
slug: Web/CSS/Reference/Properties/column-rule
page-type: css-shorthand-property
browser-compat: css.properties.column-rule
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`column-rule`** [CSS](/en-US/docs/Web/CSS) đặt độ rộng, kiểu dáng và màu sắc của đường kẻ được vẽ giữa các cột trong bố cục nhiều cột.

{{InteractiveExample("CSS Demo: column-rule")}}

```css interactive-example-choice
column-rule: dotted;
```

```css interactive-example-choice
column-rule: solid 6px;
```

```css interactive-example-choice
column-rule: solid blue;
```

```css interactive-example-choice
column-rule: thick inset blue;
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
  columns: 3;
  column-rule: solid;
  text-align: left;
}
```

## Các thuộc tính thành phần

Thuộc tính này là thuộc tính viết tắt cho các thuộc tính CSS sau:

- {{Cssxref("column-rule-color")}}
- {{Cssxref("column-rule-style")}}
- {{Cssxref("column-rule-width")}}

## Cú pháp

```css
column-rule: dotted;
column-rule: solid 8px;
column-rule: solid blue;
column-rule: thick inset blue;

/* Giá trị toàn cục */
column-rule: inherit;
column-rule: initial;
column-rule: revert;
column-rule: revert-layer;
column-rule: unset;
```

### Giá trị

Thuộc tính `column-rule` được chỉ định là một, hai hoặc ba giá trị liệt kê bên dưới, theo bất kỳ thứ tự nào.

- `<'column-rule-width'>`
  - : Là {{cssxref("&lt;length&gt;")}} hoặc một trong ba từ khóa, `thin`, `medium` hoặc `thick`. Xem {{cssxref("border-width")}} để biết chi tiết.
- `<'column-rule-style'>`
  - : Xem {{cssxref("border-style")}} để biết các giá trị có thể và chi tiết.
- `<'column-rule-color'>`
  - : Là giá trị {{cssxref("&lt;color&gt;")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ 1

```css
/* Tương đương với "medium dotted currentColor" */
p.foo {
  column-rule: dotted;
}

/* Tương đương với "medium solid blue" */
p.bar {
  column-rule: solid blue;
}

/* Tương đương với "8px solid currentColor" */
p.baz {
  column-rule: solid 8px;
}

p.abc {
  column-rule: thick inset blue;
}
```

### Ví dụ 2

#### HTML

```html
<p class="content-box">
  This is a bunch of text split into three columns. Take note of how the
  `column-rule` property is used to adjust the style, width, and color of the
  rule that appears between the columns.
</p>
```

#### CSS

```css
.content-box {
  padding: 0.3em;
  background: #ffff77;
  column-count: 3;
  column-rule: inset 2px #3333ff;
}
```

#### Kết quả

{{EmbedLiveSample('Example_2')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- {{CSSXref("column-rule-style")}}
- {{CSSXref("column-rule-width")}}
- {{CSSXref("column-rule-color")}}
