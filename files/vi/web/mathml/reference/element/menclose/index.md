---
title: <menclose>
slug: Web/MathML/Reference/Element/menclose
page-type: mathml-element
status:
  - non-standard
browser-compat: mathml.elements.menclose
sidebar: mathmlref
---

{{Non-standard_header}}

Phần tử **`<menclose>`** [MathML](/en-US/docs/Web/MathML) hiển thị nội dung của nó bên trong một ký hiệu bao quanh được chỉ định bởi thuộc tính `notation`.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

- `notation` {{Non-standard_Inline}}
  - : Một danh sách các ký hiệu, ngăn cách bằng khoảng trắng, sẽ được áp dụng cho các phần tử con. Mỗi ký hiệu được vẽ như thể các ký hiệu khác không tồn tại, và vì vậy chúng có thể chồng lấp nhau. Các giá trị có thể có là:

    | Giá trị              | Kết quả mẫu                                                | Hiển thị trong trình duyệt của bạn                                                                                                           | Mô tả                                                                                                               |
    | -------------------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
    | `longdiv` (mặc định) | ![Kết quả mẫu Longdiv.](longdiv.svg)                       | <math><menclose notation="longdiv"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>            | ký hiệu phép chia dài                                                                                               |
    | `actuarial`          | ![Kết quả mẫu Actuarial.](actuarial.svg)                   | <math><menclose notation="actuarial"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>          | [ký hiệu actuarial](https://en.wikipedia.org/wiki/Actuarial_notation)                                               |
    | `box`                | ![Kết quả mẫu Box.](box.svg)                               | <math><menclose notation="box"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>                | khung hộp                                                                                                           |
    | `roundedbox`         | ![Kết quả mẫu Roundedbox.](roundedbox.svg)                 | <math><menclose notation="roundedbox"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>         | khung hộp bo tròn                                                                                                   |
    | `circle`             | ![Kết quả mẫu Circle.](circle.svg)                         | <math><menclose notation="circle"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>             | hình tròn                                                                                                           |
    | `left`               | ![Kết quả mẫu Left.](left.svg)                             | <math><menclose notation="left"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>               | đường ở bên trái nội dung                                                                                           |
    | `right`              | ![Kết quả mẫu Right.](right.svg)                           | <math><menclose notation="right"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>              | đường ở bên phải nội dung                                                                                           |
    | `top`                | ![Kết quả mẫu Top.](top.svg)                               | <math><menclose notation="top"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>                | đường phía trên nội dung                                                                                            |
    | `bottom`             | ![Kết quả mẫu Bottom.](bottom.svg)                         | <math><menclose notation="bottom"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>             | đường phía dưới nội dung                                                                                            |
    | `updiagonalstrike`   | ![Kết quả mẫu Updiagonalstrike.](updiagonalstrike.svg)     | <math><menclose notation="updiagonalstrike"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>   | đường gạch chéo từ dưới trái lên trên phải qua nội dung                                                             |
    | `downdiagonalstrike` | ![Kết quả mẫu Downdiagonalstrike.](downdiagonalstrike.svg) | <math><menclose notation="downdiagonalstrike"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math> | đường gạch chéo từ trên trái xuống dưới phải qua nội dung                                                           |
    | `verticalstrike`     | ![Kết quả mẫu Verticalstrike.](verticalstrike.svg)         | <math><menclose notation="verticalstrike"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>     | đường gạch dọc qua nội dung                                                                                         |
    | `horizontalstrike`   | ![Kết quả mẫu Horizontalstrike.](horizontalstrike.svg)     | <math><menclose notation="horizontalstrike"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>   | đường gạch ngang qua nội dung                                                                                       |
    | `madruwb`            | ![Kết quả mẫu Madruwb.](madruwb.svg)                       | <math><menclose notation="madruwb"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>            | [ký hiệu giai thừa Ả Rập](https://en.wikipedia.org/wiki/Modern_Arabic_mathematical_notation#Arithmetic_and_algebra) |
    | `updiagonalarrow`    | ![Kết quả mẫu Madruwb.](updiagonalarrow.svg)               | <math><menclose notation="updiagonalarrow"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>    | mũi tên chéo                                                                                                        |
    | `phasorangle`        | ![Kết quả mẫu Phasorangle.](phasorangle.svg)               | <math><menclose notation="phasorangle"><msup><mi>a</mi><mn>2</mn></msup><mo>+</mo><msup><mi>b</mi><mn>2</mn></msup></menclose></math>        | góc pha                                                                                                             |

## Ví dụ

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html
<math display="block">
  <menclose notation="circle box">
    <mi>x</mi>
    <mo>+</mo>
    <mi>y</mi>
  </menclose>
</math>
```

Kết quả mẫu:

![Áp dụng đồng thời các giá trị circle và box.](circle-box.svg)

Kết quả hiển thị trong trình duyệt của bạn:

{{ EmbedLiveSample('menclose_example', 700, 200, "", "") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không có
    </td>
  </tr>
</table>

## Đặc tả

Phần tử `<menclose>` không được định nghĩa trong bất kỳ đặc tả nào hướng tới trình duyệt, nhưng bạn có thể tìm thấy mô tả trong [MathML 4](https://w3c.github.io/mathml/#presm_menclose).

## Tương thích trình duyệt

{{Compat}}
