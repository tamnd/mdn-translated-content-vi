---
title: r
slug: Web/CSS/Reference/Properties/r
page-type: css-property
browser-compat: css.properties.r
sidebar: cssref
---

Thuộc tính **`r`** của [CSS](/vi/docs/Web/CSS) xác định bán kính của hình tròn. Nó chỉ có thể được sử dụng với phần tử SVG {{SVGElement("circle")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("r")}} của hình tròn.

> [!NOTE]
> Thuộc tính `r` chỉ áp dụng cho các phần tử {{SVGElement("circle")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho các phần tử SVG khác, phần tử HTML hoặc phần tử giả.

## Cú pháp

```css
/* Giá trị độ dài và phần trăm */
r: 3px;
r: 20%;

/* Giá trị toàn cục */
r: inherit;
r: initial;
r: revert;
r: revert-layer;
r: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} xác định bán kính của hình tròn.

- {{cssxref("length")}}
  - : Các độ dài tuyệt đối hoặc tương đối có thể được biểu thị bằng bất kỳ đơn vị nào được phép bởi kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}. Giá trị âm không hợp lệ.

- {{cssxref("percentage")}}
  - : Phần trăm tham chiếu đến đường chéo chuẩn hóa của viewport SVG hiện tại, được tính là <math><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định bán kính của hình tròn

Trong ví dụ này, chúng ta có hai phần tử `<circle>` giống hệt nhau trong SVG, mỗi phần tử có bán kính `10` và tọa độ trục x và y giống nhau cho điểm tâm của chúng.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="10" />
  <circle cx="50" cy="50" r="10" />
</svg>
```

Với CSS, chúng ta chỉ tạo kiểu cho hình tròn đầu tiên, cho phép hình tròn thứ hai sử dụng kiểu dáng mặc định (với {{cssxref("fill")}} mặc định là đen). Chúng ta dùng thuộc tính `r` để ghi đè giá trị thuộc tính SVG {{SVGAttr("r")}}, đặt `fill` và {{cssxref("stroke")}}. Kích thước mặc định của SVG là `300px` chiều rộng và `150px` chiều cao.

```css
svg {
  border: 1px solid black;
}

circle:first-of-type {
  r: 30px;
  fill: lightgreen;
  stroke: black;
}
```

{{EmbedLiveSample("Defining a circle's radius", "300", "180")}}

### ViewBox so với điểm ảnh viewport

Ví dụ này chứa hai SVG, mỗi SVG có hai phần tử `<circle>`. SVG thứ hai bao gồm thuộc tính `viewBox` để minh họa sự khác biệt giữa SVG viewBox và viewport SVG.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="10" />
  <circle cx="50" cy="50" r="10" />
</svg>
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="10" />
  <circle cx="50" cy="50" r="10" />
</svg>
```

CSS tương tự như ví dụ trước, với `r: 30px` được đặt, nhưng chúng ta đặt {{cssxref("width")}} để đảm bảo cả hai hình ảnh đều rộng `300px`:

```css
svg {
  border: 1px solid black;
  width: 300px;
}

circle:first-of-type {
  r: 30px;
  fill: lightgreen;
  stroke: black;
}
```

{{EmbedLiveSample("ViewBox versus viewport pixels", "300", "360")}}

Vì thuộc tính `viewBox` xác định SVG là 200 điểm ảnh hệ tọa độ SVG chiều rộng, và hình ảnh được phóng to lên `300px`, `30` điểm ảnh tọa độ SVG được thu phóng để kết xuất thành `45` điểm ảnh CSS.

### Xác định bán kính hình tròn bằng phần trăm

Trong ví dụ này, chúng ta sử dụng cùng đánh dấu như ví dụ trước. Sự khác biệt duy nhất là giá trị `r`; trong trường hợp này, chúng ta sử dụng giá trị phần trăm.

```html hidden
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="10" />
  <circle cx="50" cy="50" r="10" />
</svg>
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="10" />
  <circle cx="50" cy="50" r="10" />
</svg>
```

```css
svg {
  border: 1px solid black;
  width: 300px;
}

circle:first-of-type {
  r: 30%;
  fill: lightgreen;
  stroke: black;
}
```

{{EmbedLiveSample("Defining the radius of a circle using percentages", "300", "360")}}

Trong cả hai trường hợp, bán kính hình tròn là `30%` của đường chéo chuẩn hóa của viewport SVG. Bán kính `r` bằng <math><mn>0.3</mn><mo>&#xd7;</mo><mfrac><msqrt><mrow><msup><mi>&lt;width&gt;</mi><mn>2</mn></msup><mo>+</mo><msup><mi>&lt;height&gt;</mi><mn>2</mn></msup></mrow></msqrt><msqrt><mn>2</mn></msqrt></mfrac></math>. Trong khi hình ảnh đầu tiên sử dụng `300` và `150` điểm ảnh CSS còn hình ảnh thứ hai sử dụng `200` và `100` đơn vị viewbox SVG, 30% là giá trị tỷ lệ. Do đó, giá trị `r` giống nhau: `47.43` đơn vị viewBox, giải quyết thành `71.15` điểm ảnh CSS.

Trong khi `r` giống nhau, các điểm tâm khác nhau vì SVG thứ hai được phóng to 50%, đẩy tâm của nó xuống và sang phải 50%.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính hình học: `r`, {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
- Thuộc tính SVG {{SVGAttr("r")}}
