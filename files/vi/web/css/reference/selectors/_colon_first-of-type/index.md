---
title: :first-of-type
slug: Web/CSS/Reference/Selectors/:first-of-type
page-type: css-pseudo-class
browser-compat: css.selectors.first-of-type
sidebar: cssref
---

**`:first-of-type`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), đại diện cho phần tử đầu tiên thuộc kiểu của nó (theo tên thẻ) trong một nhóm các phần tử anh chị em.

{{InteractiveExample("CSS Demo: :first-of-type", "tabbed-shorter")}}

```css interactive-example
dt {
  font-weight: bold;
}

dd {
  margin: 3px;
}

dd:first-of-type {
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

```css
:first-of-type {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho đoạn văn đầu tiên

#### HTML

```html
<h2>Heading</h2>
<p>Paragraph 1</p>
<p>Paragraph 2</p>
```

#### CSS

```css
p:first-of-type {
  color: red;
  font-style: italic;
}
```

#### Kết quả

{{EmbedLiveSample('Styling_the_first_paragraph')}}

### Các phần tử lồng nhau

Ví dụ này cho thấy cách các phần tử lồng nhau cũng có thể được chọn. Lưu ý rằng [bộ chọn phổ quát](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) (`*`) được ngầm hiểu khi không có bộ chọn kiểu nào được viết.

#### HTML

```html
<article>
  <div>This `div` is first!</div>
  <div>This <span>nested `span` is first</span>!</div>
  <div>
    This <em>nested `em` is first</em>, but this <em>nested `em` is last</em>!
  </div>
  <div>This <span>nested `span` gets styled</span>!</div>
  <p>This `p` qualifies!</p>
  <div>This is the final `div`.</div>
</article>
```

#### CSS

```css
article :first-of-type {
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample('Nested_elements', 500)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref(":first-child")}}, {{Cssxref(":last-of-type")}}, {{Cssxref(":nth-of-type")}}
