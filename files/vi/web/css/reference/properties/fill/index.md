---
title: fill
slug: Web/CSS/Reference/Properties/fill
page-type: css-property
browser-compat: css.properties.fill
sidebar: cssref
---

Thuộc tính **`fill`** trong [CSS](/vi/docs/Web/CSS) xác định cách nội dung văn bản SVG và vùng canvas bên trong của các hình dạng SVG được tô màu hoặc vẽ. Nếu có, nó ghi đè thuộc tính {{SVGAttr("fill")}} của phần tử.

Các vùng bên trong đường viền của hình dạng SVG hoặc văn bản được tô màu. Những gì là "bên trong" một hình dạng có thể không phải lúc nào cũng rõ ràng. Các đường dẫn xác định một hình dạng có thể chồng lên nhau. Các vùng được coi là "bên trong" các hình dạng phức tạp này được làm rõ bởi thuộc tính {{cssxref("fill-rule")}} hoặc thuộc tính.

Nếu các đường dẫn con là mở, `fill` đóng đường dẫn trước khi tô màu, như thể một lệnh "closepath" được bao gồm để kết nối điểm cuối cùng của đường dẫn con với điểm đầu tiên. Nói cách khác, `fill` áp dụng cho các đường dẫn con mở trong các phần tử `path` (tức là các đường dẫn con không có lệnh closepath) và các phần tử `polyline`.

> [!NOTE]
> Thuộc tính `fill` chỉ áp dụng cho các phần tử {{SVGElement('circle')}}, {{SVGElement('ellipse')}}, {{SVGElement('path')}}, {{SVGElement('polygon')}}, {{SVGElement('polyline')}}, {{SVGElement('rect')}}, {{SVGElement('text')}}, {{SVGElement('textPath')}}, và {{SVGElement('tspan')}} được lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hoặc pseudo-element khác.

## Cú pháp

```css
/* từ khóa */
fill: none;
fill: context-fill;
fill: context-stroke;

/* Giá trị <color> */
fill: red;
fill: hsl(120deg 75% 25% / 60%);

/* Giá trị <url> */
fill: url("#gradientElementID");
fill: url("star.png");

/* <url> với dự phòng */
fill: url("#gradientElementID") blue;
fill: url("star.png") none;

/* Giá trị toàn cục */
fill: inherit;
fill: initial;
fill: revert;
fill: revert-layer;
fill: unset;
```

### Giá trị

- `none`
  - : Không có `fill` nào được vẽ; các vùng bên trong nét vẽ, nếu có, là trong suốt.

- `context-fill`
  - : Sử dụng giá trị vẽ của `fill` từ một phần tử ngữ cảnh.

- `context-stroke`
  - : Sử dụng giá trị vẽ của `stroke` từ một phần tử ngữ cảnh.

- {{cssxref("color_value", "&lt;color>")}}
  - : Màu của fill dưới dạng bất kỳ giá trị {{cssxref("color_value", "&lt;color>")}} CSS hợp lệ nào.

- `<url>`
  - : Tham chiếu URL đến phần tử máy chủ vẽ SVG, chẳng hạn như {{SVGElement("linearGradient")}}, {{SVGElement("radialGradient")}}, hoặc {{SVGElement("pattern")}}. Tham chiếu tài nguyên có thể tùy chọn được theo sau bởi `<color>` hoặc `none`, sẽ được sử dụng làm giá trị dự phòng nếu máy chủ vẽ được tham chiếu không giải quyết được.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định giá trị fill cho các phần tử SVG

Ví dụ này minh họa cách khai báo `fill`, hiệu ứng của thuộc tính, và cách thuộc tính CSS `fill` có quyền ưu tiên hơn thuộc tính `fill`.

#### HTML

Chúng ta có một SVG với hai hình dạng phức tạp được xác định bằng các phần tử SVG {{SVGElement('polygon')}} và {{SVGElement('path')}}. Cả hai đều có thuộc tính `fill` được đặt thành `black` mặc định. Chúng ta thêm nét vẽ màu xám đậm `#666666` bằng thuộc tính SVG {{SVGAttr("stroke")}}.

```html
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <path
    d="M 10,5 l 90,0 -80,80 0,-60 80,80 -90,0 z"
    stroke="#666666"
    fill="black" />
  <polygon
    points="180,10 150,100 220,40 140,40 210,100"
    stroke="#666666"
    fill="black" />
</svg>
```

#### CSS

Chúng ta đặt giá trị `fill` trên các hình dạng trong SVG.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  margin-bottom: 10px;
}
```

```css
path {
  fill: red;
}
polygon {
  fill: hsl(0deg 100% 50% / 60%);
}
```

#### Kết quả

{{EmbedLiveSample("Defining fill values for SVG elements", "300", "170")}}

Giá trị thuộc tính CSS `fill` ghi đè giá trị thuộc tính SVG `fill`, dẫn đến cả hai hình dạng được tô màu đỏ; màu đỏ của hình đa giác là bán trong suốt.

### Sử dụng giá trị từ khóa fill

Ví dụ này minh họa việc sử dụng giá trị từ khóa cho `fill`.

#### HTML

Chúng ta bao gồm ba phần tử {{SVGElement("path")}} và một phần tử {{SVGElement("marker")}} thêm {{SVGElement("circle")}} vào mọi điểm của đường dẫn. Chúng ta đặt marker hình tròn màu đen với fill màu xám bằng các thuộc tính SVG {{SVGAttr("stroke")}} và {{SVGAttr("fill")}}.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 90">
  <path d="M 10 44.64 L 30 10 L 70 10 L 90 44.64 L 70 79.28 L 30 79.28 Z" />
  <path d="M 100 44.64 L 80 10 L 120 10 L 140 44.64 L 120 79.28 L 80 79.28 Z" />
  <path
    d="M 150 44.64 L 130 10 L 170 10 L 190 44.64 L 170 79.28 L 130 79.28 Z" />
  <marker
    id="circle"
    markerWidth="12"
    markerHeight="12"
    refX="6"
    refY="6"
    markerUnits="userSpaceOnUse">
    <circle cx="6" cy="6" r="3" stroke-width="2" stroke="black" fill="grey" />
  </marker>
</svg>
```

#### CSS

Chúng ta đặt màu `stroke` và `fill` khác nhau cho mỗi đường dẫn. Đường dẫn đầu tiên, có viền đỏ, có `fill` được đặt thành `none`. Chúng ta đặt stroke và fill của marker hình tròn theo cùng màu với stroke của phần tử mà chúng đánh dấu, sử dụng giá trị `context-stroke`.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  margin-bottom: 10px;
}
```

```css
path {
  stroke-width: 2px;
  marker: url("#circle");
}
path:nth-of-type(1) {
  stroke: red;
  fill: none;
}
path:nth-of-type(2) {
  stroke: green;
  fill: lightgreen;
}
path:nth-of-type(3) {
  stroke: blue;
  fill: lightblue;
}
circle {
  stroke: context-stroke;
  fill: context-stroke;
}
```

#### Kết quả

{{EmbedLiveSample("Using fill keyword values", "300", "170")}}

Lưu ý cách đường dẫn đầu tiên có nền trong suốt vì `fill` là `none`, ghi đè `fill` mặc định `black`. Các hình tròn được tô màu theo màu của nét vẽ. Nếu bạn thay đổi giá trị thành `context-fill`, các hình tròn sẽ trong suốt, `lightgreen` và `lightblue` thay vì `red`, `green` và `blue`.

### Fill và giá trị dự phòng

Ví dụ này minh họa cách bao gồm giá trị `url()` với giá trị dự phòng làm giá trị `fill`.

#### HTML

Chúng ta có một SVG chứa hai ngôi sao {{SVGElement("polygon")}} và một {{SVGElement("linearGradient")}} từ xanh lá đến vàng đến đỏ.

```html
<svg viewBox="0 0 220 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="myGradient">
      <stop offset="5%" stop-color="green" />
      <stop offset="50%" stop-color="gold" />
      <stop offset="95%" stop-color="red" />
    </linearGradient>
  </defs>
  <polygon points="80,10 50,100 120,40 40,40 110,100" />
  <polygon points="180,10 150,100 220,40 140,40 210,100" />
</svg>
```

#### CSS

Chúng ta đặt giá trị `fill` trên các polygon trong SVG, cung cấp giá trị `url()` và giá trị dự phòng.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  margin-bottom: 10px;
}
```

```css
polygon:first-of-type {
  fill: url("#myGradient") magenta;
}
polygon:last-of-type {
  fill: url("#MISSINGIMAGE") magenta;
}
```

#### Kết quả

{{EmbedLiveSample("Fills and fallbacks", "300", "170")}}

Ngôi sao đầu tiên có gradient làm nền. Ngôi sao thứ hai sử dụng giá trị dự phòng vì phần tử được tham chiếu trong `url()` không tồn tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("fill")}}
- Thuộc tính trình bày: `fill`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-opacity")}}, {{cssxref("fill-rule")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-color")}}, {{cssxref("stop-opacity")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
- {{cssxref("opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
