---
title: marker-mid
slug: Web/CSS/Reference/Properties/marker-mid
page-type: css-property
browser-compat: css.properties.marker-mid
sidebar: cssref
---

Thuộc tính **`marker-mid`** trong [CSS](/en-US/docs/Web/CSS) trỏ đến một marker sẽ được vẽ tại các đỉnh giữa trong đường dẫn của phần tử; tức là tại mỗi đỉnh nằm giữa đỉnh bắt đầu và đỉnh kết thúc. Marker phải được định nghĩa bằng phần tử SVG {{SVGElement('marker')}}, và chỉ có thể được tham chiếu bằng giá trị {{cssxref("url_value", "&lt;url&gt;")}}. Giá trị của thuộc tính CSS này ghi đè lên mọi giá trị của thuộc tính `marker-mid` trong SVG.

Hướng mà mỗi marker chỉ đến được xác định là hướng nằm giữa hướng kết thúc của đoạn đường trước và hướng bắt đầu của đoạn đường tiếp theo. Có thể hình dung đây là tích có hướng của các vectơ được xác định bởi hai hướng đường dẫn.

> [!NOTE]
> Thuộc tính `marker-mid` chỉ có hiệu lực đối với các phần tử có thể sử dụng SVG marker. Xem {{SVGAttr("marker-mid")}} để biết danh sách.

## Cú pháp

```css
marker-mid: none;
marker-mid: url("markers.svg#arrow");

/* Giá trị toàn cục */
marker-mid: inherit;
marker-mid: initial;
marker-mid: revert;
marker-mid: revert-layer;
marker-mid: unset;
```

### Giá trị

- `none`
  - : Không có marker nào được vẽ tại mỗi đỉnh giữa của đường dẫn phần tử.

- `<marker-ref>`
  - : Một {{cssxref("url_value", "&lt;url&gt;")}} tham chiếu đến marker được định nghĩa bởi phần tử SVG {{SVGElement('marker')}}, để vẽ tại mỗi đỉnh giữa của đường dẫn phần tử. Nếu tham chiếu URL không hợp lệ, không có marker nào được vẽ tại các đỉnh giữa của đường dẫn.

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
  marker-mid: url("#triangle");
}
```

{{EmbedLiveSample("Ví dụ", "200", "200")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("marker-start")}}
- {{cssxref("marker-end")}}
- {{cssxref("marker")}}
- Thuộc tính SVG {{SVGAttr("marker-mid")}}
