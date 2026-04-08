---
title: flood-color
slug: Web/CSS/Reference/Properties/flood-color
page-type: css-property
browser-compat: css.properties.flood-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`flood-color`** xác định màu sắc của vùng phụ bộ lọc hiện tại trong các phần tử {{SVGElement("feFlood")}} và {{SVGElement("feDropShadow")}} bên trong {{SVGElement("filter")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("flood-color")}} của phần tử.

> [!NOTE]
> Thuộc tính `flood-color` chỉ áp dụng cho các phần tử {{SVGElement("feFlood")}} và {{SVGElement("feDropShadow")}} lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hay pseudo-element khác.

## Cú pháp

```css
/* Giá trị <color> */
flood-color: red;
flood-color: hsl(120deg 75% 25% / 60%);
flood-color: currentColor;

/* Giá trị toàn cục */
flood-color: inherit;
flood-color: initial;
flood-color: revert;
flood-color: revert-layer;
flood-color: unset;
```

### Giá trị

- {{cssxref("color_value", "&lt;color>")}}
  - : Màu sắc của flood. Đây có thể là bất kỳ giá trị {{cssxref("color_value", "&lt;color>")}} CSS hợp lệ nào.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định màu sắc của flood bộ lọc

Ví dụ này minh họa trường hợp sử dụng cơ bản của `flood-color`, và cách thuộc tính CSS `flood-color` có mức ưu tiên cao hơn thuộc tính `flood-color`.

#### HTML

Chúng ta có một SVG với hai phần tử {{SVGElement("filter")}}, mỗi phần tử có một phần tử con {{SVGElement("feFlood")}}. Mỗi phần tử `<feFlood>` bao gồm thuộc tính SVG `flood-color` xác định màu flood là `seagreen`. Chúng ta đã thêm hai phần tử {{SVGElement("rect")}} với thuộc tính filter; đây là nơi các bộ lọc sẽ được hiển thị.

```html
<svg viewBox="0 0 420 120" xmlns="http://www.w3.org/2000/svg">
  <filter id="flood1">
    <feFlood flood-color="seagreen" />
  </filter>
  <filter id="flood2">
    <feFlood flood-color="seagreen" />
  </filter>

  <rect id="r1" filter="url(#flood1)" />
  <rect id="r2" filter="url(#flood2)" />
</svg>
```

#### CSS

Chúng ta xác định kích thước và vị trí của các `<rect>` bằng các thuộc tính CSS {{cssxref("height")}}, {{cssxref("width")}}, {{cssxref("x")}} và {{cssxref("y")}}:

```css
rect {
  width: 100px;
  height: 100px;
  x: 10px;
  y: 10px;
}
#r2 {
  x: 150px;
}
```

Sau đó chúng ta áp dụng các giá trị màu flood khác nhau cho các phần tử `<feFlood>` bằng thuộc tính CSS `flood-color`. Chúng ta sử dụng màu có tên và màu thập lục phân 3 chữ số, nhưng có thể dùng bất kỳ cú pháp màu CSS hợp lệ nào:

```css
#flood1 feFlood {
  flood-color: rebeccapurple;
}
#flood2 feFlood {
  flood-color: #ff3366;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the color of a filters flood", "300", "220")}}

Các thuộc tính đã xác định các hình vuông là seagreen, nhưng các giá trị này đã bị ghi đè bởi các giá trị CSS `flood-color`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("flood-opacity")}}
- {{cssxref("color")}}
- {{cssxref("fill")}}
- {{cssxref("lighting-color")}}
- {{cssxref("stop-color")}}
- {{cssxref("stroke")}}
- {{cssxref("box-shadow")}}
- {{cssxref("text-shadow")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- {{cssxref("filter-function")}}
- Thuộc tính SVG {{SVGAttr("flood-color")}}
