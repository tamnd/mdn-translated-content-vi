---
title: scroll-margin
slug: Web/CSS/Reference/Properties/scroll-margin
page-type: css-shorthand-property
browser-compat: css.properties.scroll-margin
sidebar: cssref
---

Thuộc tính viết tắt **`scroll-margin`** đặt tất cả lề cuộn của một phần tử cùng một lúc, gán giá trị tương tự như thuộc tính {{cssxref("margin")}} làm cho lề của phần tử.

{{InteractiveExample("CSS Demo: scroll-margin")}}

```css interactive-example-choice
scroll-margin: 0;
```

```css interactive-example-choice
scroll-margin: 20px;
```

```css interactive-example-choice
scroll-margin: 2em;
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

- {{cssxref("scroll-margin-bottom")}}
- {{cssxref("scroll-margin-left")}}
- {{cssxref("scroll-margin-right")}}
- {{cssxref("scroll-margin-top")}}

## Cú pháp

```css
/* Giá trị <length> */
scroll-margin: 10px;
scroll-margin: 1em 0.5em 1em 1em;

/* Giá trị toàn cục */
scroll-margin: inherit;
scroll-margin: initial;
scroll-margin: revert;
scroll-margin: revert-layer;
scroll-margin: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Khoảng cách lùi ra ngoài từ cạnh tương ứng của scroll container.

## Mô tả

Bạn có thể thấy hiệu ứng của `scroll-margin` bằng cách cuộn đến một điểm nằm giữa hai "trang" của nội dung ví dụ. Giá trị được chỉ định cho `scroll-margin` xác định bao nhiêu phần của trang nằm chủ yếu bên ngoài [snapport](/en-US/docs/Glossary/Scroll_snap#snapport) sẽ vẫn hiển thị.

Do đó, các giá trị `scroll-margin` biểu thị các khoảng lùi xác định vùng scroll snap được dùng để snap hộp này vào snapport. Vùng scroll snap được xác định bằng cách lấy hộp viền đã biến đổi, tìm hộp bao chữ nhật của nó (được căn chỉnh theo trục trong không gian tọa độ của scroll container), sau đó thêm các khoảng lùi đã chỉ định.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Minh họa cơ bản

Ví dụ này triển khai thứ gì đó rất giống với ví dụ tương tác ở trên, ngoại trừ ở đây chúng ta sẽ giải thích cách nó được triển khai.

Mục tiêu ở đây là tạo bốn khối cuộn ngang, trong đó khối thứ hai và thứ ba snap vào vị trí, gần nhưng không hoàn toàn ở bên trái của mỗi khối.

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

Hãy xem qua CSS. Container bên ngoài được tạo kiểu như sau:

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

Các phần chính liên quan đến scroll snapping là `overflow-x: scroll`, đảm bảo nội dung sẽ cuộn và không bị ẩn, và `scroll-snap-type: x mandatory`, quy định rằng scroll snapping phải xảy ra dọc theo trục ngang và cuộn sẽ luôn dừng tại một điểm snap.

Các phần tử con được tạo kiểu như sau:

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

Phần liên quan nhất ở đây là `scroll-snap-align: start`, chỉ định rằng các cạnh bên trái (các "điểm bắt đầu" dọc theo trục x, trong trường hợp của chúng ta) là các điểm snap được chỉ định.

Cuối cùng, chúng ta chỉ định các giá trị scroll margin, một giá trị khác nhau cho phần tử con thứ hai và thứ ba:

```css
.scroller > div:nth-child(2) {
  scroll-margin: 1rem;
}

.scroller > div:nth-child(3) {
  scroll-margin: 2rem;
}
```

Điều này có nghĩa là khi cuộn qua các phần tử con ở giữa, cuộn sẽ snap đến `1rem` bên ngoài cạnh trái của `<div>` thứ hai, và `2rem` bên ngoài cạnh trái của `<div>` thứ ba.

> [!NOTE]
> Ở đây chúng ta đặt `scroll-margin` cho tất cả các cạnh cùng một lúc, nhưng chỉ cạnh bắt đầu thực sự liên quan. Sẽ hoạt động tốt như nhau nếu chỉ đặt scroll margin trên cạnh đó, ví dụ với `scroll-margin-inline-start: 1rem`, hoặc `scroll-margin: 0 0 0 1rem`.

#### Kết quả

Hãy thử nó:

{{EmbedLiveSample('Basic_demonstration', '100%', 300)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Well-controlled scrolling with CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
