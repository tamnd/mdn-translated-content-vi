---
title: marker-start
slug: Web/CSS/Reference/Properties/marker-start
page-type: css-property
browser-compat: css.properties.marker-start
sidebar: cssref
---

Thuộc tính **`marker-start`** trong [CSS](/en-US/docs/Web/CSS) trỏ đến một marker sẽ được vẽ tại đỉnh đầu tiên trong đường dẫn của phần tử; tức là tại đỉnh bắt đầu của nó. Marker phải được định nghĩa bằng phần tử SVG {{SVGElement('marker')}}, và chỉ có thể được tham chiếu bằng giá trị {{cssxref("url_value", "&lt;url&gt;")}}. Giá trị của thuộc tính CSS này ghi đè lên mọi giá trị của thuộc tính `marker-start` trong SVG.

Đối với nhiều hình dạng hỗ trợ marker, đỉnh đầu tiên và đỉnh cuối cùng nằm ở cùng một vị trí: ví dụ, góc trên bên trái của phần tử {{SVGElement('rect')}}. Trong những hình dạng như vậy, nếu cả marker đầu và marker cuối đều được định nghĩa, hai marker sẽ được vẽ tại điểm đó, mặc dù chúng có thể không chỉ về cùng một hướng.

> [!NOTE]
> Thuộc tính `marker-start` chỉ có hiệu lực đối với các phần tử có thể sử dụng SVG marker. Xem {{SVGAttr("marker-start")}} để biết danh sách.

## Cú pháp

```css
marker-start: none;
marker-start: url("markers.svg#arrow");

/* Giá trị toàn cục */
marker-start: inherit;
marker-start: initial;
marker-start: revert;
marker-start: revert-layer;
marker-start: unset;
```

### Giá trị

- `none`
  - : Không có marker nào được vẽ tại đỉnh đầu tiên của đường dẫn phần tử.

- `<marker-ref>`
  - : Một {{cssxref("url_value", "&lt;url&gt;")}} tham chiếu đến marker được định nghĩa bởi phần tử SVG {{SVGElement('marker')}}, để vẽ tại đỉnh đầu tiên của đường dẫn phần tử. Nếu tham chiếu URL không hợp lệ, không có marker nào được vẽ tại đỉnh đầu của đường dẫn.

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
<svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
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
    points="20,100 40,60 70,80 100,20" />
</svg>
```

```css
polyline#test {
  marker-start: url("#triangle");
}
```

{{EmbedLiveSample("Ví dụ", "200", "200")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("marker-mid")}}
- {{cssxref("marker-end")}}
- {{cssxref("marker")}}
- Thuộc tính SVG {{SVGAttr("marker-start")}}
