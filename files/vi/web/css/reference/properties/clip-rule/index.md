---
title: clip-rule
slug: Web/CSS/Reference/Properties/clip-rule
page-type: css-property
browser-compat: css.properties.clip-rule
sidebar: cssref
---

Thuộc tính **`clip-rule`** [CSS](/en-US/docs/Web/CSS) xác định, khi các phần của đường dẫn chồng lên nhau, pixel nào trong hộp của mặt nạ nằm bên trong hình dạng cắt được xác định bởi [đường cắt](/en-US/docs/Web/CSS/Reference/Properties/clip-path) và pixel nào nằm bên ngoài.

Thuộc tính `clip-rule` chỉ áp dụng cho các phần tử SVG nằm trong phần tử {{SVGElement("clipPath")}}, ghi đè giá trị thuộc tính {{SVGAttr("clip-rule")}} của phần tử nếu có. Thuộc tính `clip-rule` về cơ bản hoạt động như thuộc tính {{cssxref("fill-rule")}}, ngoại trừ nó áp dụng cho các định nghĩa `<clipPath>`. Nó không có bất kỳ hiệu ứng nào trên {{cssxref("basic-shape")}} CSS.

## Cú pháp

```css
/* Từ khóa */
clip-rule: nonzero;
clip-rule: evenodd;

/* Giá trị toàn cục */
clip-rule: inherit;
clip-rule: initial;
clip-rule: revert;
clip-rule: revert-layer;
clip-rule: unset;
```

### Giá trị

- `nonzero`
  - : Với mỗi điểm trong hộp mặt nạ cắt, một tia được vẽ theo hướng ngẫu nhiên. Mỗi khi tia giao với bất kỳ phần nào của đường cắt, số đếm tăng thêm một nếu phần đường cắt đó di chuyển từ trái sang phải qua tia, và giảm một nếu phần đường dẫn di chuyển từ phải sang trái qua tia. Nếu tổng cuối cùng của số đếm là không, điểm nằm ngoài hình dạng. Ngược lại, điểm nằm trong hình dạng.

- `even-odd`
  - : Với mỗi điểm trong hộp mặt nạ cắt, một tia được vẽ theo hướng ngẫu nhiên. Mỗi khi tia giao với bất kỳ phần nào của đường cắt, số đếm tăng thêm một. Nếu tổng cuối cùng của số đếm là chẵn, điểm nằm ngoài hình dạng; ngược lại, điểm nằm trong hình dạng. Số không được coi là chẵn.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### So sánh các giá trị

Trong ví dụ này, chúng ta áp dụng các giá trị CSS `clip-rule` khác nhau cho các phần tử SVG {{SVGElement("path")}} tương tự để minh họa sự khác biệt giữa `evenodd` và `nonzero`.

#### HTML

Phần đánh dấu gồm nhiều vùng chứa `<svg>`, mỗi vùng có một phần tử `<clipPath>` xác định hình ngôi sao và một phần tử `<rect>` để vẽ ngôi sao bên trong. Các ngôi sao được tạo bằng các đường giao nhau. Ngoài `id`, đánh dấu của hai phần tử SVG đầu tiên giống hệt nhau. SVG thứ ba chỉ gồm phần tử `<path>`, cho thấy cách các đường của đường dẫn tạo ra ngôi sao giao nhau.

```html
<svg>
  <clipPath id="star1">
    <path d="M50,0 21,90 98,35 2,35 79,90z" />
  </clipPath>
  <rect clip-path="url(#star1)" width="95" height="95" />
</svg>

<svg>
  <clipPath id="star2">
    <path d="M50,0 21,90 98,35 2,35 79,90z" />
  </clipPath>
  <rect clip-path="url(#star2)" width="95" height="95" />
</svg>

<svg id="star3">
  <path d="M50,0 21,90 98,35 2,35 79,90z" />
</svg>
```

#### CSS

`clip-rule` cho `<path>` trong SVG đầu tiên được đặt thành `evenodd`; `nonzero` trong SVG thứ hai. Với SVG chỉ có đường dẫn, chúng ta đã xóa {{cssxref("fill")}} mặc định và định nghĩa màu {{cssxref("stroke")}} và {{cssxref("stroke-width")}} để các đường dẫn giao nhau trở nên rõ ràng:

```css hidden
body {
  display: flex;
  gap: 20px;
}
svg {
  width: 110px;
  height: 110px;
}
```

```css
#star1 path {
  clip-rule: evenodd;
}

#star2 path {
  clip-rule: nonzero;
}

#star3 path {
  fill: none;
  stroke: black;
  stroke-width: 1;
}
```

#### Kết quả

{{EmbedLiveSample("Value comparison", "", "130")}}

### Trong định nghĩa hình dạng cơ bản

Ví dụ này minh họa rằng, trong khi `clip-rule` không có hiệu ứng trên {{cssxref("basic-shape")}} CSS, nó có thể ảnh hưởng đến `<clipPath>` được dùng làm nguồn của hình dạng.

#### HTML

Chúng ta gồm một SVG với hai phần tử `<clipPath>` xác định hình ngôi sao, giống hệt nhau ngoại trừ giá trị thuộc tính `id`. Chúng ta cũng gồm hai phần tử `<div>` sẽ chứa các hình ngôi sao của chúng ta.

```html
<svg height="0" width="0">
  <defs>
    <clipPath id="star1">
      <path d="M100,0 42,180 196,70 4,70 158,180z" />
    </clipPath>
    <clipPath id="star2">
      <path d="M100,0 42,180 196,70 4,70 158,180z" />
    </clipPath>
  </defs>
</svg>

<div></div>
<div></div>
```

#### CSS

Chúng ta cung cấp cho các phần tử `<div>` {{cssxref("width")}} và {{cssxref("height")}} được đặt, thêm [`conic-gradient()`](/en-US/docs/Web/CSS/Reference/Values/gradient/conic-gradient) cho giá trị {{cssxref("background-image")}} của chúng:

```css hidden
body {
  display: flex;
  gap: 20px;
}
```

```css
div {
  height: 200px;
  width: 200px;
  background-image: conic-gradient(
    at center,
    rebeccapurple,
    green,
    lightblue,
    rebeccapurple
  );
}
```

Chúng ta dùng thuộc tính {{cssxref("clip-path")}} để đặt các phần tử `<clipPath>` khác nhau làm đường cắt cho mỗi `<div>`:

```css
div:first-of-type {
  clip-path: url("#star1");
}
div:last-of-type {
  clip-path: url("#star2");
}
```

Cuối cùng, chúng ta đặt các giá trị `clip-rule` khác nhau cho `<path>` của từng phần tử `<clipPath>`:

```css
#star1 path {
  clip-rule: evenodd;
}
#star2 path {
  clip-rule: nonzero;
}
```

#### Kết quả

{{EmbedLiveSample("Within basic shape definitions", "", "200")}}

### Chọn giữa các quy tắc cho đường dẫn với tất cả các đường theo chiều kim đồng hồ

Trong hình ảnh SVG này, chúng ta có hai hình chữ nhật được cắt, mỗi hình dùng một quy tắc cắt. Có hai phần tử {{SVGElement("clipPath")}}, để một cái có thể được đặt dùng quy tắc cắt nonzero và cái kia dùng quy tắc even-odd. Cả hai đường dẫn được vẽ theo chiều kim đồng hồ cho cả phần bên trong và bên ngoài.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 50">
  <g stroke="#112233" fill="#bbccdd">
    <!-- basic rectangle and clipping path visualization follow -->
    <rect x="10" y="10" width="30" height="30" />
    <path
      d="M 65,5 l 20,20 -20,20 -20,-20 20,-20 m 0,10 l 10,10 -10,10 -10,-10 10,-10 z"
      fill="none"
      stroke-width="0.5" />
    <!-- rectangles to be clipped follow -->
    <rect x="110" y="10" width="30" height="30" clip-path="url(#clipper1)" />
    <rect x="160" y="10" width="30" height="30" clip-path="url(#clipper2)" />
  </g>
  <!-- clipping paths follow -->
  <clipPath id="clipper1" clipPathUnits="objectBoundingBox">
    <path
      d="M 0.5 -0.15 l 0.65 0.65 -0.65,0.65 -0.65,-0.65 0.65,-0.65 m 0,0.33 l 0.33,0.33 -0.33,0.33 -0.33,-0.33 0.33,-0.33 z"
      clip-rule="evenodd" />
  </clipPath>
  <clipPath id="clipper2" clipPathUnits="objectBoundingBox">
    <path
      d="M 0.5 -0.15 l 0.65 0.65 -0.65,0.65 -0.65,-0.65 0.65,-0.65 m 0,0.33 l 0.33,0.33 -0.33,0.33 -0.33,-0.33 0.33,-0.33 z"
      clip-rule="nonzero" />
  </clipPath>
</svg>
```

Đối với các đường cắt được áp dụng cho các hình chữ nhật bị cắt, thuộc tính CSS `clip-rule` được dùng để đặt một đường dẫn sử dụng quy tắc `nonzero` và đường kia dùng quy tắc `evenodd`. Chúng ghi đè các giá trị của thuộc tính `clip-path` trong SVG, vốn đã được đặt thành các giá trị ngược lại.

```css
#clipper1 {
  clip-rule: nonzero;
}
#clipper2 {
  clip-rule: evenodd;
}
```

Vì cả phần bên trong và bên ngoài của đường dẫn đều di chuyển theo chiều kim đồng hồ (trái sang phải), hình dạng cắt kết quả sẽ khác nhau giữa hai quy tắc cắt. Với `nonzero`, bất kỳ tia nào bên trong phần ngoài của hình dạng sẽ có tổng số đếm lớn hơn không, vì nó sẽ gặp một hoặc nhiều đoạn đường dẫn từ trái sang phải. Với `even-odd`, các điểm giữa hai phần của đường dẫn sẽ có số đếm lẻ, trong khi bất kỳ điểm nào bên trong đường dẫn bên trong hoặc bên ngoài phần ngoài sẽ có số đếm chẵn.

{{EmbedLiveSample("Choosing between rules for a path with all clockwise paths", "500", "200")}}

### Chọn giữa các quy tắc cho đường dẫn với các đường quay theo hướng khác nhau

Ví dụ này sử dụng cùng SVG như ví dụ trước, với thay đổi là phần bên trong của đường cắt quay ngược chiều kim đồng hồ.

```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 50">
  <g stroke="#112233" fill="#bbccdd">
    <!-- basic rectangle and clipping path visualization follow -->
    <rect x="10" y="10" width="30" height="30" />
    <path
      d="M 65,5 l 20,20 -20,20 -20,-20 20,-20 m 0,10 l 10,10 -10,10 -10,-10 10,-10 z"
      fill="none"
      stroke-width="0.5" />
    <!-- rectangles to be clipped follow -->
    <rect x="110" y="10" width="30" height="30" clip-path="url(#clipper1)" />
    <rect x="160" y="10" width="30" height="30" clip-path="url(#clipper2)" />
  </g>
  <!-- clipping paths follow -->
  <clipPath id="clipper1" clipPathUnits="objectBoundingBox">
    <path
      d="M 0.5 -0.15 l 0.65 0.65 -0.65,0.65 -0.65,-0.65 0.65,-0.65 m 0,0.33 l -0.33,0.33 0.33,0.33 0.33,-0.33 -0.33,-0.33 z" />
  </clipPath>
  <clipPath id="clipper2" clipPathUnits="objectBoundingBox">
    <path
      d="M 0.5 -0.15 l 0.65 0.65 -0.65,0.65 -0.65,-0.65 0.65,-0.65 m 0,0.33 l 0.33,0.33 -0.33,0.33 -0.33,-0.33 0.33,-0.33 z" />
  </clipPath>
</svg>
```

Chúng ta áp dụng CSS giống như trước.

```css
#clipper1 {
  clip-rule: nonzero;
}
#clipper2 {
  clip-rule: evenodd;
}
```

Trong trường hợp này, vì phần ngoài của đường dẫn di chuyển theo chiều kim đồng hồ (trái sang phải) và phần bên trong di chuyển ngược chiều kim đồng hồ (phải sang trái), hình dạng cắt kết quả sẽ giống nhau bất kể quy tắc cắt nào được dùng.

{{EmbedLiveSample("Choosing between rules for a path with different winding paths", "500", "200")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("fill-rule")}}
- {{cssxref("clip-path")}}
- [Giới thiệu về cắt CSS](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- Module [CSS masking](/en-US/docs/Web/CSS/Guides/Masking)
- Thuộc tính SVG {{SVGAttr("clip-rule")}}
- Phần tử SVG {{SVGElement("clipPath")}}
- Thuộc tính SVG {{SVGAttr("fill-rule")}}
