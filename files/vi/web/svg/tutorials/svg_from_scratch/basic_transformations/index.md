---
title: Các biến đổi cơ bản
slug: Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Texts", "Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking") }}

Giờ chúng ta đã sẵn sàng bắt đầu làm biến dạng những hình ảnh đẹp của mình. Nhưng trước tiên, hãy giới thiệu chính thức phần tử {{SVGElement("g")}}. Với công cụ trợ giúp này, bạn có thể gán thuộc tính cho cả một tập hợp phần tử. Thực ra, đó là mục đích duy nhất của nó.

## Ví dụ

```html
<svg width="30" height="10">
  <g fill="red">
    <rect x="0" y="0" width="10" height="10" />
    <rect x="20" y="0" width="10" height="10" />
  </g>
</svg>
```

{{ EmbedLiveSample('Example', '', '100') }}

Tất cả các biến đổi sau đây được cộng dồn trong thuộc tính `transform` của một phần tử. Các biến đổi có thể được xâu chuỗi bằng cách nối chúng, ngăn cách bằng khoảng trắng.

## Dịch chuyển

Đôi khi cần di chuyển một phần tử đi nơi khác, dù bạn đã có thể định vị nó bằng các thuộc tính tương ứng. Vì mục đích này, biến đổi `translate()` luôn sẵn sàng.

```html
<svg width="40" height="50">
  <rect x="0" y="0" width="10" height="10" transform="translate(30,40)" />
</svg>
```

```css hidden
svg {
  background-color: #bbffff;
}
```

Ví dụ này sẽ hiển thị một hình chữ nhật được dịch chuyển tới điểm (30,40) thay vì (0,0).

{{ EmbedLiveSample('Translation', '', '100') }}

Nếu không cung cấp giá trị thứ hai, nó sẽ được coi là _0_.

## Xoay

Xoay một phần tử là một việc khá thường gặp. Hãy dùng biến đổi `rotate()` cho việc này:

```html
<svg width="31" height="31">
  <rect x="12" y="-10" width="20" height="20" transform="rotate(45)" />
</svg>
```

Ví dụ này cho thấy một hình vuông được xoay 45 độ. Giá trị cho `rotate()` được cho bằng độ.

{{ EmbedLiveSample('Rotation', '', '100') }}

## Nhiều biến đổi

Có thể nối các biến đổi rất dễ dàng chỉ bằng cách ngăn cách chúng bằng dấu cách. Ví dụ, `translate()` và `rotate()` là những biến đổi thường dùng.

```html
<svg width="40" height="50">
  <rect
    x="0"
    y="0"
    width="10"
    height="10"
    transform="translate(30,40) rotate(45)" />
</svg>
```

```css hidden
svg {
  background-color: #bbffff;
}
```

Ví dụ này lại cho thấy hình vuông nhỏ ở trên, nhưng lần này nó cũng được xoay 45 độ.

## Làm nghiêng

Để biến hình chữ nhật của chúng ta thành hình thoi, có các biến đổi `skewX()` và `skewY()`. Mỗi biến đổi nhận một góc xác định mức độ phần tử sẽ bị nghiêng.

## Co giãn

`scale()` thay đổi kích thước của một phần tử. Nó nhận hai số, số đầu là hệ số co giãn theo _x_ và số thứ hai là hệ số co giãn theo _y_. Các hệ số này được hiểu là tỷ lệ giữa kích thước sau biến đổi và kích thước ban đầu. Ví dụ, _0.5_ sẽ thu nhỏ đi 50%. Nếu bỏ qua số thứ hai, nó sẽ được coi là bằng số thứ nhất.

## Biến đổi phức tạp với `matrix()`

Tất cả các biến đổi trên đều có thể được biểu diễn bằng một ma trận biến đổi 2x3. Để kết hợp nhiều biến đổi, bạn có thể đặt trực tiếp ma trận kết quả bằng biến đổi `matrix(a, b, c, d, e, f)`, phép này ánh xạ tọa độ từ hệ tọa độ trước đó sang một hệ tọa độ mới bằng

<!-- Note: the {} need to be double-escaped, once for Yari -->
<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>{</mo><mtable rowspacing="0.5ex"><mtr><mtd><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>newCoordSys</mi></mrow></mstyle></msub><mo>=</mo><mi>a</mi><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>c</mi><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>e</mi></mtd></mtr><mtr><mtd><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>newCoordSys</mi></mrow></mstyle></msub><mo>=</mo><mi>b</mi><msub><mi>x</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>d</mi><msub><mi>y</mi><mstyle mathvariant="normal"><mrow><mi>prevCoordSys</mi></mrow></mstyle></msub><mo>+</mo><mi>f</mi></mtd></mtr></mtable></mrow><annotation encoding="TeX">\left\\{ \begin{matrix} x_{\mathrm{prevCoordSys}} = a x_{\mathrm{newCoordSys}} + c y_{\mathrm{newCoordSys}} + e \\ y_{\mathrm{prevCoordSys}} = b x_{\mathrm{newCoordSys}} + d y_{\mathrm{newCoordSys}} + f \end{matrix} \right.</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Xem một [ví dụ cụ thể trong tài liệu SVG transform](/en-US/docs/Web/SVG/Reference/Attribute/transform#matrix). Để đọc thêm về các phép biến đổi, hãy xem hướng dẫn [CSS transforms](/en-US/docs/Web/CSS/Guides/Transforms/Using).

## Ảnh hưởng lên hệ tọa độ

Khi dùng các biến đổi, bạn thiết lập một hệ tọa độ mới bên trong phần tử mà biến đổi áp dụng. Điều đó có nghĩa là các đơn vị bạn chỉ định cho phần tử và các phần tử con của nó có thể không còn theo ánh xạ pixel 1:1 nữa, mà còn bị làm méo, nghiêng, dịch chuyển và co giãn theo biến đổi.

```html
<svg width="100" height="100">
  <g transform="scale(2)">
    <rect width="50" height="50" />
  </g>
</svg>
```

Hình chữ nhật thu được trong ví dụ trên sẽ có kích thước 100x100px. Những hiệu ứng thú vị hơn xuất hiện khi bạn dựa vào các thuộc tính như `userSpaceOnUse` và những thứ tương tự.

{{ EmbedLiveSample('Effects_on_Coordinate_Systems', '', '150') }}

## Nhúng SVG trong SVG

Trái với HTML, SVG cho phép bạn nhúng các phần tử `svg` khác một cách liền mạch. Nhờ vậy, bạn cũng có thể tạo các hệ tọa độ mới bằng cách tận dụng `viewBox`, `width` và `height` của phần tử `svg` bên trong.

```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="100" height="100">
  <svg width="100" height="100" viewBox="0 0 50 50">
    <rect width="50" height="50" />
  </svg>
</svg>
```

Ví dụ trên về cơ bản có cùng tác dụng như ví dụ ở trên, cụ thể là hình chữ nhật sẽ lớn gấp đôi kích thước được chỉ định.

{{ EmbedLiveSample('Embedding_SVG_in_SVG', '100', '150') }}

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Texts", "Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking") }}
