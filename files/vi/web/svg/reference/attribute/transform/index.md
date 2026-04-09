---
title: transform
slug: Web/SVG/Reference/Attribute/transform
page-type: svg-attribute
browser-compat: svg.global_attributes.transform
sidebar: svgref
---

Thuộc tính **`transform`** định nghĩa một danh sách các phép biến đổi được áp dụng cho một phần tử và các phần tử con của nó.

> [!NOTE]
> Là một thuộc tính trình bày, `transform` cũng có một thuộc tính CSS tương ứng: {{cssxref("transform")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên. Lưu ý rằng có một số khác biệt về cú pháp giữa thuộc tính CSS và thuộc tính này!

## Phần tử

Trong SVG 2, bạn có thể dùng thuộc tính `transform` trên bất kỳ phần tử nào, bao gồm cả phần tử gốc {{SVGElement('svg')}}.
Lưu ý rằng việc dùng `transform` trên phần tử gốc `<svg>` là một tính năng mới hơn, và bạn nên kiểm tra [tương thích trình duyệt](#browser_compatibility) để biết có được hỗ trợ hay không.
Việc dùng `transform` trên phần tử gốc `<svg>` rất tiện để áp dụng biến đổi cho toàn bộ ảnh SVG mà không cần thêm phần tử bao bọc hay giải pháp thay thế bằng CSS.

Trong SVG 1.1, chỉ có 16 phần tử sau được phép có `transform` được áp dụng: {{SVGElement('a')}}, {{SVGElement('circle')}}, {{SVGElement('clipPath')}}, {{SVGElement('defs')}}, {{SVGElement('ellipse')}}, {{SVGElement('foreignObject')}}, {{SVGElement('g')}}, {{SVGElement('image')}}, {{SVGElement('line')}}, {{SVGElement('path')}}, {{SVGElement('polygon')}}, {{SVGElement('polyline')}}, {{SVGElement('rect')}}, {{SVGElement('switch')}}, {{SVGElement('text')}}, và {{SVGElement('use')}}.

Ngoài ra, như một di sản từ SVG 1.1, {{SVGElement('linearGradient')}} và {{SVGElement('radialGradient')}} hỗ trợ thuộc tính `gradientTransform`, còn {{SVGElement('pattern')}} hỗ trợ thuộc tính `patternTransform`, cả hai đều hoạt động chính xác như thuộc tính `transform`.

## Giá trị

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#transform-list"
            ><code>&#x3C;transform-list></code></a
          ></strong
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>none</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Ví dụ

### Áp dụng biến đổi cho một phần tử SVG đơn lẻ

Trong ví dụ này, chúng ta áp dụng `transform` cho một phần tử {{svgelement("g")}} duy nhất bên trong tài liệu SVG:

```css hidden live-sample___transform-single-element live-sample___transform-svg-document
html,
body,
svg {
  height: 100%;
}
```

```html live-sample___transform-single-element
<svg
  viewBox="-40 0 150 100"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <g
    fill="grey"
    transform="rotate(-10 50 100)
               translate(-36 45.5)
               skewX(40)
               scale(1 0.5)">
    <path
      id="heart"
      d="M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z" />
  </g>

  <use href="#heart" fill="none" stroke="red" />
</svg>
```

{{EmbedLiveSample("transform-single-element", '100%', 200)}}

### Áp dụng biến đổi cho toàn bộ tài liệu SVG

Trong ví dụ này, chúng ta áp dụng `transform` cho phần tử gốc {{svgelement("svg")}}, nghĩa là phép biến đổi được áp dụng cho toàn bộ tài liệu SVG:

```html live-sample___transform-svg-document
<svg
  viewBox="-40 0 150 100"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  transform="rotate(-10 50 100)
               translate(-36 15.5)
               skewX(40)
               scale(1 0.5)">
  <g fill="grey">
    <path
      id="heart"
      d="M 10,30 A 20,20 0,0,1 50,30 A 20,20 0,0,1 90,30 Q 90,60 50,90 Q 10,60 10,30 z" />
  </g>

  <use href="#heart" fill="none" stroke="red" />
</svg>
```

{{EmbedLiveSample("transform-svg-document", '100%', 200)}}

## Các hàm biến đổi

Các hàm biến đổi sau có thể được dùng bởi `<transform-list>` của thuộc tính `transform`.

> [!WARNING]
> Theo đặc tả, bạn cũng nên có thể dùng các [hàm biến đổi](/en-US/docs/Web/CSS/Reference/Values/transform-function) của CSS. Tuy nhiên, khả năng tương thích không được đảm bảo.

### Matrix

Hàm biến đổi `matrix(<a> <b> <c> <d> <e> <f>)` chỉ định một phép biến đổi dưới dạng ma trận biến đổi gồm sáu giá trị. `matrix(a,b,c,d,e,f)` tương đương với việc áp dụng ma trận biến đổi:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>(</mo><mtable rowspacing="0.5ex"><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd><mtd><mi>e</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd><mtd><mi>f</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><annotation encoding="TeX">\begin{pmatrix} a & c & e \\ b & d & f \\ 0 & 0 & 1 \end{pmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Ma trận này ánh xạ tọa độ từ hệ tọa độ trước đó sang hệ tọa độ mới theo các đẳng thức ma trận sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo>(</mo><mtable rowspacing="0.5ex"><mtr><mtd><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>newCoordSys</mi></mrow></mstyle></msub></mtd></mtr><mtr><mtd><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>newCoordSys</mi></mrow></mstyle></msub></mtd></mtr><mtr><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><mo>=</mo><mrow><mo>(</mo><mtable rowspacing="0.5ex"><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd><mtd><mi>e</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd><mtd><mi>f</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><mrow><mo>(</mo><mtable rowspacing="0.5ex"><mtr><mtd><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub></mtd></mtr><mtr><mtd><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub></mtd></mtr><mtr><mtd><mn>1</mn></mtd></mtr></mtable><mo>)</mo></mrow><mo>=</mo><mrow><mo>(</mo><mtable rowspacing="0.5ex"><mtr><mtd><mi>a</mi><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>c</mi><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>e</mi></mtd></mtr><mtr><mtd><mi>b</mi><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>d</mi><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>f</mi></mtd></mtr><mtr><mtd><mn>1</mn></mtd></mtr></mtable></mrow></mrow><annotation encoding="TeX"> \begin{pmatrix} x_{\mathrm{newCoordSys}} \\ y_{\mathrm{newCoordSys}} \\ 1 \end{pmatrix} = \begin{pmatrix} a & c & e \\ b & d & f \\ 0 & 0 & 1 \end{pmatrix} \begin{pmatrix} x_{\mathrm{prevCoordSys}} \\ y_{\mathrm{prevCoordSys}} \\ 1 \end{pmatrix} = \begin{pmatrix} a x_{\mathrm{prevCoordSys}} + c y_{\mathrm{prevCoordSys}} + e \\ b x_{\mathrm{prevCoordSys}} + d y_{\mathrm{prevCoordSys}} + f \\ 1 \end{pmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <rect x="10" y="10" width="30" height="20" fill="green" />

  <!--
  In the following example we are applying the matrix:
  [a c e]    [3 -1 30]
  [b d f] => [1  3 40]
  [0 0 1]    [0  0  1]

  which transform the rectangle as such:

  top left corner: oldX=10 oldY=10
  newX = a * oldX + c * oldY + e = 3 * 10 - 1 * 10 + 30 = 50
  newY = b * oldX + d * oldY + f = 1 * 10 + 3 * 10 + 40 = 80

  top right corner: oldX=40 oldY=10
  newX = a * oldX + c * oldY + e = 3 * 40 - 1 * 10 + 30 = 140
  newY = b * oldX + d * oldY + f = 1 * 40 + 3 * 10 + 40 = 110

  bottom left corner: oldX=10 oldY=30
  newX = a * oldX + c * oldY + e = 3 * 10 - 1 * 30 + 30 = 30
  newY = b * oldX + d * oldY + f = 1 * 10 + 3 * 30 + 40 = 140

  bottom right corner: oldX=40 oldY=30
  newX = a * oldX + c * oldY + e = 3 * 40 - 1 * 30 + 30 = 120
  newY = b * oldX + d * oldY + f = 1 * 40 + 3 * 30 + 40 = 170
  -->
  <rect
    x="10"
    y="10"
    width="30"
    height="20"
    fill="red"
    transform="matrix(3 1 -1 3 30 40)" />
</svg>
```

{{EmbedLiveSample('Matrix', '100%', 200)}}

### Translate

Hàm biến đổi `translate(<x> [<y>])` di chuyển đối tượng theo `x` và `y`. Nếu không cung cấp `y`, nó được xem là `0`.

Nói cách khác:

```plain
xNew = xOld + <x>
yNew = yOld + <y>
```

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- No translation -->
  <rect x="5" y="5" width="40" height="40" fill="green" />

  <!-- Horizontal translation -->
  <rect
    x="5"
    y="5"
    width="40"
    height="40"
    fill="blue"
    transform="translate(50)" />

  <!-- Vertical translation -->
  <rect
    x="5"
    y="5"
    width="40"
    height="40"
    fill="red"
    transform="translate(0 50)" />

  <!-- Both horizontal and vertical translation -->
  <rect
    x="5"
    y="5"
    width="40"
    height="40"
    fill="yellow"
    transform="translate(50 50)" />
</svg>
```

{{EmbedLiveSample('Example_3', '100%', 200)}}

### Scale

Hàm biến đổi `scale(<x> [<y>])` chỉ định một phép co giãn theo `x` và `y`. Nếu không cung cấp `y`, nó được xem là bằng `x`.

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="-50 -50 100 100" xmlns="http://www.w3.org/2000/svg">
  <!-- uniform scale -->
  <circle cx="0" cy="0" r="10" fill="red" transform="scale(4)" />
</svg>
```
