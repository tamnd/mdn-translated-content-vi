---
title: cx
slug: Web/CSS/Reference/Properties/cx
page-type: css-property
browser-compat: css.properties.cx
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`cx`** xác định điểm trung tâm trục x của phần tử SVG {{SVGElement("circle")}} hoặc {{SVGElement("ellipse")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("cx")}} của phần tử.

> [!NOTE]
> Mặc dù thuộc tính SVG {{SVGAttr("cx")}} có liên quan đến phần tử SVG {{SVGElement("radialGradient")}}, thuộc tính `cx` chỉ áp dụng cho các phần tử {{SVGElement("circle")}} và {{SVGElement("ellipse")}} được lồng trong {{SVGElement("svg")}}. Nó không áp dụng cho `<radialGradient>` hoặc các phần tử SVG khác, cũng không áp dụng cho các phần tử HTML hoặc pseudo-elements.

## Cú pháp

```css
/* giá trị độ dài và phần trăm */
cx: 20px;
cx: 20%;

/* Giá trị toàn cục */
cx: inherit;
cx: initial;
cx: revert;
cx: revert-layer;
cx: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} biểu thị trung tâm nằm ngang của hình tròn hoặc hình elip.

- {{cssxref("length")}}
  - : Là độ dài tuyệt đối hoặc tương đối, có thể biểu thị bằng bất kỳ đơn vị nào được phép trong kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}. Các giá trị âm không hợp lệ.

- {{cssxref("percentage")}}
  - : Tỷ lệ phần trăm tham chiếu đến chiều rộng của khung nhìn SVG hiện tại.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định tọa độ trục x của hình tròn và hình elip

Ví dụ này minh họa cách sử dụng cơ bản của `cx`, và cách thuộc tính CSS `cx` ưu tiên hơn thuộc tính `cx`.

#### HTML

Chúng ta bao gồm hai phần tử `<circle>` giống nhau và hai phần tử `<ellipse>` giống nhau trong một SVG; giá trị thuộc tính `cx` của chúng lần lượt là `50` và `150`.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="30" />
  <circle cx="50" cy="50" r="30" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
</svg>
```

#### CSS

Với CSS, chúng ta chỉ tạo kiểu cho hình tròn đầu tiên và hình elip đầu tiên, cho phép các hình đôi của chúng sử dụng kiểu mặc định (với ({{cssxref("fill")}} mặc định là màu đen). Chúng ta sử dụng thuộc tính `cx` để ghi đè giá trị của thuộc tính SVG {{SVGAttr("cx")}} và cũng đặt `fill` và {{cssxref("stroke")}} để phân biệt các hình đầu tiên trong mỗi cặp với các hình đôi của chúng. Trình duyệt hiển thị ảnh SVG với chiều rộng `300px` và chiều cao `150px` theo mặc định.

```css
svg {
  border: 1px solid;
}

circle:first-of-type {
  cx: 30px;
  fill: lightgreen;
  stroke: black;
}
ellipse:first-of-type {
  cx: 180px;
  fill: pink;
  stroke: black;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the x-axis coordinate of a circle and ellipse", "300", "180")}}

Trung tâm hình tròn được tạo kiểu cách cạnh trái của khung nhìn SVG `30px` và hình elip được tạo kiểu cách cạnh đó `180px`, như được xác định trong các giá trị thuộc tính CSS `cx`. Các trung tâm hình không được tạo kiểu cách cạnh trái của khung nhìn SVG `50px` và `150px`, như được xác định trong các giá trị thuộc tính SVG `cx` của chúng.

### Tọa độ trục x dưới dạng giá trị phần trăm

Ví dụ này minh họa cách sử dụng giá trị phần trăm cho `cx`.

#### HTML

Chúng ta sử dụng cùng markup với ví dụ trước.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="30" />
  <circle cx="50" cy="50" r="30" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
</svg>
```

#### CSS

Chúng ta sử dụng CSS tương tự ví dụ trước. Sự khác biệt duy nhất là giá trị thuộc tính CSS `cx`; trong trường hợp này, chúng ta sử dụng giá trị phần trăm `30%` cho `<circle>` và `80%` cho `<ellipse>`.

```css
svg {
  border: 1px solid;
}

circle:first-of-type {
  cx: 30%;
  fill: lightgreen;
  stroke: black;
}
ellipse:first-of-type {
  cx: 80%;
  fill: pink;
  stroke: black;
}
```

#### Kết quả

{{EmbedLiveSample("x-axis coordinates as percentage values", "300", "180")}}

Khi sử dụng giá trị phần trăm cho `cx`, các giá trị tương đối với chiều rộng của khung nhìn SVG. Ở đây, tọa độ trục x của trung tâm hình tròn và hình elip được tạo kiểu lần lượt là `30%` và `80%` chiều rộng của khung nhìn SVG hiện tại. Vì chiều rộng mặc định là `300px`, các giá trị `cx` là `90px` và `240px` tính từ cạnh trái của khung nhìn SVG.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("cx")}}
- Thuộc tính hình học: `cx`, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
