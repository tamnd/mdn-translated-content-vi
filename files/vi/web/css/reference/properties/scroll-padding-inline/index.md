---
title: scroll-padding-inline
slug: Web/CSS/Reference/Properties/scroll-padding-inline
page-type: css-shorthand-property
browser-compat: css.properties.scroll-padding-inline
sidebar: cssref
---

Thuộc tính viết tắt `scroll-padding-inline` đặt khoảng đệm cuộn của một phần tử theo chiều inline.

{{InteractiveExample("CSS Demo: scroll-padding-inline")}}

```css interactive-example-choice
scroll-padding-inline: 0;
```

```css interactive-example-choice
scroll-padding-inline: 20px;
```

```css interactive-example-choice
scroll-padding-inline: 2em;
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
  scroll-snap-align: start;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

Các thuộc tính scroll-padding xác định các độ lệch cho _vùng hiển thị tối ưu_ của scrollport: vùng được sử dụng làm vùng mục tiêu để đưa các thứ vào tầm nhìn của người dùng. Điều này cho phép tác giả loại trừ các vùng của scrollport bị che khuất bởi nội dung khác (chẳng hạn như thanh công cụ hoặc thanh bên cố định) hoặc tạo thêm khoảng trống giữa phần tử mục tiêu và các cạnh của scrollport.

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("scroll-padding-inline-end")}}
- {{cssxref("scroll-padding-inline-start")}}

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-padding-inline: auto;

/* Giá trị <length> */
scroll-padding-inline: 10px;
scroll-padding-inline: 1em 0.5em;
scroll-padding-inline: 10%;

/* Giá trị toàn cục */
scroll-padding-inline: inherit;
scroll-padding-inline: initial;
scroll-padding-inline: revert;
scroll-padding-inline: revert-layer;
scroll-padding-inline: unset;
```

### Giá trị

- `<length-percentage>`
  - : Độ lệch hướng vào trong từ cạnh tương ứng của scrollport, dưới dạng độ dài hợp lệ hoặc phần trăm.
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
