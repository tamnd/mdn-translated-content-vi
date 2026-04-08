---
title: scroll-margin-right
slug: Web/CSS/Reference/Properties/scroll-margin-right
page-type: css-property
browser-compat: css.properties.scroll-margin-right
sidebar: cssref
---

Thuộc tính `scroll-margin-right` xác định lề bên phải của vùng cuộn snap được dùng để căn snap hộp này vào [snapport](/en-US/docs/Glossary/Scroll_snap#snapport). Vùng cuộn snap được xác định bằng cách lấy hộp viền đã biến đổi, tìm hộp bao hình chữ nhật của nó (căn chỉnh theo trục trong không gian tọa độ của vùng chứa cuộn), sau đó thêm các khoảng cách đã chỉ định.

{{InteractiveExample("CSS Demo: scroll-margin-right")}}

```css interactive-example-choice
scroll-margin-right: 0;
```

```css interactive-example-choice
scroll-margin-right: 20px;
```

```css interactive-example-choice
scroll-margin-right: 2em;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="scroller">
    <div>1</div>
    <div id="example-element">2</div>
    <div>3</div>
  </div>
  <div class="info">Scroll »</div>
</section>
```

```css interactive-example
.default-example {
  flex-wrap: wrap;
}

.default-example .info {
  width: 100%;
  padding: 0.5em 0;
  font-size: 90%;
}

.scroller {
  text-align: left;
  width: 250px;
  height: 250px;
  overflow-x: scroll;
  display: flex;
  box-sizing: border-box;
  border: 1px solid black;
  scroll-snap-type: x mandatory;
}

.scroller > div {
  flex: 0 0 250px;
  width: 250px;
  background-color: rebeccapurple;
  color: white;
  font-size: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  scroll-snap-align: end;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị <length> */
scroll-margin-right: 10px;
scroll-margin-right: 1em;

/* Giá trị toàn cục */
scroll-margin-right: inherit;
scroll-margin-right: initial;
scroll-margin-right: revert;
scroll-margin-right: revert-layer;
scroll-margin-right: unset;
```

### Giá trị

- {{CSSXref("&lt;length&gt;")}}
  - : Khoảng cách tính từ cạnh phải của vùng chứa cuộn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
