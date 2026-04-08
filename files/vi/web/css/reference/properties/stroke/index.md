---
title: stroke
slug: Web/CSS/Reference/Properties/stroke
page-type: css-property
browser-compat: css.properties.stroke
sidebar: cssref
---

Thuộc tính **`stroke`** của [CSS](/vi/docs/Web/CSS) xác định màu sắc hoặc máy chủ vẽ SVG được dùng để vẽ nét viền của phần tử. Do đó, `stroke` chỉ có hiệu lực trên các phần tử có thể được tô nét viền (ví dụ như {{SVGElement('rect')}} hay {{SVGElement('ellipse')}}); xem trang thuộc tính SVG {{SVGAttr('stroke')}} để có danh sách đầy đủ. Khi được khai báo, giá trị CSS sẽ ghi đè bất kỳ giá trị nào của thuộc tính SVG {{SVGAttr("stroke")}} của phần tử.

> [!NOTE]
> Theo bản nháp ngày 4 tháng 4 năm 2017 của thông số [CSS Fill and Stroke Module Level 3](https://drafts.csswg.org/fill-stroke-3/#stroke-shorthand), thuộc tính `stroke` là viết tắt của một số thuộc tính nét viền khác. Trên thực tế, tính đến tháng 8 năm 2024, các trình duyệt không hỗ trợ việc đặt các giá trị liên quan đến nét viền khác như độ rộng hay mẫu dấu gạch thông qua thuộc tính `stroke`, mà thay vào đó xử lý nó như một tương đương trực tiếp của thuộc tính SVG {{SVGAttr("stroke")}}.

## Cú pháp

```css
/* Các giá trị màu khác nhau */
stroke: rgb(153 51 102 / 1);
stroke: color-mix(in lch, var(--primaryColor) 35%, gray 15%));
stroke: dodgerblue;
stroke: currentColor;
stroke: transparent;
stroke: context-stroke;

/* Giá trị toàn cục */
stroke: inherit;
stroke: initial;
stroke: revert;
stroke: revert-layer;
stroke: unset;
```

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Đặt việc vẽ nét viền bằng bất kỳ giá trị màu CSS hợp lệ nào.

- `<image>`
  - : Đặt việc vẽ nét viền bằng những gì SVG gọi là [_máy chủ vẽ_](https://svgwg.org/svg2-draft/pservers.html), trong ngữ cảnh này là gradient hoặc mẫu SVG. Gradient CSS không thể được dùng với thuộc tính `stroke`.

- `context-stroke`
  - : Khiến phần tử "kế thừa" định nghĩa nét viền của nó từ [_phần tử ngữ cảnh_](https://svgwg.org/svg2-draft/painting.html#TermContextElement) của nó. Nếu không có phần tử ngữ cảnh hợp lệ, giá trị này sẽ dẫn đến việc không sử dụng màu nào cho nét viền.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Tô nét viền màu cơ bản

Trong ví dụ này, chúng ta tạo hai hình dạng khác nhau, một hình tròn và một hình chữ nhật, là một phần của {{SVGElement("g")}} (nhóm) có màu nét viền xám làm mặc định cho hai hình dạng.

```html
<svg>
  <g fill="none" stroke="gray" stroke-width="10">
    <circle cx="100" cy="100" r="40" />
    <rect x="20" y="20" width="80" height="80" />
  </g>
</svg>
```

Thông qua CSS, chúng ta sau đó áp dụng màu tím nhạt cho hình chữ nhật và màu đỏ cho hình tròn.

```css
rect {
  stroke: rebeccapurple;
}
circle {
  stroke: red;
}
```

{{EmbedLiveSample("Basic color stroking", "300", "180")}}

### Tô nét viền theo mẫu

Ví dụ này sử dụng cùng nhóm và hình dạng (với hình tròn di chuyển một chút) như ví dụ trước, nhưng cũng có một mẫu SVG được xác định.

```html
<svg>
  <g fill="none" stroke="gray" stroke-width="23">
    <circle cx="150" cy="90" r="40" />
    <rect x="20" y="20" width="80" height="80" />
  </g>
  <defs>
    <pattern id="star" viewBox="0,0,10,10" width="10%" height="10%">
      <polygon points="0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2" />
    </pattern>
  </defs>
</svg>
```

Mẫu sau đó được tham chiếu trong CSS với giá trị URL trỏ đến ID của mẫu. Mẫu này được áp dụng cho cả hai hình dạng như màu vẽ nét viền, với kết quả được hiển thị.

```css
rect,
circle {
  stroke: url("#star");
}
```

Mẫu được vẽ tương đối so với hộp bao của các hình dạng, điều này có thể dẫn đến sự nhiễu giao thoa hình ảnh ở nơi chúng chồng lên nhau, vì các phần của mẫu là trong suốt.

{{EmbedLiveSample("Pattern stroking", "300", "180")}}

### Gradient SVG so với CSS

Ở đây, chúng ta một lần nữa sử dụng cùng đánh dấu nhóm-và-hình-dạng như ví dụ đầu tiên, nhưng cũng thêm định nghĩa cho một gradient SVG.

```html
<svg>
  <g fill="none" stroke="gray" stroke-width="10">
    <circle cx="100" cy="100" r="40" />
    <rect x="20" y="20" width="80" height="80" />
  </g>
  <defs>
    <linearGradient id="greenwhite">
      <stop offset="0%" stop-color="green" />
      <stop offset="100%" stop-color="white" />
    </linearGradient>
  </defs>
</svg>
```

Trong CSS, chúng ta áp dụng gradient SVG đó cho hình chữ nhật bằng giá trị URL trỏ đến ID của gradient tuyến tính. Cho hình tròn, chúng ta áp dụng gradient tuyến tính CSS tương đương về mục đích với gradient SVG.

```css
rect {
  stroke: url("#greenwhite");
}
circle {
  stroke: linear-gradient(90deg, green, white);
}
```

Chỉ hình chữ nhật nhận được nét viền gradient, trong khi hình tròn quay lại nét viền xám được đặt bởi phần tử nhóm. Điều này xảy ra vì gradient CSS không phải là giá trị hợp lệ cho thuộc tính `stroke`, trong khi tham chiếu URL đến gradient SVG được phép.

{{EmbedLiveSample("SVG versus CSS gradients", "300", "180")}}

### Tô nét viền theo ngữ cảnh

Trong trường hợp này, chúng ta một lần nữa bắt đầu với phần tử nhóm, bên trong đó hai đường dẫn hình chữ nhật được xác định. Sau đó, một gradient tuyến tính và một điểm đánh dấu SVG được xác định.

```html
<svg>
  <g fill="none" stroke="gray" stroke-width="4">
    <path d="M 20,20 l 180,0 0,100 -180,0 z" />
    <path d="M 100,40 l 180,0 0,100 -180,0 z" />
  </g>
  <defs>
    <linearGradient id="orangered">
      <stop offset="0%" stop-color="orange" />
      <stop offset="100%" stop-color="red" />
    </linearGradient>
    <marker
      id="circle"
      markerWidth="20"
      markerHeight="20"
      refX="10"
      refY="10"
      markerUnits="userSpaceOnUse">
      <circle
        cx="10"
        cy="10"
        r="8"
        stroke-width="4"
        stroke="none"
        fill="none" />
    </marker>
  </defs>
</svg>
```

Sau đó chúng ta viết CSS để thêm điểm đánh dấu vào cả hai đường dẫn, và cũng có màu nét viền tím nhạt. Điều này được ghi đè cho đường dẫn thứ hai, được cho giá trị URL để áp dụng gradient từ cam sang đỏ làm nét viền. Cuối cùng, chúng ta đặt phần tử hình tròn trong phần tử điểm đánh dấu có giá trị nét viền là `context-stroke`.

```css
path {
  stroke: rebeccapurple;
  marker: url("#circle");
}
path:nth-of-type(2) {
  stroke: url("#orangered");
}
marker circle {
  stroke: context-stroke;
}
```

Vì `stroke-context` được áp dụng cho một phần tử là con của phần tử {{SVGElement('marker')}}, phần tử ngữ cảnh cho mỗi hình tròn là phần tử gọi đến phần tử `<marker>`; tức là, các phần tử {{SVGElement('path')}}. Kết quả là các điểm đánh dấu trên đường dẫn đầu tiên sử dụng màu của đường dẫn gọi và có màu tím. Các điểm đánh dấu trên đường dẫn thứ hai, ngược lại, sử dụng cùng gradient SVG từ cam sang đỏ mà đường dẫn sử dụng. Trường hợp sau này minh họa cách gradient SVG được áp dụng như một gradient duy nhất cho toàn bộ hình dạng, thay vì được áp dụng độc lập cho từng phần riêng lẻ của hình dạng.

{{EmbedLiveSample("Contextual stroking", "300", "180")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("stroke-dasharray")}}
- {{cssxref("stroke-dashoffset")}}
- {{cssxref("stroke-linecap")}}
- {{cssxref("stroke-linejoin")}}
- {{cssxref("stroke-miterlimit")}}
- {{cssxref("stroke-opacity")}}
- {{cssxref("stroke-width")}}
- {{cssxref("paint-order")}}
- Thuộc tính SVG {{SVGAttr("stroke")}}
