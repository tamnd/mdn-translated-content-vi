---
title: :last-of-type
slug: Web/CSS/Reference/Selectors/:last-of-type
page-type: css-pseudo-class
browser-compat: css.selectors.last-of-type
sidebar: cssref
---

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:last-of-type`** đại diện cho phần tử cuối cùng thuộc kiểu của nó (tên thẻ) trong một nhóm các phần tử anh em.

{{InteractiveExample("CSS Demo: :last-of-type", "tabbed-shorter")}}

```css interactive-example
dt {
  font-weight: bold;
}

dd {
  margin: 3px;
}

dd:last-of-type {
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
:last-of-type {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu cho đoạn văn cuối cùng

#### HTML

```html
<h2>Heading</h2>
<p>Paragraph 1</p>
<p>Paragraph 2</p>
```

#### CSS

```css
p:last-of-type {
  color: red;
  font-style: italic;
}
```

#### Kết quả

{{EmbedLiveSample('Styling_the_last_paragraph')}}

### Phần tử lồng nhau

Ví dụ này minh họa cách các phần tử lồng nhau cũng có thể được nhắm tới. Lưu ý rằng [bộ chọn toàn cục](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) (`*`) được ngầm định khi không có bộ chọn đơn giản nào được viết.

#### HTML

```html
<article>
  <div>This `div` is first.</div>
  <div>This <span>nested `span` is last</span>!</div>
  <div>
    This <em>nested `em` is first</em>, but this <em>nested `em` is last</em>!
  </div>
  <p>This `p` qualifies!</p>
  <div>This is the final `div`!</div>
</article>
```

#### CSS

```css
article :last-of-type {
  background-color: pink;
}
```

#### Kết quả

{{EmbedLiveSample('Nested_elements', 500)}}

### Phần tử có nhiều bộ chọn

Ví dụ HTML này chứa các phần tử lồng nhau thuộc nhiều kiểu khác nhau. CSS chứa cả bộ chọn theo kiểu và bộ chọn theo lớp.

#### HTML

```html
<p>This `p` is not selected.</p>
<p>This `p` is not selected either.</p>
<p>
  This `p` is last `p` element of its parent e.g. `body` selected by `p` type
  selector.
</p>
<div class="container">
  <div class="item">This `div` is not selected.</div>
  <div class="item">This `div` is not selected either.</div>
  <div class="item">
    This `div` is last `div` element of its parent `div` selected by `.container
    .item` class selector.
  </div>
  <p class="item">
    This `p` is last `p` element of its parent `div` selected by `.container
    .item` class selector.
  </p>
</div>
```

#### CSS

```css
p:last-of-type {
  background: skyblue;
}

.container .item:last-of-type {
  color: red;
  font-weight: bold;
}
```

#### Kết quả

{{EmbedLiveSample('Multiple_selectors_elements', 500)}}

`<div>` cuối cùng và `<p>` cuối cùng đều có màu đỏ và in đậm vì `.item:last-of-type` chọn phần tử cuối của mỗi kiểu nếu phần tử cuối đó cũng có lớp `item`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":last-child")}}, {{Cssxref(":nth-last-of-type")}}
