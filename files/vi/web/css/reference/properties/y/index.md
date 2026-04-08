---
title: y
slug: Web/CSS/Reference/Properties/y
page-type: css-property
browser-compat: css.properties.y
sidebar: cssref
---

Thuộc tính **`y`** của [CSS](/vi/docs/Web/CSS) xác định tọa độ trục y của góc trên bên trái của hình dạng SVG {{SVGElement("rect")}}, hình ảnh {{SVGElement("image")}}, khung nhìn {{SVGElement("foreignObject")}} và khung nhìn {{SVGElement("svg")}} lồng nhau so với [hệ tọa độ](/vi/docs/Web/API/CSSOM_view_API/Coordinate_systems) người dùng của tổ tiên `<svg>` gần nhất. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("y")}} của phần tử.

> [!NOTE]
> Thuộc tính `y` chỉ áp dụng cho các phần tử {{SVGElement("rect")}}, {{SVGElement("image")}}, {{SVGElement("foreignObject")}} và {{SVGElement("svg")}} được lồng trong một `<svg>`. Nó không có hiệu lực trên các phần tử `<svg>` ở ngoài cùng và không áp dụng cho các phần tử SVG khác, phần tử HTML hoặc phần tử giả.

## Cú pháp

```css
/* Giá trị độ dài và phần trăm */
y: 10px;
y: 10%;

/* Giá trị toàn cục */
y: inherit;
y: initial;
y: revert;
y: revert-layer;
y: unset;
```

### Giá trị

Các giá trị {{cssxref("length")}} và {{cssxref("percentage")}} biểu thị vị trí tọa độ trục y của góc trên bên trái của phần tử SVG.

- {{cssxref("length")}}
  - : Là một độ dài tuyệt đối hoặc tương đối, nó có thể được biểu thị bằng bất kỳ đơn vị nào được phép bởi kiểu dữ liệu CSS {{cssxref("&lt;length&gt;")}}.

- {{cssxref("percentage")}}
  - : Phần trăm tham chiếu đến chiều cao của {{SVGAttr("viewBox")}} SVG, nếu được khai báo, nếu không, phần trăm tham chiếu đến chiều cao của khung nhìn SVG hiện tại.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Định nghĩa tọa độ trục y của các hình dạng SVG

Ví dụ này minh họa trường hợp sử dụng cơ bản của `y`, và cách thuộc tính CSS `y` được ưu tiên hơn thuộc tính `y`.

#### HTML

Chúng ta gồm bốn phần tử SVG `<rect>` giống hệt nhau; giá trị thuộc tính {{SVGAttr("x")}} và `y` của chúng đều là `10`, nghĩa là bốn hình chữ nhật đều ở cùng một vị trí, cách `10px` từ góc trên và bên trái của khung nhìn SVG.

```html
<svg>
  <rect width="40" height="40" x="10" y="10" />
  <rect width="40" height="40" x="10" y="10" />
  <rect width="40" height="40" x="10" y="10" />
  <rect width="40" height="40" x="10" y="10" />
</svg>
```

#### CSS

Chúng ta tạo kiểu cho tất cả các hình chữ nhật có viền đen và hơi trong suốt, để các hình chữ nhật chồng lên nhau có thể nhìn thấy được. Chúng ta cung cấp cho hình chữ nhật các giá trị {{cssxref("fill")}} và `y` khác nhau.

```css
svg {
  border: 1px solid;
}

rect {
  fill: none;
  stroke: black;
  opacity: 0.8;
}

rect:nth-of-type(2) {
  y: -20px;
  fill: red;
}

rect:nth-of-type(3) {
  y: 4em;
  fill: yellow;
}

rect:nth-of-type(4) {
  y: 60%;
  fill: orange;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the y-axis coordinate of SVG shapes", "300", "180")}}

Các cạnh trên của hình chữ nhật lần lượt ở `10` (từ thuộc tính), `-20px`, `4em` và `60%`. Hình chữ nhật cao `40px`, vì vậy `-20px` đặt một nửa hình chữ nhật đỏ ra ngoài khung nhìn. SVG cao `150px`, vì vậy cạnh trên của hình chữ nhật cam cách `90px` từ đỉnh của khung nhìn SVG.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("y")}}
- Thuộc tính hình học: `y`, {{cssxref("cx")}}, {{cssxref("cy")}}, {{cssxref("r")}}, {{cssxref("rx")}}, {{cssxref("ry")}}, {{cssxref("x")}}, {{cssxref("width")}}, {{cssxref("height")}}
- {{cssxref("fill")}}
- {{cssxref("stroke")}}
- {{cssxref("paint-order")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
