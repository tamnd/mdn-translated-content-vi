---
title: cy
slug: Web/CSS/Reference/Properties/cy
page-type: css-property
browser-compat: css.properties.cy
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`cy`** xác định điểm trung tâm trục y của phần tử SVG {{SVGElement("circle")}} hoặc {{SVGElement("ellipse")}}. Nếu có, nó ghi đè thuộc tính {{SVGAttr("cy")}} của phần tử.

> [!NOTE]
> Mặc dù phần tử SVG {{SVGElement("radialGradient")}} hỗ trợ thuộc tính {{SVGAttr("cy")}}, thuộc tính `cy` chỉ áp dụng cho các phần tử {{SVGElement("circle")}} và {{SVGElement("ellipse")}} được lồng trong {{SVGElement("svg")}}. Thuộc tính này không áp dụng cho `<radialGradient>` hoặc các phần tử SVG khác, cũng không áp dụng cho các phần tử HTML hoặc pseudo-elements.

## Cú pháp

```css
/* giá trị độ dài và phần trăm */
cy: 3px;
cy: 20%;

/* Giá trị toàn cục */
cy: inherit;
cy: initial;
cy: revert;
cy: revert-layer;
cy: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} biểu thị trung tâm dọc của hình tròn hoặc hình elip.

- {{cssxref("length")}}
  - : Là độ dài tuyệt đối hoặc tương đối, có thể biểu thị bằng bất kỳ đơn vị nào được phép trong kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}. Các giá trị âm không hợp lệ.

- {{cssxref("percentage")}}
  - : Tỷ lệ phần trăm tham chiếu đến chiều cao của khung nhìn SVG hiện tại.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xác định tọa độ trục y của hình tròn và hình elip

Trong ví dụ này, chúng ta có hai phần tử `<circle>` giống nhau và hai phần tử `<ellipse>` giống nhau trong một SVG; giá trị thuộc tính `cy` của chúng lần lượt là `50` và `150`.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="30" />
  <circle cx="50" cy="50" r="30" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
</svg>
```

Với CSS, chúng ta chỉ tạo kiểu cho hình tròn đầu tiên và hình elip đầu tiên, cho phép các hình đôi của chúng sử dụng kiểu mặc định (với ({{cssxref("fill")}} mặc định là màu đen). Chúng ta sử dụng thuộc tính `cy` để ghi đè giá trị của thuộc tính SVG {{SVGAttr("cy")}} và cũng đặt `fill` và {{cssxref("stroke")}} để phân biệt các hình đầu tiên trong mỗi cặp với các hình đôi của chúng. Trình duyệt hiển thị ảnh SVG với chiều rộng `300px` và chiều cao `150px` theo mặc định.

```css
svg {
  border: 1px solid;
}

circle:first-of-type {
  cy: 30px;
  fill: lightgreen;
  stroke: black;
}
ellipse:first-of-type {
  cy: 100px;
  fill: pink;
  stroke: black;
}
```

{{EmbedLiveSample("Defining the y-axis coordinate of a circle and ellipse", "300", "180")}}

Trung tâm hình tròn được tạo kiểu cách cạnh trên của khung nhìn SVG `30px` và hình elip được tạo kiểu cách cạnh đó `100px`, như được xác định trong các giá trị thuộc tính CSS `cy`. Các trung tâm hình không được tạo kiểu đều cách cạnh trên của khung nhìn SVG `50px`, như được xác định trong các giá trị thuộc tính SVG `cy` của chúng.

### Tọa độ trục y dưới dạng giá trị phần trăm

Trong ví dụ này, chúng ta sử dụng cùng markup với ví dụ trước. Sự khác biệt duy nhất là giá trị thuộc tính CSS `cy`; trong trường hợp này, chúng ta sử dụng giá trị phần trăm `30%` và `50%`.

```html hidden
<svg xmlns="http://www.w3.org/2000/svg">
  <circle cx="50" cy="50" r="30" />
  <circle cx="50" cy="50" r="30" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
  <ellipse cx="150" cy="50" rx="20" ry="40" />
</svg>
```

```css
svg {
  border: 1px solid;
}

circle:first-of-type {
  cy: 30%;
  fill: lightgreen;
  stroke: black;
}
ellipse:first-of-type {
  cy: 50%;
  fill: pink;
  stroke: black;
}
```

{{EmbedLiveSample("y-axis coordinates as percentage values", "300", "180")}}

Trong trường hợp này, tọa độ trục y của trung tâm hình tròn và hình elip lần lượt là `30%` và `50%` chiều cao của khung nhìn SVG hiện tại. Vì chiều cao ảnh mặc định là `150px`, nghĩa là giá trị `cy` tương đương với `45px` và `120px`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("cy")}}
- Thuộc tính hình học: `cy`, {{cssxref("cx")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Thuộc tính viết tắt {{cssxref("border-radius")}}
- {{cssxref("gradient/radial-gradient", "radial-gradient")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
