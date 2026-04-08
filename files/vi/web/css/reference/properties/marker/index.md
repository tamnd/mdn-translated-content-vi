---
title: marker
slug: Web/CSS/Reference/Properties/marker
page-type: css-property
browser-compat: css.properties.marker
sidebar: cssref
---

Thuộc tính **`marker`** [CSS](/en-US/docs/Web/CSS) trỏ đến một điểm đánh dấu sẽ được vẽ tại các đỉnh đầu tiên, giữa và cuối cùng của đường dẫn của phần tử; tức là tại tất cả các đỉnh của nó. Điểm đánh dấu phải được định nghĩa bằng phần tử SVG {{SVGElement('marker')}}, và chỉ có thể được tham chiếu bằng giá trị {{cssxref("url_value", "&lt;url&gt;")}}. Giá trị của thuộc tính CSS ghi đè bất kỳ giá trị nào của các thuộc tính `marker-start`, `marker`, và `marker-end` trong SVG.

Đối với nhiều hình dạng hỗ trợ điểm đánh dấu, đỉnh đầu tiên và cuối cùng ở cùng một vị trí: ví dụ, góc trên bên trái của {{SVGElement('rect')}}. Trong các hình dạng như vậy, nếu cả điểm đánh dấu đầu tiên và cuối cùng đều được xác định, hai điểm đánh dấu sẽ được vẽ tại điểm đó, mặc dù chúng có thể không chỉ cùng một hướng.

Đối với các đỉnh giữa, hướng mà mỗi điểm đánh dấu chỉ được xác định là hướng nằm giữa hướng ở cuối đoạn đường dẫn trước và hướng của điểm bắt đầu của đoạn đường dẫn tiếp theo. Điều này có thể được hiểu là tích có hướng của các vectơ được xác định bởi hai hướng đường dẫn.

> [!NOTE]
> Thuộc tính `marker` chỉ có hiệu lực đối với các phần tử có thể sử dụng điểm đánh dấu SVG. Xem {{SVGAttr("marker-start")}} để biết danh sách.

## Cú pháp

```css
marker: none;
marker: url("markers.svg#arrow");

/* Giá trị toàn cục */
marker: inherit;
marker: initial;
marker: revert;
marker: revert-layer;
marker: unset;
```

### Giá trị

- `none`
  - : Không có điểm đánh dấu nào sẽ được vẽ tại mỗi đỉnh của đường dẫn phần tử.

- `<marker-ref>`
  - : Một {{cssxref("url_value", "&lt;url&gt;")}} tham chiếu đến một điểm đánh dấu được xác định bởi phần tử SVG {{SVGElement('marker')}}, sẽ được vẽ tại mỗi đỉnh của đường dẫn phần tử. Nếu tham chiếu URL không hợp lệ, không có điểm đánh dấu nào sẽ được vẽ tại các đỉnh của đường dẫn.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <marker
      id="triangle"
      viewBox="0 0 10 10"
      markerWidth="10"
      markerHeight="10"
      refX="1"
      refY="5"
      markerUnits="strokeWidth"
      orient="auto">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="red" />
    </marker>
  </defs>
  <polyline
    id="test"
    fill="none"
    stroke="black"
    points="20,100 40,60 70,80 100,20 130,10 150,10 170,20 170,100 120,100" />
</svg>
```

```css
polyline#test {
  marker: url("#triangle");
}
```

{{EmbedLiveSample("Example", "200", "200")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("marker-start")}}
- {{cssxref("marker-end")}}
- Phần tử SVG {{SVGElement("marker")}}
