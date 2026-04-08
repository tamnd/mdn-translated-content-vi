---
title: lighting-color
slug: Web/CSS/Reference/Properties/lighting-color
page-type: css-property
browser-compat: css.properties.lighting-color
sidebar: cssref
---

Thuộc tính **`lighting-color`** trong [CSS](/vi/docs/Web/CSS) xác định màu sắc của nguồn sáng cho các bộ lọc SVG {{SVGElement("feDiffuseLighting")}} và {{SVGElement("feSpecularLighting")}} trong một {{SVGElement("filter")}} SVG. Nếu có, nó ghi đè thuộc tính {{SVGAttr("lighting-color")}} của phần tử.

> [!NOTE]
> Thuộc tính `lighting-color` chỉ áp dụng cho các phần tử {{SVGElement("feDiffuseLighting")}} và {{SVGElement("feSpecularLighting")}} lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hay phần tử giả khác.

## Cú pháp

```css
/* Giá trị <color> */
lighting-color: red;
lighting-color: hsl(120deg 75% 25% / 60%);
lighting-color: currentColor;

/* Giá trị toàn cục */
lighting-color: inherit;
lighting-color: initial;
lighting-color: revert;
lighting-color: revert-layer;
lighting-color: unset;
```

### Giá trị

- {{cssxref("color_value", "&lt;color>")}}
  - : Màu sắc của ánh sáng. Đây có thể là bất kỳ giá trị {{cssxref("color_value", "&lt;color>")}} CSS hợp lệ nào.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định màu của bộ lọc ánh sáng

Ví dụ này minh họa trường hợp sử dụng cơ bản của `lighting-color`, và cách thuộc tính CSS `lighting-color` được ưu tiên hơn thuộc tính `lighting-color`.

#### HTML

Chúng ta có một SVG với hai phần tử {{SVGElement("filter")}}, một với `<feDiffuseLighting>` và một với `<feSpecularLighting>` là phần tử con. Mỗi phần tử bao gồm thuộc tính SVG `lighting-color` xác định màu ánh sáng là `red`. Cả hai phần tử con này đều có một {{SVGElement("fePointLight")}}, phần tử con bắt buộc đặt nguồn sáng. Chúng ta đã thêm hai phần tử {{SVGElement("rect")}} với thuộc tính filter; đây là nơi các bộ lọc sẽ được hiển thị.

```html
<svg viewBox="0 0 420 120" xmlns="http://www.w3.org/2000/svg">
  <filter id="flood1">
    <feDiffuseLighting lighting-color="red">
      <fePointLight x="75" y="30" z="10" />
    </feDiffuseLighting>
  </filter>
  <filter id="flood2">
    <feSpecularLighting specularExponent="5" lighting-color="red">
      <fePointLight x="225" y="75" z="5" />
    </feSpecularLighting>
  </filter>

  <rect id="r1" filter="url(#flood1)" />
  <rect id="r2" filter="url(#flood2)" />
</svg>
```

#### CSS

Chúng ta xác định kích thước và vị trí của các `<rect>` bằng thuộc tính CSS {{cssxref("height")}}, {{cssxref("width")}}, {{cssxref("x")}}, và {{cssxref("y")}}. Chúng ta cũng thêm hình nền cho SVG để làm cho độ trong suốt alpha của màu rõ ràng hơn:

```css
svg {
  background-image: repeating-linear-gradient(
    45deg,
    transparent 0 9px,
    #cccccc 0px 10px
  );
}

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

Sau đó chúng ta áp dụng các giá trị màu ánh sáng khác nhau cho các phần tử con của bộ lọc bằng thuộc tính CSS `lighting-color`. Chúng ta sử dụng màu có tên và màu thập lục phân 3 chữ số, nhưng có thể sử dụng bất kỳ cú pháp màu CSS hợp lệ nào:

```css
feDiffuseLighting {
  lighting-color: blue;
}

feSpecularLighting {
  lighting-color: #ff0099;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the color of filter lighting", "300", "220")}}

Các thuộc tính đã xác định màu của cả hai bộ lọc ánh sáng là `red`, nhưng các giá trị này bị ghi đè bởi các giá trị CSS `lighting-color`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("color")}}
- {{cssxref("fill")}}
- {{cssxref("flood-color")}}
- {{cssxref("stop-color")}}
- {{cssxref("stroke")}}
- {{cssxref("flood-opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- {{cssxref("filter-function")}}
- Thuộc tính SVG {{SVGAttr("lighting-color")}}
