---
title: scroll-snap-align
slug: Web/CSS/Reference/Properties/scroll-snap-align
page-type: css-property
browser-compat: css.properties.scroll-snap-align
sidebar: cssref
---

Thuộc tính `scroll-snap-align` chỉ định vị trí snap của hộp dưới dạng căn chỉnh của [snap area](/en-US/docs/Glossary/Scroll_snap#snap_area) của nó (là {{glossary("alignment subject")}}) trong snap port của vùng chứa snap (là {{glossary("alignment container")}}).

{{InteractiveExample("CSS Demo: scroll-snap-align")}}

```css interactive-example-choice
scroll-snap-align: start;
```

```css interactive-example-choice
scroll-snap-align: end;
```

```css interactive-example-choice
scroll-snap-align: center;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div id="example-parent">
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

#example-parent {
  text-align: left;
  width: 250px;
  height: 250px;
  overflow-x: scroll;
  display: flex;
  box-sizing: border-box;
  border: 1px solid black;
  scroll-snap-type: x mandatory;
}

#example-parent > div {
  flex: 0 0 66%;
  width: 250px;
  background-color: rebeccapurple;
  color: white;
  font-size: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
}

#example-parent > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị từ khóa đơn */
scroll-snap-align: none;
scroll-snap-align: center;
scroll-snap-align: start;
scroll-snap-align: end;

/* Hai giá trị từ khóa */
scroll-snap-align: start end;
scroll-snap-align: end center;
scroll-snap-align: center start;

/* Giá trị toàn cục */
scroll-snap-align: inherit;
scroll-snap-align: initial;
scroll-snap-align: revert;
scroll-snap-align: revert-layer;
scroll-snap-align: unset;
```

### Giá trị

Có thể chỉ định một hoặc hai giá trị cho thuộc tính `scroll-snap-align`. Nếu chỉ đặt một giá trị, nó sẽ được áp dụng cho cả hai trục block và inline. Nếu đặt hai giá trị, giá trị đầu tiên điều khiển trục block và giá trị thứ hai điều khiển trục inline.

- `none`
  - : Hộp không xác định vị trí snap trong trục đó.
- `start`
  - : Căn chỉnh đầu của [snap area](/en-US/docs/Glossary/Scroll_snap#snap_area) cuộn của hộp này, trong [snapport](/en-US/docs/Glossary/Scroll_snap#snapport) của vùng chứa cuộn, là một vị trí snap trong trục này.
- `end`
  - : Căn chỉnh cuối của snap area cuộn của hộp này, trong snapport của vùng chứa cuộn, là một vị trí snap trong trục này.
- `center`
  - : Căn chỉnh giữa của snap area cuộn của hộp này, trong snapport của vùng chứa cuộn, là một vị trí snap trong trục này.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-snap-stop")}}
- {{cssxref("scroll-initial-target")}}
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Cuộn được kiểm soát tốt với CSS scroll snap](https://web.dev/articles/css-scroll-snap) trên web.dev (2018)
