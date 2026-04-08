---
title: scroll-margin-block
slug: Web/CSS/Reference/Properties/scroll-margin-block
page-type: css-shorthand-property
browser-compat: css.properties.scroll-margin-block
sidebar: cssref
---

Thuộc tính viết tắt `scroll-margin-block` đặt lề cuộn của một phần tử theo chiều block.

{{InteractiveExample("CSS Demo: scroll-margin-block")}}

```css interactive-example-choice
scroll-margin-block: 0;
```

```css interactive-example-choice
scroll-margin-block: 20px;
```

```css interactive-example-choice
scroll-margin-block: 2em;
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
.default-example .info {
  inline-size: 100%;
  padding: 0.5em 0;
  font-size: 90%;
  writing-mode: vertical-rl;
}

.scroller {
  text-align: left;
  height: 250px;
  width: 270px;
  overflow-y: scroll;
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  border: 1px solid black;
  scroll-snap-type: y mandatory;
}

.scroller > div {
  flex: 0 0 250px;
  background-color: rebeccapurple;
  color: white;
  font-size: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  scroll-snap-align: start;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("scroll-margin-block-end")}}
- {{cssxref("scroll-margin-block-start")}}

## Cú pháp

```css
/* Giá trị <length> */
scroll-margin-block: 10px;
scroll-margin-block: 1em 0.5em;

/* Giá trị toàn cục */
scroll-margin-block: inherit;
scroll-margin-block: initial;
scroll-margin-block: revert;
scroll-margin-block: revert-layer;
scroll-margin-block: unset;
```

### Giá trị

- {{CSSXref("&lt;length&gt;")}}
  - : Khoảng cách lùi ra ngoài từ cạnh tương ứng của scroll container.

## Mô tả

Các giá trị scroll-margin biểu thị các khoảng lùi xác định vùng scroll snap được dùng để snap hộp này vào [snapport](/en-US/docs/Glossary/Scroll_snap#snapport). Vùng scroll snap được xác định bằng cách lấy hộp viền đã biến đổi, tìm hộp bao chữ nhật của nó (được căn chỉnh theo trục trong không gian tọa độ của scroll container), sau đó thêm các khoảng lùi đã chỉ định.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
