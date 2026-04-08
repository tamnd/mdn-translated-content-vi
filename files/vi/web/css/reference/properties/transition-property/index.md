---
title: transition-property
slug: Web/CSS/Reference/Properties/transition-property
page-type: css-property
browser-compat: css.properties.transition-property
sidebar: cssref
---

Thuộc tính **`transition-property`** của [CSS](/vi/docs/Web/CSS) đặt các thuộc tính CSS mà [hiệu ứng chuyển đổi](/vi/docs/Web/CSS/Guides/Transitions/Using) sẽ được áp dụng.

{{InteractiveExample("CSS Demo: transition-property")}}

```css interactive-example-choice
transition-property: margin-right;
```

```css interactive-example-choice
transition-property: margin-right, color;
```

```css interactive-example-choice
transition-property: all;
```

```css interactive-example-choice
transition-property: none;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">Hover to see<br />the transition.</div>
</section>
```

```css interactive-example
#example-element {
  background-color: #e4f0f5;
  color: black;
  padding: 1rem;
  border-radius: 0.5rem;
  font: 1em monospace;
  width: 100%;
  transition: margin-right 2s;
}

#default-example:hover > #example-element {
  background-color: #990099;
  color: white;
  margin-right: 40%;
}
```

Nếu bạn chỉ định một thuộc tính viết tắt (ví dụ: {{cssxref("background")}}) thì tất cả các thuộc tính con dài hạn có thể hoạt hình của nó đều sẽ được áp dụng.

## Cú pháp

```css
/* Giá trị từ khóa */
transition-property: none;
transition-property: all;

/* Giá trị <custom-ident> */
transition-property: test_05;
transition-property: -specific;
transition-property: sliding-vertically;

/* Nhiều giá trị */
transition-property: test1, animation4;
transition-property: all, height, color;
transition-property:
  all,
  -moz-specific,
  sliding;

/* Giá trị toàn cục */
transition-property: inherit;
transition-property: initial;
transition-property: revert;
transition-property: revert-layer;
transition-property: unset;
```

### Giá trị

- `none`
  - : Không có thuộc tính nào sẽ được chuyển đổi.
- `all`
  - : Tất cả các thuộc tính có thể chuyển đổi đều sẽ được áp dụng.
- {{cssxref("&lt;custom-ident&gt;")}}
  - : Một chuỗi xác định thuộc tính mà hiệu ứng chuyển đổi sẽ được áp dụng khi giá trị của nó thay đổi.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Khi nút được di chuột qua hoặc được lấy tiêu điểm, nó trải qua một chuyển đổi màu trong một giây; `transition-property` là {{cssxref("background-color")}}.

#### HTML

```html
<button class="target">Lấy tiêu điểm!</button>
```

#### CSS

```css hidden
html {
  height: 100vh;
}

button {
  font-size: 1.4rem;
  padding: 10px 20px;
  border: 1px solid #cccccc;
  border-radius: 10px;
  outline: none;
}
```

```css
.target {
  transition-property: background-color;
  transition-duration: 1s;
  background-color: #cccccc;
}

.target:hover,
.target:focus {
  background-color: #eeeeee;
}
```

{{EmbedLiveSample('Basic_example', 600, 100)}}

Xem hướng dẫn [Sử dụng CSS transitions](/vi/docs/Web/CSS/Guides/Transitions/Using) để biết thêm ví dụ về `transition-property`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/vi/docs/Web/CSS/Guides/Transitions/Using)
- {{cssxref('transition')}}
- {{cssxref('transition-duration')}}
- {{cssxref('transition-timing-function')}}
- {{cssxref('transition-delay')}}
- {{domxref("TransitionEvent")}}
