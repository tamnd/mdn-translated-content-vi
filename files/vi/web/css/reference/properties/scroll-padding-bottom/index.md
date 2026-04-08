---
title: scroll-padding-bottom
slug: Web/CSS/Reference/Properties/scroll-padding-bottom
page-type: css-property
browser-compat: css.properties.scroll-padding-bottom
sidebar: cssref
---

Thuộc tính `scroll-padding-bottom` xác định các độ lệch cho cạnh dưới của _vùng hiển thị tối ưu_ của scrollport: vùng được sử dụng làm vùng mục tiêu để đưa các thứ vào tầm nhìn của người dùng. Điều này cho phép tác giả loại trừ các vùng của scrollport bị che khuất bởi nội dung khác (chẳng hạn như thanh công cụ hoặc thanh bên cố định) hoặc tạo thêm khoảng trống giữa phần tử mục tiêu và các cạnh của scrollport.

{{InteractiveExample("CSS Demo: scroll-padding-bottom")}}

```css interactive-example-choice
scroll-padding-bottom: 0;
```

```css interactive-example-choice
scroll-padding-bottom: 20px;
```

```css interactive-example-choice
scroll-padding-bottom: 2em;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="scroller" id="example-element">
    <div>1</div>
    <div>2</div>
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
  scroll-snap-align: end;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-padding-bottom: auto;

/* Giá trị <length> */
scroll-padding-bottom: 10px;
scroll-padding-bottom: 1em;
scroll-padding-bottom: 10%;

/* Giá trị toàn cục */
scroll-padding-bottom: inherit;
scroll-padding-bottom: initial;
scroll-padding-bottom: revert;
scroll-padding-bottom: revert-layer;
scroll-padding-bottom: unset;
```

### Giá trị

- `<length-percentage>`
  - : Độ lệch hướng vào trong từ cạnh dưới của scrollport, dưới dạng độ dài hợp lệ hoặc phần trăm.
- `auto`
  - : Độ lệch được xác định bởi user agent. Giá trị này thường là 0px, nhưng user agent có thể phát hiện và làm gì đó khác nếu giá trị khác không phù hợp hơn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
