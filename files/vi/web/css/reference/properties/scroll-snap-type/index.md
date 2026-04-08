---
title: scroll-snap-type
slug: Web/CSS/Reference/Properties/scroll-snap-type
page-type: css-property
browser-compat: css.properties.scroll-snap-type
sidebar: cssref
---

Thuộc tính **`scroll-snap-type`** [CSS](/en-US/docs/Web/CSS) được đặt trên {{glossary("scroll container")}}, cho phép nó tham gia vào scroll snapping bằng cách đặt hướng và mức độ nghiêm ngặt của việc thực thi điểm snap trong [snap port](/en-US/docs/Glossary/Scroll_snap#snapport).

{{InteractiveExample("CSS Demo: scroll-snap-type")}}

```css interactive-example-choice
scroll-snap-type: none;
```

```css interactive-example-choice
scroll-snap-type: x mandatory;
```

```css interactive-example-choice
scroll-snap-type: x proximity;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-element">
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

#example-element {
  text-align: left;
  width: 250px;
  height: 250px;
  overflow-x: scroll;
  display: flex;
  box-sizing: border-box;
  border: 1px solid black;
}

#example-element > div {
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

#example-element > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

Nếu nội dung trong scroll port thay đổi — ví dụ: nếu nội dung được thêm vào, di chuyển, xóa hoặc thay đổi kích thước — vùng chứa cuộn sẽ snap lại với nội dung đã snap trước đó nếu nội dung đó vẫn còn.

Nếu giá trị của thuộc tính liên quan đến scroll snap, chẳng hạn như `scroll-snap-type` hoặc {{cssxref("scroll-margin")}}, bị thay đổi, vùng chứa cuộn sẽ snap lại dựa trên giá trị hiện tại của `scroll-snap-type`.

Việc chỉ định các hiệu ứng hoạt hình chính xác hoặc vật lý được sử dụng để thực thi các điểm snap đó không được thuộc tính này bao gồm mà thay vào đó để lại cho tác nhân người dùng.

## Cú pháp

```css
/* Không snap */
scroll-snap-type: none;

/* Giá trị từ khóa cho trục snap */
scroll-snap-type: x;
scroll-snap-type: y;
scroll-snap-type: block;
scroll-snap-type: inline;
scroll-snap-type: both;

/* Giá trị từ khóa tùy chọn cho mức độ nghiêm ngặt snap */
/* mandatory | proximity */
scroll-snap-type: x mandatory;
scroll-snap-type: y proximity;
scroll-snap-type: both mandatory;

/* Giá trị toàn cục */
scroll-snap-type: inherit;
scroll-snap-type: initial;
scroll-snap-type: revert;
scroll-snap-type: revert-layer;
scroll-snap-type: unset;
```

### Giá trị

- `none`
  - : Khi {{Glossary("viewport")}} hiển thị của vùng chứa cuộn này được cuộn, nó phải bỏ qua các điểm snap.
- `x`
  - : Vùng chứa cuộn chỉ snap đến các vị trí snap trên trục ngang của nó.
- `y`
  - : Vùng chứa cuộn chỉ snap đến các vị trí snap trên trục dọc của nó.
- `block`
  - : Vùng chứa cuộn chỉ snap đến các vị trí snap trên trục block của nó.
- `inline`
  - : Vùng chứa cuộn chỉ snap đến các vị trí snap trên trục inline của nó.
- `both`
  - : Vùng chứa cuộn snap đến các vị trí snap trên cả hai trục độc lập (có thể snap đến các phần tử khác nhau ở mỗi trục).
- `mandatory`
  - : Viewport hiển thị của vùng chứa cuộn này phải snap đến một vị trí snap nếu nó không đang được cuộn.
- `proximity`
  - : Viewport hiển thị của vùng chứa cuộn này có thể snap đến một vị trí snap nếu nó không đang được cuộn. Tác nhân người dùng quyết định có snap hay không dựa trên các tham số cuộn. Đây là mức độ nghiêm ngặt snap mặc định nếu bất kỳ trục snap nào được chỉ định.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Snap trong các trục khác nhau

#### HTML

```html
<main>
  <section class="x mandatory-scroll-snapping" dir="ltr">
    <div>X Mand. LTR</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="x proximity-scroll-snapping" dir="ltr">
    <div>X Prox. LTR</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="y mandatory-scroll-snapping" dir="ltr">
    <div>Y Mand. LTR</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="y proximity-scroll-snapping" dir="ltr">
    <div>Y Prox. LTR</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="x mandatory-scroll-snapping" dir="rtl">
    <div>X Mand. RTL</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="x proximity-scroll-snapping" dir="rtl">
    <div>X Prox. RTL</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="y mandatory-scroll-snapping" dir="rtl">
    <div>Y Mand. RTL</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
  <section class="y proximity-scroll-snapping" dir="rtl">
    <div>Y Prox. RTL</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
  </section>
</main>
```

#### CSS

```css hidden
main {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-flow: column nowrap;
  font-family: monospace;
}
section {
  display: flex;
  margin: 1em auto;
  outline: 1px dashed lightgray;
  flex: none;
  overflow: auto;
}
.x {
  width: 100%;
  height: 128px;
  flex-flow: row nowrap;
  overflow-y: hidden;
}
.y {
  width: 256px;
  height: 256px;
  flex-flow: column nowrap;
  overflow-x: hidden;
}
```

```css
/* scroll-snap */
.x.mandatory-scroll-snapping {
  scroll-snap-type: x mandatory;
}
.x.proximity-scroll-snapping {
  scroll-snap-type: x proximity;
}
.y.mandatory-scroll-snapping {
  scroll-snap-type: y mandatory;
}
.y.proximity-scroll-snapping {
  scroll-snap-type: y proximity;
}

div {
  text-align: center;
  scroll-snap-align: center;
  flex: none;
}
```

```css hidden
.x div {
  line-height: 128px;
  font-size: 64px;
  width: 100%;
  height: 128px;
}
.y div {
  line-height: 256px;
  font-size: 128px;
  width: 256px;
  height: 100%;
}

/* appearance fixes */
.y div:first-child {
  line-height: 1.3;
  font-size: 64px;
}

/* coloration */
div:nth-child(even) {
  background-color: #87ea87;
}
div:nth-child(odd) {
  background-color: #87ccea;
}
```

#### Kết quả

{{EmbedLiveSample("snapping_in_different_axes", "100%", 1800)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính scroll port khác: {{cssxref("scroll-margin")}}, {{cssxref("scroll-padding")}}
- Các thuộc tính phần tử con cuộn: {{cssxref("scroll-snap-align")}}, {{cssxref("scroll-margin")}}, {{cssxref("scroll-snap-stop")}}
- [Các khái niệm cơ bản về CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Basic_concepts)
- [Sử dụng sự kiện scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Cuộn được kiểm soát tốt với CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
