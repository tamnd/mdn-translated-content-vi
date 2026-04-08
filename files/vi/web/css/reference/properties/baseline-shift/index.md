---
title: baseline-shift
slug: Web/CSS/Reference/Properties/baseline-shift
page-type: css-property
browser-compat: css.properties.baseline-shift
sidebar: cssref
---

Thuộc tính **`baseline-shift`** [CSS](/en-US/docs/Web/CSS) dịch chuyển đường cơ sở chủ đạo của một phần tử văn bản so với đường cơ sở chủ đạo của phần tử văn bản cha. Phần tử được dịch chuyển có thể là chỉ số trên hoặc chỉ số dưới. Nếu thuộc tính có mặt, giá trị của nó sẽ ghi đè thuộc tính SVG {{SVGAttr("baseline-shift")}} của phần tử.

> [!NOTE]
> Thuộc tính `baseline-shift` chỉ áp dụng cho các phần tử {{SVGElement("textPath")}} và {{SVGElement("tspan")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG, HTML hoặc pseudo-element khác.

## Cú pháp

```css
/* Giá trị <length-percentage> */
baseline-shift: -0.5px;
baseline-shift: 4%;

/* Giá trị từ khóa */
baseline-shift: sub;
baseline-shift: super;

/* Giá trị toàn cục */
baseline-shift: inherit;
baseline-shift: initial;
baseline-shift: revert;
baseline-shift: revert-layer;
baseline-shift: unset;
```

### Giá trị

- `sub`
  - : Đường cơ sở chủ đạo được dịch chuyển đến vị trí mặc định cho chỉ số dưới.
- `super`
  - : Đường cơ sở chủ đạo được dịch chuyển đến vị trí mặc định cho chỉ số trên.
- `<length-percentage>`
  - : Nâng lên (nếu dương) hoặc hạ xuống (nếu âm) đường cơ sở chủ đạo của phần tử văn bản theo độ dài hoặc phần trăm đã chỉ định, với phần trăm tính tương đối so với {{cssxref("line-height")}} của đường cơ sở chủ đạo của phần tử văn bản cha.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng giá trị từ khóa

Ví dụ này minh họa cách dùng cơ bản của các giá trị từ khóa `sub` và `super` của thuộc tính `baseline-shift`, cũng như cách thuộc tính CSS `baseline-shift` ưu tiên hơn thuộc tính SVG `baseline-shift`.

#### HTML

Chúng ta định nghĩa một SVG với hai phần tử {{SVGElement("text")}} SVG, mỗi phần tử chứa một phần tử {{SVGElement("tspan")}} với thuộc tính SVG {{SVGAttr("baseline-shift")}} được đặt trên đó.

```html hidden
<p>Original SVG</p>
```

```html
<svg viewBox="0 0 500 120" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="50">
    Ceci
    <tspan baseline-shift="super">n'est pas</tspan>
    une pipe super!
  </text>
  <text x="10" y="90">
    Ceci
    <tspan baseline-shift="sub">n'est pas</tspan>
    une pipe sub!
  </text>
</svg>
```

```html hidden
<p><code>baseline-shift: sub;</code></p>
<svg viewBox="0 0 500 120" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="50">
    Ceci
    <tspan baseline-shift="super">n'est pas</tspan>
    une pipe super!
  </text>
  <text x="10" y="90">
    Ceci
    <tspan baseline-shift="sub">n'est pas</tspan>
    une pipe sub!
  </text>
</svg>
<p><code>baseline-shift: super;</code></p>
<svg viewBox="0 0 500 120" xmlns="http://www.w3.org/2000/svg">
  <text x="10" y="50">
    Ceci
    <tspan baseline-shift="super">n'est pas</tspan>
    une pipe super!
  </text>
  <text x="10" y="90">
    Ceci
    <tspan baseline-shift="sub">n'est pas</tspan>
    une pipe sub!
  </text>
</svg>
```

SVG được lặp lại ba lần; chúng tôi chỉ hiển thị một bản sao cho ngắn gọn.

#### CSS

Chúng ta làm cho chữ trong cả ba hình SVG lớn và cursive, thêm màu để phân biệt nội dung bên trong các phần tử `<tspan>`.

Chúng ta đặt giá trị thuộc tính `baseline-shift` thành `sub` trên phần tử `<tspan>` của SVG thứ hai và `super` trên SVG thứ ba. SVG đầu tiên không có CSS bổ sung nào được áp dụng.

```css
text {
  font-family: cursive;
  font-size: 2rem;
}
[baseline-shift="sub"] {
  fill: deeppink;
}
[baseline-shift="super"] {
  fill: rebeccapurple;
}

svg:nth-of-type(2) tspan {
  baseline-shift: sub;
}
svg:nth-of-type(3) tspan {
  baseline-shift: super;
}
```

```css hidden
svg {
  border: 1px solid;
  width: 15em;
  margin-bottom: 10px;
}
@supports not (baseline-shift: sub) {
  body::before {
    content: "Your browser doesn't support the `baseline-shift` property.";
    background-color: wheat;
    display: block;
    width: 100%;
    text-align: center;
    padding: 0.5em;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using keyword values", "300", "370")}}

Các giá trị thuộc tính SVG `baseline-shift` được dùng trong SVG đầu tiên. Trong SVG thứ hai và thứ ba, các giá trị CSS `baseline-shift` ghi đè các giá trị thuộc tính.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("baseline-shift")}}
- Các thuộc tính trình bày: `baseline-shift`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-opacity")}}, {{cssxref("fill-rule")}}, {{cssxref("fill")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-color")}}, {{cssxref("stop-opacity")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
