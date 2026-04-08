---
title: background-repeat-y
slug: Web/CSS/Reference/Properties/background-repeat-y
page-type: css-property
status:
  - experimental
browser-compat: css.properties.background-repeat-y
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`background-repeat-y`** [CSS](/en-US/docs/Web/CSS) xác định cách lặp lại hình nền, hoặc không lặp, theo trục dọc.

Các thuộc tính {{cssxref("background-repeat-x")}} và `background-repeat-y` cũng có thể được đặt bằng thuộc tính viết tắt {{cssxref("background-repeat")}} hoặc {{cssxref("background")}}.

{{InteractiveExample("CSS Demo: background-repeat-y")}}

```css interactive-example-choice
background-repeat-y: repeat;
```

```css interactive-example-choice
background-repeat-y: space;
```

```css interactive-example-choice
background-repeat-y: round;
```

```css interactive-example-choice
background-repeat-y: no-repeat;
```

```html interactive-example
<section id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background: #cccccc url("/shared-assets/images/examples/moon.jpg") center /
    120px;
  min-width: 100%;
  min-height: 100%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-repeat-y: repeat;
background-repeat-y: space;
background-repeat-y: round;
background-repeat-y: no-repeat;

/* Giá trị toàn cục */
background-repeat-y: inherit;
background-repeat-y: initial;
background-repeat-y: revert;
background-repeat-y: revert-layer;
background-repeat-y: unset;
```

Thuộc tính `background-repeat-y` được chỉ định bằng một hoặc nhiều giá trị, cách nhau bằng dấu phẩy.

## Giá trị

- `repeat`
  - : Giá trị mặc định. Hình ảnh được lặp lại nhiều lần khi cần để bao phủ toàn bộ chiều cao vùng vẽ nền. Hình ảnh ở cạnh bị cắt nếu nhiều hình không vừa khít với chiều cao nền.

- `no-repeat`
  - : Hình ảnh không được lặp lại. Vị trí của hình nền không lặp được xác định bởi thuộc tính CSS {{cssxref("background-position")}}.

- `space`
  - : Hình ảnh được lặp lại nhiều nhất có thể mà không bị cắt. Hình đầu tiên và cuối cùng được ghim vào đầu và cuối của phần tử, khoảng trắng được phân bổ đều giữa các hình. Thuộc tính {{cssxref("background-position-y")}} bị bỏ qua trừ khi có thể hiển thị một hoặc nhiều hình mà không bị cắt. Nếu hình cao hơn phần tử, nó sẽ bị cắt vì không đủ chỗ để hiển thị.

- `round`
  - : Hình ảnh được lặp lại theo chiều dọc. Khi khoảng trống tăng lên, các hình lặp lại sẽ co giãn (không để lại khoảng trống) cho đến khi có chỗ để thêm một hình nữa. Nếu nhiều hình không khớp đúng với nền, chúng sẽ được thay đổi tỷ lệ cho vừa.

## Mô tả

Thuộc tính `background-repeat-y` nhận danh sách các từ khóa [`<repetition>`](#giá-trị) phân cách bằng dấu phẩy, xác định cách lặp lại hình nền theo chiều dọc hoặc không lặp.

Giá trị mặc định là `repeat`. Với giá trị này, hình nền lặp theo chiều dọc, bao phủ toàn bộ chiều cao vùng vẽ, các hình ở cạnh bị cắt theo kích thước phần tử. Việc cắt ở cạnh trên, dưới hay cả hai phụ thuộc vào giá trị {{cssxref("background-position")}} tương ứng. Số lần lặp và mức độ cắt phụ thuộc vào kích thước vùng vẽ nền và chiều cao của thuộc tính {{cssxref("background-size")}} tương ứng.

Các hình lặp có thể được cách đều nhau, đảm bảo hình không bị cắt theo chiều dọc. Với giá trị `space`, nếu chiều cao vùng vẽ không phải là bội số của chiều cao hình hoặc không có kích thước là bội số của kích thước nền theo trục y, sẽ có những vùng không được hình nền che phủ.

Ngoài ra, hình nền lặp có thể được kéo giãn để bao phủ toàn bộ chiều cao mà không bị cắt. Với `round`, nếu chiều cao vùng vẽ không phải là bội số của chiều cao hình nền, hình lặp được kéo giãn để lấp đầy toàn bộ không gian cho đến khi có chỗ thêm một hình lặp khác.

Ví dụ, cho hình nền 100px x 100px và vùng vẽ cao 1099px, hình sẽ được lặp lại 10 lần theo chiều dọc, mỗi hình được kéo dài thành 109.9px, có thể thay đổi {{glossary("aspect ratio", "tỷ lệ khung hình")}} và làm biến dạng hình. Nếu chiều cao vùng vẽ tăng thêm 1px lên 1100px, hình thứ 11 sẽ vừa theo chiều dọc, mỗi hình được vẽ cao 100px và không còn bị kéo giãn theo chiều dọc.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt background-repeat-y

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
  background-repeat-y: no-repeat;
}
.two {
  background-repeat-y: repeat;
}
.three {
  background-repeat-y: space;
}
.four {
  background-repeat-y: round;
}
```

```css hidden
@layer no-support {
  @supports not (background-repeat-y: repeat) {
    body::before {
      content: "Your browser doesn't support the `background-repeat-y` property.";
      background-color: wheat;
      display: block;
      padding: 1em;
      text-align: center;
    }
  }
}
```

#### Kết quả

Trong ví dụ này, mỗi mục danh sách được ghép với một giá trị khác nhau của `background-repeat-y`.

{{EmbedLiveSample('Setting_background-repeat-y', 240, 460)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-repeat-x")}} và thuộc tính viết tắt {{cssxref("background-repeat")}}.
- Các thành phần viết tắt {{cssxref("background")}}: {{cssxref("background-attachment")}}, {{cssxref("background-clip")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-origin")}}, {{cssxref("background-position")}} ({{cssxref("background-position-x")}} và {{cssxref("background-position-y")}}), và {{cssxref("background-size")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds) module
- [Hiểu tỷ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
