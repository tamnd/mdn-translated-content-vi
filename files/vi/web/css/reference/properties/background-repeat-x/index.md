---
title: background-repeat-x
slug: Web/CSS/Reference/Properties/background-repeat-x
page-type: css-property
status:
  - experimental
browser-compat: css.properties.background-repeat-x
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`background-repeat-x`** [CSS](/en-US/docs/Web/CSS) xác định cách lặp lại hình nền, hoặc không lặp, theo trục ngang.

Các thuộc tính `background-repeat-x` và {{cssxref("background-repeat-y")}} cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("background-repeat")}} hoặc {{cssxref("background")}}.

{{InteractiveExample("CSS Demo: background-repeat-x")}}

```css interactive-example-choice
background-repeat-x: repeat;
```

```css interactive-example-choice
background-repeat-x: space;
```

```css interactive-example-choice
background-repeat-x: round;
```

```css interactive-example-choice
background-repeat-x: no-repeat;
```

```html interactive-example
<section id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background: #cccccc url("/shared-assets/images/examples/moon.jpg") no-repeat
    center / 120px;
  min-width: 100%;
  min-height: 100%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-repeat-x: repeat;
background-repeat-x: space;
background-repeat-x: round;
background-repeat-x: no-repeat;

/* Giá trị toàn cục */
background-repeat-x: inherit;
background-repeat-x: initial;
background-repeat-x: revert;
background-repeat-x: revert-layer;
background-repeat-x: unset;
```

Thuộc tính `background-repeat-x` được chỉ định bằng một hoặc nhiều giá trị, cách nhau bằng dấu phẩy.

## Giá trị

- `repeat`
  - : Giá trị mặc định. Hình ảnh được lặp lại nhiều lần khi cần để bao phủ toàn bộ chiều rộng vùng vẽ nền. Hình ảnh ở cạnh bị cắt nếu nhiều hình không vừa khít với chiều rộng nền.

- `no-repeat`
  - : Hình ảnh không được lặp lại. Vị trí của hình nền không lặp được xác định bởi thuộc tính CSS {{cssxref("background-position")}}.

- `space`
  - : Hình ảnh được lặp lại nhiều nhất có thể mà không bị cắt. Hình đầu tiên và cuối cùng được ghim vào cạnh trái và phải của phần tử, khoảng trắng được phân bổ đều giữa chúng. Thuộc tính {{cssxref("background-position-x")}} bị bỏ qua trừ khi có thể hiển thị một hoặc nhiều hình mà không bị cắt. Nếu hình rộng hơn phần tử, nó sẽ bị cắt vì không đủ chỗ để hiển thị.

- `round`
  - : Hình ảnh được lặp lại theo chiều ngang. Khi khoảng trống tăng lên, các hình lặp lại sẽ co giãn (không để lại khoảng trống) cho đến khi có chỗ để thêm một hình nữa. Nếu nhiều hình không khớp đúng với nền, chúng sẽ được thay đổi tỷ lệ cho vừa.

## Mô tả

Thuộc tính `background-repeat-x` nhận danh sách các từ khóa [`<repetition>`](#giá-trị) phân cách bằng dấu phẩy, xác định cách lặp lại hình nền theo chiều ngang hoặc không lặp.

Giá trị mặc định là `repeat`. Với giá trị này, hình nền lặp theo chiều ngang, bao phủ toàn bộ chiều rộng vùng vẽ, các hình ở cạnh bị cắt theo kích thước phần tử. Việc cắt ở cạnh trái, phải hay cả hai phụ thuộc vào giá trị {{cssxref("background-position")}} tương ứng. Số lần lặp và mức độ cắt phụ thuộc vào kích thước vùng vẽ nền và chiều rộng của thuộc tính {{cssxref("background-size")}} tương ứng.

Các hình lặp có thể được cách đều nhau, đảm bảo hình không bị cắt theo chiều ngang. Với giá trị `space`, nếu chiều rộng vùng vẽ không phải là bội số của chiều rộng hình, sẽ có những vùng không được hình nền che phủ.

Ngoài ra, hình nền lặp có thể được kéo giãn để bao phủ toàn bộ chiều rộng mà không bị cắt. Với `round`, hình lặp được kéo giãn để lấp đầy toàn bộ không gian cho đến khi có chỗ thêm một hình lặp khác.

Ví dụ, cho hình nền `100px` x `100px` và vùng vẽ rộng `1099px`, hình sẽ được thay đổi kích thước thành `109.9px` rộng và lặp lại 10 lần theo chiều ngang. Điều này sẽ thay đổi {{glossary("aspect ratio", "tỷ lệ khung hình")}} và làm biến dạng hình. Nếu chiều rộng vùng vẽ tăng thêm `1px` lên `1100px`, hình thứ 11 sẽ vừa theo chiều ngang, mỗi hình được vẽ rộng `100px` và không còn bị biến dạng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt background-repeat-x

#### HTML

```html
<ol>
  <li>
    no-repeat
    <div class="one"></div>
  </li>
  <li>
    repeat
    <div class="two"></div>
  </li>
  <li>
    space
    <div class="three"></div>
  </li>
  <li>
    round
    <div class="four"></div>
  </li>
</ol>
```

#### CSS

```css
ol,
li {
  margin: 0;
  padding: 0;
}
li {
  margin-bottom: 12px;
}
div {
  background-image: url("star-solid.gif");
  width: 160px;
  height: 70px;
}

/* Background repeats */
.one {
  background-repeat-x: no-repeat;
}
.two {
  background-repeat-x: repeat;
}
.three {
  background-repeat-x: space;
}
.four {
  background-repeat-x: round;
}
```

```css hidden
@layer no-support {
  @supports not (background-repeat-x: repeat) {
    body::before {
      content: "Your browser doesn't support the `background-repeat-x` property.";
      background-color: wheat;
      display: block;
      padding: 1em;
      text-align: center;
    }
  }
}
```

#### Kết quả

Trong ví dụ này, mỗi mục danh sách được ghép với một giá trị khác nhau của `background-repeat-x`.

{{EmbedLiveSample('Setting_background-repeat-x', 240, 460)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-repeat-y")}} và thuộc tính viết tắt {{cssxref("background-repeat")}}.
- Các thành phần viết tắt {{cssxref("background")}}: {{cssxref("background-attachment")}}, {{cssxref("background-clip")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-origin")}}, {{cssxref("background-position")}} ({{cssxref("background-position-x")}} và {{cssxref("background-position-y")}}), và {{cssxref("background-size")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds) module
- [Hiểu tỷ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
