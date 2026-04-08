---
title: :nth-last-of-type()
slug: Web/CSS/Reference/Selectors/:nth-last-of-type
page-type: css-pseudo-class
browser-compat: css.selectors.nth-last-of-type
sidebar: cssref
---

Lớp giả **`:nth-last-of-type()`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khớp với các phần tử dựa trên vị trí của chúng trong số các phần tử anh chị em cùng loại (tên thẻ), đếm từ cuối.

{{InteractiveExample("CSS Demo: :nth-last-of-type", "tabbed-shorter")}}

```css interactive-example
dt {
  font-weight: bold;
}

dd {
  margin: 3px;
}

dd:nth-last-of-type(3n) {
  border: 2px solid orange;
}
```

```html interactive-example
<dl>
  <dt>Vegetables:</dt>
  <dd>1. Tomatoes</dd>
  <dd>2. Cucumbers</dd>
  <dd>3. Mushrooms</dd>
  <dt>Fruits:</dt>
  <dd>4. Apples</dd>
  <dd>5. Mangos</dd>
  <dd>6. Pears</dd>
  <dd>7. Oranges</dd>
</dl>
```

## Cú pháp

```css-nolint
:nth-last-of-type(<An+B> | even | odd) {
  /* ... */
}
```

### Tham số

Lớp giả `:nth-last-of-type()` được chỉ định bằng một đối số duy nhất, đại diện cho mẫu để khớp các phần tử, đếm từ cuối.

Xem {{Cssxref(":nth-last-child")}} để có giải thích chi tiết hơn về cú pháp của nó.

## Ví dụ

### HTML

```html
<div>
  <span>This is a span.</span>
  <span>This is another span.</span>
  <em>This is emphasized.</em>
  <span>Wow, this span gets limed!!!</span>
  <del>This is struck through.</del>
  <span>Here is one last span.</span>
</div>
```

### CSS

```css
span:nth-last-of-type(2) {
  background-color: lime;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":nth-last-child")}}, {{Cssxref(":nth-of-type")}}
