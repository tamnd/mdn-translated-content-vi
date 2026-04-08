---
title: scroll-snap-stop
slug: Web/CSS/Reference/Properties/scroll-snap-stop
page-type: css-property
browser-compat: css.properties.scroll-snap-stop
sidebar: cssref
---

Thuộc tính **`scroll-snap-stop`** [CSS](/en-US/docs/Web/CSS) xác định liệu vùng chứa cuộn có được phép "bỏ qua" các vị trí snap khả dụng hay không.

{{InteractiveExample("CSS Demo: scroll-snap-stop")}}

```css interactive-example-choice
scroll-snap-stop: normal;
```

```css interactive-example-choice
scroll-snap-stop: always;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p class="explanation">
    The effect of this property can be noticed on devices with a touchpad. Try
    to scroll through all items with a single swing. Value
    <b class="keyword">'normal'</b> should pass through all pages, while
    <b class="keyword">'always'</b> will stop at the second page.
  </p>
  <div class="snap-container">
    <div>1</div>
    <div id="example-element">2</div>
    <div>3</div>
  </div>
  <div class="info">Scroll »</div>
</section>
```

```css interactive-example
.default-example {
  flex-direction: column;
}

.explanation {
  margin-top: 0;
}

.keyword {
  color: darkorange;
}

.default-example .info {
  width: 100%;
  padding: 0.5em 0;
  font-size: 90%;
}

.snap-container {
  text-align: left;
  width: 250px;
  height: 250px;
  overflow-x: scroll;
  display: flex;
  box-sizing: border-box;
  border: 1px solid black;
  scroll-snap-type: x mandatory;
}

.snap-container > div {
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

.snap-container > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-snap-stop: normal;
scroll-snap-stop: always;

/* Giá trị toàn cục */
scroll-snap-stop: inherit;
scroll-snap-stop: initial;
scroll-snap-stop: revert;
scroll-snap-stop: revert-layer;
scroll-snap-stop: unset;
```

### Giá trị

- `normal`
  - : Khi {{Glossary("viewport")}} hiển thị của vùng chứa cuộn của phần tử này được cuộn, nó có thể "bỏ qua" các vị trí snap khả dụng.
- `always`
  - : Vùng chứa cuộn không được "bỏ qua" một vị trí snap khả dụng; phải snap vào vị trí snap đầu tiên của phần tử này.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt các điểm dừng snap khác nhau

Ví dụ dưới đây minh họa sự tương phản giữa giá trị `always` và `normal` của `scroll-snap-stop`. Sự khác biệt giữa hai giá trị `scroll-snap-stop` này rõ ràng hơn khi thuộc tính `scroll-snap-type` được đặt thành `mandatory`, đây là giá trị được sử dụng trong ví dụ này.

#### HTML

```html
<p>scroll-snap-stop: always (X Mandatory)</p>
<div class="x mandatory-scroll-snapping always-stop">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>

<p>scroll-snap-stop: always (X Mandatory) on odd child elements</p>
<div class="x mandatory-scroll-snapping always-stop-odd">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>

<p>scroll-snap-stop: always (X Mandatory) on even child elements</p>
<div class="x mandatory-scroll-snapping always-stop-even">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>

<p>scroll-snap-stop: normal (X Mandatory)</p>
<div class="x mandatory-scroll-snapping normal-stop">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>

<p>scroll-snap-stop: always (Y Mandatory)</p>
<div class="y mandatory-scroll-snapping always-stop">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>

<p>scroll-snap-stop: normal (Y Mandatory)</p>
<div class="y mandatory-scroll-snapping normal-stop">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
```

#### CSS

```css hidden
/* setup */
body {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-flow: column nowrap;
  font-family: monospace;
  text-align: center;
}

div[class] {
  font-size: 3rem;
  display: flex;
  overflow: auto;
  flex: none;
}

.x {
  width: 50%;
  min-width: 15rem;
  height: 6rem;
  flex-flow: row nowrap;
}

.y {
  width: 30%;
  min-width: 12rem;
  height: 12rem;
  flex-flow: column nowrap;
}

div > div {
  flex: none;
  outline: 1px solid #333333;
}

.x > div {
  width: 90%;
  height: 100%;
}

.y > div {
  width: 100%;
  height: 80%;
}

/* coloration */
div > div:nth-child(even) {
  background-color: #87ea87;
}

div > div:nth-child(odd) {
  background-color: #87ccea;
}
```

```css
/* setting up mandatory scroll-snap on parent */
.x.mandatory-scroll-snapping {
  scroll-snap-type: x mandatory;
}

.y.mandatory-scroll-snapping {
  scroll-snap-type: y mandatory;
}

/* defining scroll-snap alignment on children */
div > div {
  scroll-snap-align: center;
}

/* defining scroll-snap stop on children */
.always-stop > div {
  scroll-snap-stop: always;
}

.always-stop-odd > div:nth-of-type(odd) {
  scroll-snap-stop: always;
}

.always-stop-even > div:nth-of-type(even) {
  scroll-snap-stop: always;
}

.normal-stop > div {
  scroll-snap-stop: normal;
}
```

#### Kết quả

Cuộn từ trái sang phải và từ trên xuống dưới trong các hộp X và Y bên dưới. Trong các hộp X và Y mà thuộc tính `scroll-snap-stop` được đặt thành `always`, việc cuộn bị buộc phải dừng tại điểm snap ngay cả khi bạn cuộn nhanh. Tuy nhiên, trong các hộp mà `scroll-snap-stop` được đặt thành `normal`, các điểm snap bị bỏ qua khi bạn cuộn nhanh.

Nếu cần, bạn có thể chọn có chọn lọc những mục nào luôn dừng bên trong vùng chứa cuộn. Điều này được minh họa trong ví dụ bên dưới bằng cách nhắm mục tiêu các mục lẻ và chẵn; bạn có thể chọn chiến lược khác tùy theo yêu cầu của mình. Trong ví dụ bên dưới, cuộn không "bỏ qua" các mục lẻ và chẵn trong hộp thứ hai và thứ ba.

{{EmbedLiveSample("Snapping_in_different_axes", "100%", "1080")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-snap-align")}}
- {{cssxref("scroll-initial-target")}}
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Cuộn được kiểm soát tốt với CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
