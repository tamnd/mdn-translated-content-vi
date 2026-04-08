---
title: scroll-padding-left
slug: Web/CSS/Reference/Properties/scroll-padding-left
page-type: css-property
browser-compat: css.properties.scroll-padding-left
sidebar: cssref
---

Thuộc tính `scroll-padding-left` xác định độ lệch cho phía bên trái của _vùng xem tối ưu_ của scrollport: vùng được sử dụng làm vùng mục tiêu để đưa nội dung vào tầm nhìn của người dùng. Điều này cho phép tác giả loại trừ các vùng của scrollport bị che khuất bởi nội dung khác (chẳng hạn như thanh công cụ hoặc thanh bên được định vị cố định) hoặc tạo thêm khoảng trống giữa phần tử mục tiêu và các cạnh của scrollport.

{{InteractiveExample("CSS Demo: scroll-padding-left")}}

```css interactive-example-choice
scroll-padding-left: 0;
```

```css interactive-example-choice
scroll-padding-left: 20px;
```

```css interactive-example-choice
scroll-padding-left: 2em;
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

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-padding-left: auto;

/* Giá trị <length> */
scroll-padding-left: 10px;
scroll-padding-left: 1em;
scroll-padding-left: 10%;

/* Giá trị toàn cục */
scroll-padding-left: inherit;
scroll-padding-left: initial;
scroll-padding-left: revert;
scroll-padding-left: revert-layer;
scroll-padding-left: unset;
```

### Giá trị

- `<length-percentage>`
  - : Độ lệch hướng vào trong từ cạnh trái của scrollport, là một giá trị độ dài hợp lệ hoặc một tỉ lệ phần trăm.
- `auto`
  - : Độ lệch được xác định bởi tác nhân người dùng. Thông thường đây sẽ là 0px, nhưng tác nhân người dùng có thể phát hiện và sử dụng giá trị khác nếu giá trị khác 0 phù hợp hơn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Cuộn được kiểm soát tốt với CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
