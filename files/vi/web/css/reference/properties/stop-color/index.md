---
title: stop-color
slug: Web/CSS/Reference/Properties/stop-color
page-type: css-property
browser-compat: css.properties.stop-color
sidebar: cssref
---

Thuộc tính **`stop-color`** của [CSS](/vi/docs/Web/CSS) xác định màu sắc để sử dụng cho phần tử SVG {{SVGElement("stop")}} bên trong một gradient. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stop-color")}} của phần tử.

> [!NOTE]
> Thuộc tính `stop-color` chỉ áp dụng cho các phần tử {{SVGElement('stop')}} được lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các SVG, HTML hay phần tử giả khác.

## Cú pháp

```css
/* Giá trị <color> */
stop-color: red;
stop-color: hsl(120deg 75% 25% / 60%);
stop-color: currentColor;

/* Giá trị toàn cục */
stop-color: inherit;
stop-color: initial;
stop-color: revert;
stop-color: revert-layer;
stop-color: unset;
```

### Giá trị

- {{cssxref("color_value", "&lt;color>")}}
  - : Màu của phần tô. Có thể là bất kỳ giá trị CSS {{cssxref("color_value", "&lt;color>")}} hợp lệ nào.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntaxRaw(`stop-color = <color>`)}}

## Ví dụ

### Xác định điểm dừng màu của gradient SVG

Ví dụ này trình bày trường hợp sử dụng cơ bản của `stop-color`, và cách thuộc tính CSS `stop-color` được ưu tiên hơn thuộc tính `stop-color`.

#### HTML

Chúng ta có một SVG với ba hình vuông {{SVGElement("rect")}} và ba phần tử {{SVGElement("linearGradient")}}. Mỗi gradient có bốn phần tử {{SVGElement("stop")}} tạo ra các gradient từ đen sang trắng rồi từ trắng sang xám; sự khác biệt duy nhất giữa chúng là giá trị `id`.

```html
<svg viewBox="0 0 264 100" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="myGradient1">
      <stop offset="25%" stop-color="black" />
      <stop offset="40%" stop-color="white" />
      <stop offset="60%" stop-color="white" />
      <stop offset="75%" stop-color="#333333" />
    </linearGradient>
    <linearGradient id="myGradient2">
      <stop offset="25%" stop-color="black" />
      <stop offset="40%" stop-color="white" />
      <stop offset="60%" stop-color="white" />
      <stop offset="75%" stop-color="#333333" />
    </linearGradient>
    <linearGradient id="myGradient3">
      <stop offset="25%" stop-color="black" />
      <stop offset="40%" stop-color="white" />
      <stop offset="60%" stop-color="white" />
      <stop offset="75%" stop-color="#333333" />
    </linearGradient>
  </defs>
  <rect x="2" y="10" width="80" height="80" fill="url('#myGradient1')" />
  <rect x="92" y="10" width="80" height="80" fill="url('#myGradient2')" />
  <rect x="182" y="10" width="80" height="80" fill="url('#myGradient3')" />
</svg>
```

#### CSS

Chúng ta bao gồm {{cssxref("stroke")}} và {{cssxref("stroke-width")}} để tạo đường viền cho hình chữ nhật. Chúng ta xác định màu của điểm dừng đầu tiên và cuối cùng trong mỗi gradient, ghi đè giá trị thuộc tính `stop-color` của chúng, bằng cách sử dụng thuộc tính `stop-color`. Các cú pháp CSS {{cssxref("color_value", "&lt;color>")}} khác nhau được hiển thị.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  margin-bottom: 10px;
}
```

```css
rect {
  stroke: #333333;
  stroke-width: 1px;
}

#myGradient1 {
  stop:first-of-type {
    stop-color: #66ccff;
  }
  stop:last-of-type {
    stop-color: #f4aab9;
  }
}
#myGradient2 {
  stop:first-of-type {
    stop-color: yellow;
  }
  stop:last-of-type {
    stop-color: purple;
  }
}
#myGradient3 {
  stop:first-of-type {
    stop-color: hsl(0deg 90% 50%);
  }
  stop:last-of-type {
    stop-color: hsl(20deg 60% 50%);
  }
}
```

#### Kết quả

{{EmbedLiveSample("Defining the color stops of SVG gradients", "300", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("stop-color")}}
- Thuộc tính trình bày: `stop-color`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-opacity")}}, {{cssxref("fill-rule")}}, {{cssxref("fill")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-opacity")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
- {{cssxref("opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
