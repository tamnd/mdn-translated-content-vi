---
title: scroll-margin-inline-start
slug: Web/CSS/Reference/Properties/scroll-margin-inline-start
page-type: css-property
browser-compat: css.properties.scroll-margin-inline-start
sidebar: cssref
---

Thuộc tính `scroll-margin-inline-start` xác định lề của vùng cuộn snap tại điểm bắt đầu của chiều inline, được dùng để căn snap hộp này vào [snapport](/en-US/docs/Glossary/Scroll_snap#snapport). Vùng cuộn snap được xác định bằng cách lấy hộp viền đã biến đổi, tìm hộp bao hình chữ nhật của nó (căn chỉnh theo trục trong không gian tọa độ của vùng chứa cuộn), sau đó thêm các khoảng cách đã chỉ định.

{{InteractiveExample("CSS Demo: scroll-margin-inline-start")}}

```css interactive-example-choice
scroll-margin-inline-start: 0;
```

```css interactive-example-choice
scroll-margin-inline-start: 20px;
```

```css interactive-example-choice
scroll-margin-inline-start: 2em;
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
  scroll-snap-align: start;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị <length> */
scroll-margin-inline-start: 10px;
scroll-margin-inline-start: 1em;

/* Giá trị toàn cục */
scroll-margin-inline-start: inherit;
scroll-margin-inline-start: initial;
scroll-margin-inline-start: revert;
scroll-margin-inline-start: revert-layer;
scroll-margin-inline-start: unset;
```

### Giá trị

- {{CSSXref("&lt;length&gt;")}}
  - : Khoảng cách tính từ cạnh bắt đầu inline của vùng chứa cuộn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa cơ bản

Ví dụ này triển khai điều gì đó rất giống với ví dụ tương tác ở trên, ngoại trừ ở đây chúng ta sẽ giải thích cách nó được triển khai.

Mục tiêu ở đây là tạo bốn khối cuộn ngang, trong đó khối thứ hai và thứ ba sẽ snap vào vị trí, gần nhưng không hoàn toàn ở phía trái của mỗi khối.

#### HTML

HTML bao gồm một scroller với bốn phần tử con:

```html
<div class="scroller">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
</div>
```

#### CSS

Hãy cùng xem qua CSS. Container bên ngoài được định kiểu như sau:

```css
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
```

Các phần quan trọng liên quan đến scroll snapping là `overflow-x: scroll`, đảm bảo nội dung sẽ cuộn chứ không bị ẩn, và `scroll-snap-type: x mandatory`, quy định rằng scroll snapping phải xảy ra dọc theo trục ngang, và thanh cuộn luôn dừng lại tại một điểm snap.

Các phần tử con được định kiểu như sau:

```css
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

.scroller > div:nth-child(2n) {
  background-color: white;
  color: rebeccapurple;
}
```

Phần quan trọng nhất ở đây là `scroll-snap-align: start`, xác định rằng các cạnh bên trái (các "điểm bắt đầu" dọc theo trục x trong trường hợp này) là các điểm snap được chỉ định.

Cuối cùng, chúng ta chỉ định giá trị scroll-margin, mỗi giá trị khác nhau cho phần tử con thứ hai và thứ ba:

```css
.scroller > div:nth-child(2) {
  scroll-margin-inline-start: 1rem;
}

.scroller > div:nth-child(3) {
  scroll-margin-inline-start: 2rem;
}
```

Điều này có nghĩa là khi cuộn qua các phần tử con ở giữa, thanh cuộn sẽ snap đến `1rem` bên ngoài cạnh bắt đầu inline của `<div>` thứ hai, và `2rem` bên ngoài cạnh bắt đầu inline của `<div>` thứ ba.

#### Kết quả

Hãy tự thử:

{{EmbedLiveSample('Basic_demonstration', '100%', 300)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
