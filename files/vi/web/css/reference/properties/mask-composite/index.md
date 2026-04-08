---
title: mask-composite
slug: Web/CSS/Reference/Properties/mask-composite
page-type: css-property
browser-compat: css.properties.mask-composite
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-composite`** biểu thị thao tác tổng hợp được sử dụng trên lớp mặt nạ hiện tại với các lớp mặt nạ bên dưới nó.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-composite: add;
mask-composite: subtract;
mask-composite: intersect;
mask-composite: exclude;

/* Giá trị toàn cục */
mask-composite: inherit;
mask-composite: initial;
mask-composite: revert;
mask-composite: revert-layer;
mask-composite: unset;
```

### Giá trị

Thuộc tính chấp nhận danh sách các giá trị từ khóa `<compositing-operator>` được phân tách bằng dấu phẩy, mỗi giá trị biểu thị một toán tử tổng hợp Porter-Duff xác định thao tác tổng hợp được sử dụng trên lớp mặt nạ hiện tại với các lớp mặt nạ bên dưới nó, bao gồm:

- `add`
  - : Hình ảnh mặt nạ liên quan được đặt trên tất cả các lớp mặt nạ bên dưới nó (với các toán tử tổng hợp tương ứng được áp dụng). Đây là giá trị mặc định.
- `subtract`
  - : Hình ảnh mặt nạ liên quan được đặt ở nơi nó nằm ngoài tất cả các lớp mặt nạ bên dưới nó (với các toán tử tổng hợp tương ứng được áp dụng).
- `intersect`
  - : Các phần của hình ảnh mặt nạ liên quan chồng lên tất cả các lớp mặt nạ đã tổng hợp bên dưới nó thay thế các lớp đã tổng hợp trước đó.
- `exclude`
  - : Các vùng không chồng lên nhau của hình ảnh mặt nạ liên quan và các lớp mặt nạ bên dưới nó, với các toán tử tổng hợp tương ứng được áp dụng, được kết hợp lại.

## Mô tả

Khi một phần tử có nhiều lớp mặt nạ được áp dụng, thuộc tính `mask-composite` có thể được dùng để xác định cách các mặt nạ tương tác với nhau, hoặc được kết hợp, khi tạo ra hiệu ứng mặt nạ cuối cùng.

Số lượng lớp được xác định bởi số lượng giá trị được phân tách bằng dấu phẩy trong giá trị thuộc tính `mask-image` (ngay cả khi một giá trị là `none`). Mỗi giá trị `mask-composite` trong danh sách giá trị được phân tách bằng dấu phẩy được khớp với một giá trị `mask-image`, theo thứ tự. Nếu số lượng giá trị trong `mask-composite` bằng hoặc lớn hơn số lượng giá trị `mask-image`, các giá trị dư thừa sẽ bị bỏ qua. Nếu thuộc tính `mask-composite` không có đủ giá trị được phân tách bằng dấu phẩy để khớp với số lượng lớp, danh sách giá trị sẽ được lặp lại cho đến khi đủ.

Để xử lý, _lớp nguồn_, là lớp hình ảnh mặt nạ hiện tại hoặc liên quan, được thêm vào (mặc định), trừ ra, giao nhau, hoặc loại trừ khỏi các lớp đích. _Các lớp đích_ là các lớp mặt nạ bên dưới nguồn với các toán tử tổng hợp tương ứng được áp dụng; điều này bao gồm tất cả các lớp trước đó, được tổng hợp theo thứ tự xuất hiện trong danh sách mặt nạ được phân tách bằng dấu phẩy. Tất cả các lớp mặt nạ bên dưới lớp mặt nạ hiện tại phải được tổng hợp trước khi áp dụng thao tác tổng hợp cho lớp mặt nạ hiện tại. Các hình ảnh lớp mặt nạ được chuyển đổi thành mặt nạ alpha để xử lý trước khi được kết hợp theo giá trị tổng hợp được xác định.

Nhiều lớp mặt nạ được áp dụng cho bất kỳ phần tử hay phần tử giả nào hoạt động như thể chúng được kết xuất vào một nhóm cô lập. Nói cách khác, các lớp mặt nạ được tổng hợp với các lớp mặt nạ khác, không phải với nội dung của phần tử hay nội dung phía sau phần tử.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản

Ví dụ này minh họa cách dùng cơ bản của thuộc tính `mask-composite`.

#### HTML

Chúng ta gồm một phần tử HTML {{htmlelement("div")}} mà sau đó chúng ta sẽ tạo kiểu.

```html
<div></div>
```

#### CSS

Chúng ta cung cấp kích thước và màu sắc cho `<div>`, sau đó thêm hai {{cssxref("mask-image")}}, và làm cho kích thước của chúng khớp với phần tử đang được che bằng thuộc tính {{cssxref("mask-size")}}. Cuối cùng, chúng ta trừ hình ảnh mặt nạ thứ hai khỏi hình ảnh mặt nạ đầu tiên với thuộc tính `mask-composite` được đặt thành `subtract`.

```css
div {
  width: 100px;
  height: 100px;
  background-color: red;

  mask-image:
    url("https://mdn.github.io/shared-assets/images/examples/mdn.svg"),
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
  mask-size: 100% 100%;

  mask-composite: subtract;
}
```

#### Kết quả

{{EmbedLiveSample("basic usage", "", "150px")}}

### So sánh giá trị

Ví dụ này minh họa bốn giá trị từ khóa `<compositing-operator>` của thuộc tính `mask-composite`, cùng với việc so sánh hiệu ứng của chế độ mặt nạ [`alpha` và `luminance`](/vi/docs/Web/CSS/Reference/Properties/mask-type).

#### HTML

Chúng ta có một {{htmlelement("table")}} chứa tám hình ảnh. `<table>` đã được ẩn đi cho ngắn gọn.

```html hidden
<table>
  <tbody>
    <tr>
      <th colspan="4">mask-type: alpha</th>
    </tr>
    <tr>
      <th>mask-composite: add</th>
      <th>mask-composite: subtract</th>
      <th>mask-composite: intersect</th>
      <th>mask-composite: exclude</th>
    </tr>
    <tr class="alphaMaskType">
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
    </tr>

    <tr>
      <th colspan="4">
        <code>mask-type: luminance</code>
      </th>
    </tr>
    <tr>
      <th>mask-composite: add</th>
      <th>mask-composite: subtract</th>
      <th>mask-composite: intersect</th>
      <th>mask-composite: exclude</th>
    </tr>
    <tr class="luminanceMaskType">
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
    </tr>
  </tbody>
</table>
```

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

Và một SVG với 4 mặt nạ; một trái tim và hình tròn alpha, và một trái tim và hình tròn luminance. Các mặt nạ trái tim được định nghĩa bằng màu đặc. Các mặt nạ hình tròn được tạo bằng màu trắng và đen nửa trong suốt cho {{SVGAttr("stroke")}} và {{SVGAttr("fill")}}.

```html
<svg height="0" width="0">
  <mask id="heartAlpha" class="alpha">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green"
      stroke="white"
      stroke-width="20" />
  </mask>
  <mask id="circleAlpha" class="alpha">
    <circle
      cx="130"
      cy="130"
      r="50"
      fill="rgb(0 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 0.5)"
      stroke-width="20" />
  </mask>
  <mask id="heartLuminance" class="luminance">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green"
      stroke="white"
      stroke-width="20" />
  </mask>
  <mask id="circleLuminance" class="luminance">
    <circle
      cx="130"
      cy="130"
      r="50"
      fill="rgb(0 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 0.5)"
      stroke-width="20" />
  </mask>
</svg>
```

#### CSS

Đầu tiên chúng ta tạo kiểu các phần tử `<mask>`, cung cấp cho mỗi mặt nạ một giá trị thuộc tính {{cssxref("mask-type")}} là `alpha` hoặc `luminance`.

```css
mask.luminance {
  mask-type: luminance;
}

mask.alpha {
  mask-type: alpha;
}
```

Sau đó chúng ta áp dụng các mặt nạ trái tim và hình tròn như các giá trị thuộc tính {{cssxref("mask-image")}} được phân tách bằng dấu phẩy. Chúng được áp dụng cho mỗi phần tử {{htmlelement("img")}}, với tất cả các hình ảnh trong một hàng nhận cùng mặt nạ.

```css
/* áp dụng các hình ảnh mặt nạ */
tr.alphaMaskType img {
  mask-image: url("#heartAlpha"), url("#circleAlpha");
}

tr.luminanceMaskType img {
  mask-image: url("#heartLuminance"), url("#circleLuminance");
}
```

Cuối cùng, chúng ta tổng hợp các mặt nạ bằng thuộc tính `mask-composite`, áp dụng bốn giá trị `mask-composite` được liệt kê khác nhau theo cột bảng.

```css
/* thuộc tính chúng ta đang kiểm tra */
td:nth-of-type(1) img {
  mask-composite: add;
}
td:nth-of-type(2) img {
  mask-composite: subtract;
}
td:nth-of-type(3) img {
  mask-composite: intersect;
}
td:nth-of-type(4) img {
  mask-composite: exclude;
}
```

Các kiểu bảng đã được ẩn đi cho ngắn gọn.

```css hidden
mask {
  height: 50%;
}

table,
td,
th {
  border: 1px solid;
}
th {
  font-family: monospace;
}
th {
  color: green;
}
body > img {
  display: none;
}
```

#### Kết quả

{{EmbedLiveSample("value comparison", "", "600")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask")}} viết tắt
- {{cssxref("mask-type")}}
- {{cssxref("mask-mode")}}
- [Giới thiệu về mặt nạ CSS](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính `mask` CSS](/vi/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/vi/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Mô-đun [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
