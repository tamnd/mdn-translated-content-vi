---
title: x
slug: Web/CSS/Reference/Properties/x
page-type: css-property
browser-compat: css.properties.x
sidebar: cssref
---

Thuộc tính **`x`** của [CSS](/vi/docs/Web/CSS) xác định tọa độ trục x của góc trên bên trái của hình dạng SVG {{SVGElement("rect")}}, hình ảnh {{SVGElement("image")}}, khung nhìn {{SVGElement("foreignObject")}} hoặc khung nhìn {{SVGElement("svg")}} lồng nhau so với [hệ tọa độ](/vi/docs/Web/API/CSSOM_view_API/Coordinate_systems) người dùng của tổ tiên `<svg>` gần nhất. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("x")}} của phần tử.

> [!NOTE]
> Thuộc tính `x` chỉ áp dụng cho các phần tử {{SVGElement("rect")}}, {{SVGElement("image")}}, {{SVGElement("foreignObject")}} và {{SVGElement("svg")}} được lồng trong một {{SVGElement("svg")}}. Nó không có hiệu lực trên chính các phần tử `<svg>` ở ngoài cùng, và không áp dụng cho các phần tử SVG khác, phần tử HTML hoặc phần tử giả.

## Cú pháp

```css
/* Giá trị độ dài và phần trăm */
x: 40px;
x: 40%;

/* Giá trị toàn cục */
x: inherit;
x: initial;
x: revert;
x: revert-layer;
x: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} biểu thị vị trí tọa độ trục x của góc trên bên trái của vùng chứa phần tử SVG.

- {{cssxref("length")}}
  - : Là một độ dài tuyệt đối hoặc tương đối, nó có thể được biểu thị bằng bất kỳ đơn vị nào được phép bởi kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}.

- {{cssxref("percentage")}}
  - : Phần trăm tham chiếu đến chiều rộng của {{SVGAttr("viewBox")}} SVG, nếu được khai báo, nếu không, phần trăm tham chiếu đến chiều rộng của khung nhìn SVG hiện tại.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Định nghĩa tọa độ trục x của các hình dạng SVG

Ví dụ này minh họa trường hợp sử dụng cơ bản của `x`, và cách thuộc tính CSS `x` được ưu tiên hơn thuộc tính `x`.

#### HTML

Chúng ta gồm bốn phần tử SVG `<rect>` giống hệt nhau; giá trị thuộc tính `x` và {{SVGAttr("y")}} của chúng đều là `10`, nghĩa là bốn hình chữ nhật đều ở cùng một vị trí, cách `10px` từ góc trên và bên trái của khung nhìn SVG.

```html
<svg xmlns="http://www.w3.org/2000/svg">
  <rect width="100" height="100" x="10" y="10" />
  <rect width="100" height="100" x="10" y="10" />
  <rect width="100" height="100" x="10" y="10" />
  <rect width="100" height="100" x="10" y="10" />
</svg>
```

#### CSS

Chúng ta tạo kiểu cho tất cả các hình chữ nhật có viền đen và hơi trong suốt, để các hình chữ nhật chồng lên nhau có thể nhìn thấy được. Chúng ta cung cấp cho mỗi hình chữ nhật các giá trị fill và `x` khác nhau.

```css
svg {
  border: 1px solid;
  width: 300px;
}

rect {
  fill: none;
  stroke: black;
  opacity: 0.8;
}

rect:nth-of-type(2) {
  x: 3em;
  fill: red;
}

rect:nth-of-type(3) {
  x: 180px;
  fill: yellow;
}

rect:nth-of-type(4) {
  x: 50%;
  fill: orange;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the x-axis coordinate of SVG shapes", "300", "180")}}

Các cạnh trái của hình chữ nhật lần lượt ở `10` (từ thuộc tính), `3em`, `180px` và `50%`. SVG rộng `300px`, vì vậy cạnh trái của hình chữ nhật cuối cùng ở mốc `150px`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("x")}}
- Thuộc tính hình học: `x`, {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("y")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
