---
title: fill-opacity
slug: Web/CSS/Reference/Properties/fill-opacity
page-type: css-property
browser-compat: css.properties.fill-opacity
sidebar: cssref
---

Thuộc tính **`fill-opacity`** trong [CSS](/vi/docs/Web/CSS) xác định độ mờ của thao tác vẽ (màu sắc, gradient, mẫu, v.v.) được áp dụng cho các hình dạng SVG hoặc các phần tử nội dung văn bản để tô màu phần tử. Thuộc tính chỉ xác định độ mờ của `fill` của phần tử; nó không ảnh hưởng đến nét vẽ. Nếu có, nó ghi đè thuộc tính {{SVGAttr("fill-opacity")}} của phần tử.

> [!NOTE]
> Thuộc tính `fill-opacity` chỉ áp dụng cho các phần tử {{SVGElement("circle")}}, {{SVGElement("ellipse")}}, {{SVGElement("path")}}, {{SVGElement("polygon")}}, {{SVGElement("polyline")}}, {{SVGElement("rect")}}, {{SVGElement("text")}}, {{SVGElement("textPath")}}, và {{SVGElement("tspan")}} được lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hoặc pseudo-element khác.

## Cú pháp

```css
/* Giá trị số và phần trăm */
fill-opacity: 0.2;
fill-opacity: 20%;

/* Giá trị toàn cục */
fill-opacity: inherit;
fill-opacity: initial;
fill-opacity: revert;
fill-opacity: revert-layer;
fill-opacity: unset;
```

### Giá trị

Các giá trị {{cssxref("number")}} và {{cssxref("percentage")}} biểu thị độ mờ của `fill` của phần tử.

- {{cssxref("number")}}
  - : Giá trị số từ `0` đến `1`, bao gồm cả hai đầu.

- {{cssxref("percentage")}}
  - : Giá trị phần trăm từ `0%` đến `100%`, bao gồm cả hai đầu.

Với `0` hoặc `0%`, phần tử hoàn toàn trong suốt. Với `1` hoặc `100%`, phần tử hoàn toàn mờ đục. Với các giá trị ở giữa, phần tử là bán trong suốt, với nội dung phía sau phần tử có thể nhìn thấy.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định độ mờ fill của các phần tử SVG

Ví dụ này minh họa trường hợp sử dụng cơ bản của `fill-opacity`, cách thuộc tính CSS `fill-opacity` có quyền ưu tiên hơn thuộc tính `fill-opacity` và không có hiệu lực trên bất kỳ `stroke` nào được áp dụng cho hình dạng.

#### HTML

Chúng ta bao gồm một số phần tử đồ họa SVG khác nhau và đặt thuộc tính `fill-opacity` của mỗi phần tử thành `1` (trừ `line`), có nghĩa là fill của mỗi phần tử là mờ đục. Thuộc tính SVG `fill-opacity` không áp dụng cho {{SVGElement("line")}}.

```html
<svg viewBox="0 0 100 150" xmlns="http://www.w3.org/2000/svg">
  <rect x="10" y="10" width="30" height="30" fill-opacity="1" />
  <rect x="60" y="10" rx="10" ry="10" width="30" height="30" fill-opacity="1" />
  <circle cx="25" cy="75" r="20" fill-opacity="1" />
  <ellipse cx="75" cy="75" rx="20" ry="10" fill-opacity="1" />
  <line x1="50" x2="90" y1="40" y2="60" stroke="black" stroke-width="5" />
  <polyline
    points="60 90 65 100 70 95 75 110 80 105 85 120 90 115 95 130 100 125"
    fill-opacity="1" />
  <path d="M20,130 Q40,105 50,130 T90,130" fill-opacity="1" />
</svg>
```

#### CSS

Với CSS, chúng ta sử dụng thuộc tính `fill-opacity` để ghi đè giá trị của thuộc tính SVG {{SVGAttr("fill-opacity")}}, cho mỗi phần tử SVG một giá trị khác nhau.

Chúng ta thêm {{cssxref("stroke")}} vào hình tròn và hình elip, để minh họa rằng độ mờ của nét vẽ không bị ảnh hưởng bởi thuộc tính `fill-opacity`.

Các kiểu SVG khác được đặt, bao gồm hình nền để độ mờ của mỗi phần tử dễ nhìn hơn. Những điều này không được hiển thị để ngắn gọn.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  background: repeating-linear-gradient(
    to bottom right,
    transparent 0 10px,
    #cccccc 10px 11px
  );
}
```

```css
svg > * {
  fill: black;
}
rect:last-of-type {
  fill-opacity: 0.1;
}
circle {
  fill-opacity: 0.6;
}
ellipse {
  fill-opacity: 40%;
}
line {
  fill-opacity: 10%;
}
polyline {
  fill-opacity: 50%;
}
path {
  fill-opacity: 0.5;
}

circle,
ellipse {
  stroke: black;
  stroke-width: 3px;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the fill opacity of SVG elements", "300", "360")}}

Chỉ có hai phần tử hoàn toàn mờ đục: hình chữ nhật đầu tiên và đường thẳng. Hình chữ nhật đầu tiên không khớp với bất kỳ bộ chọn nào, vì vậy không có CSS nào được áp dụng và `fill` hoàn toàn mờ đục. `line` khớp với `fill-opacity: 10%`. Tuy nhiên, đường thẳng không có thao tác vẽ `fill` - chỉ có `stroke` mới hiển thị - vì vậy khai báo không có hiệu lực.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("fill-opacity")}}
- Thuộc tính trình bày: `fill-opacity`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-rule")}}, {{cssxref("fill")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-color")}}, {{cssxref("stop-opacity")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
- {{cssxref("opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
