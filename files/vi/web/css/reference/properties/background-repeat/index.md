---
title: background-repeat
slug: Web/CSS/Reference/Properties/background-repeat
page-type: css-property
browser-compat: css.properties.background-repeat
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-repeat`** đặt cách lặp lại các ảnh nền. Ảnh nền có thể được lặp dọc theo trục ngang và trục dọc, hoặc không lặp lại.

{{InteractiveExample("CSS Demo: background-repeat")}}

```css interactive-example-choice
background-repeat: repeat-x;
```

```css interactive-example-choice
background-repeat: repeat;
```

```css interactive-example-choice
background-repeat: space;
```

```css interactive-example-choice
background-repeat: round;
```

```css interactive-example-choice
background-repeat: no-repeat;
```

```css interactive-example-choice
background-repeat: space repeat;
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
background-repeat: repeat;
background-repeat: repeat-x;
background-repeat: repeat-y;
background-repeat: space;
background-repeat: round;
background-repeat: no-repeat;

/* Cú pháp hai giá trị: ngang | dọc */
background-repeat: repeat space;
background-repeat: repeat repeat;
background-repeat: round space;
background-repeat: no-repeat round;

/* Giá trị toàn cục */
background-repeat: inherit;
background-repeat: initial;
background-repeat: revert;
background-repeat: revert-layer;
background-repeat: unset;
```

## Mô tả

Thuộc tính chấp nhận danh sách phân cách bằng dấu phẩy gồm hai từ khóa [`<repeat-style>`](#giá-trị), hoặc một từ khóa làm viết tắt cho hai giá trị. Khi hai giá trị được cung cấp, giá trị đầu tiên định nghĩa hành vi lặp ngang và giá trị thứ hai định nghĩa hành vi dọc.
Các giá trị thuộc tính có thể được sử dụng để chỉ lặp theo chiều ngang, chiều dọc, hoặc không lặp gì cả.

Giá trị mặc định là `repeat repeat`. Với giá trị này, ảnh nền duy trì {{glossary("aspect ratio")}} nội tại của nó, lặp lại cả theo chiều ngang và chiều dọc để bao phủ toàn bộ vùng vẽ nền, với ảnh ở cạnh bị cắt theo kích thước của phần tử. Cạnh nào bị cắt phụ thuộc vào giá trị {{cssxref("background-position")}} tương ứng. Số lần lặp lại và mức độ cắt ảnh ở cạnh phụ thuộc vào kích thước vùng vẽ nền và giá trị {{cssxref("background-size")}} tương ứng.

Các ảnh lặp lại có thể được phân cách đều nhau, đảm bảo ảnh lặp duy trì tỷ lệ khung hình mà không bị cắt. Với giá trị `space`, nếu vùng vẽ nền có tỷ lệ khung hình khác với ảnh hoặc không có kích thước là bội số của kích thước nền theo bất kỳ hướng nào, sẽ có vùng không được bao phủ bởi ảnh nền.

Ngoài ra, ảnh nền lặp lại có thể được kéo giãn để bao phủ toàn bộ vùng mà không bị cắt. Với `round`, ảnh lặp được kéo giãn để lấp đầy toàn bộ không gian có sẵn cho đến khi có đủ chỗ để thêm một ảnh lặp thêm nếu tỷ lệ khung hình của ảnh nền không giống với tỷ lệ khung hình của vùng vẽ. Ví dụ, cho một ảnh nền 100px x 100px và vùng vẽ nền 1099px x 750px, ảnh sẽ được lặp 10 lần theo chiều ngang và 7 lần theo chiều dọc, tổng cộng 70 lần lặp, với mỗi ảnh được kéo giãn theo cả hai hướng để là 109.9px x 105px, thay đổi tỷ lệ khung hình của ảnh và có thể làm méo nó. Nếu chiều rộng của vùng vẽ tăng thêm 1px, trở thành 1100px, ảnh thứ 11 sẽ vừa theo chiều ngang cho tổng cộng 77 lần lặp ảnh, với mỗi ảnh được vẽ rộng 100px và cao 105px, chỉ kéo giãn theo chiều dọc.

## Giá trị

Thuộc tính chấp nhận danh sách phân cách bằng dấu phẩy gồm hai từ khóa `<repeat-style>` hoặc một từ khóa làm viết tắt cho hai giá trị. Giá trị đầu tiên là sự lặp ngang. Giá trị thứ hai là hành vi dọc. Nếu chỉ một giá trị được đặt thành giá trị khác `repeat-x` hoặc `repeat-y`, giá trị đó được áp dụng cho cả hai chiều. Các giá trị bao gồm:

- `repeat`
  - : Giá trị mặc định. Ảnh được lặp lại nhiều lần khi cần để bao phủ toàn bộ vùng vẽ ảnh nền, với ảnh ở cạnh bị cắt nếu kích thước vùng vẽ không phải bội số của kích thước ảnh nền.

- `no-repeat`
  - : Ảnh không được lặp lại (và do đó vùng vẽ ảnh nền sẽ không nhất thiết được bao phủ hoàn toàn). Vị trí của ảnh nền không lặp được định nghĩa bởi thuộc tính CSS {{cssxref("background-position")}}.

- `space`
  - : Ảnh được lặp lại nhiều nhất có thể mà không cắt. Ảnh đầu và cuối được ghim vào một trong hai bên của phần tử, và khoảng trắng được phân phối đều giữa các ảnh. Thuộc tính {{cssxref("background-position")}} bị bỏ qua trừ khi chỉ có một ảnh có thể được hiển thị mà không cắt. Trường hợp duy nhất cắt xảy ra khi sử dụng `space` là khi không đủ chỗ để hiển thị một ảnh.

- `round`
  - : Khi không gian cho phép tăng kích thước, các ảnh lặp sẽ kéo giãn (không để khoảng trống) cho đến khi có chỗ để thêm một ảnh nữa. Đây là giá trị `<repeat-style>` duy nhất có thể dẫn đến biến dạng {{glossary("aspect ratio")}} của ảnh nền, điều này sẽ xảy ra nếu tỷ lệ khung hình của ảnh nền khác với tỷ lệ khung hình của vùng vẽ nền.

- `repeat-x`
  - : Viết tắt cho `repeat no-repeat`, ảnh nền chỉ lặp theo chiều ngang, với ảnh ở cạnh bị cắt nếu chiều rộng vùng vẽ không phải bội số của chiều rộng ảnh nền.

- `repeat-y`
  - : Viết tắt cho `no-repeat repeat`, ảnh nền chỉ lặp theo chiều dọc, với ảnh ở cạnh bị cắt nếu chiều cao vùng vẽ không phải bội số của chiều cao ảnh nền.

Khi một từ khóa `<repeat-style>` được cung cấp, giá trị là viết tắt cho cú pháp hai giá trị sau:

| Giá trị đơn | Tương đương hai giá trị |
| ----------- | ----------------------- |
| `repeat-x`  | `repeat no-repeat`      |
| `repeat-y`  | `no-repeat repeat`      |
| `repeat`    | `repeat repeat`         |
| `space`     | `space space`           |
| `round`     | `round round`           |
| `no-repeat` | `no-repeat no-repeat`   |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt background-repeat

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
    repeat-x
    <div class="three"></div>
  </li>
  <li>
    repeat-y
    <div class="four"></div>
  </li>
  <li>
    space
    <div class="five"></div>
  </li>
  <li>
    round
    <div class="six"></div>
  </li>
  <li>
    repeat-x, repeat-y (multiple images)
    <div class="seven"></div>
  </li>
</ol>
```

#### CSS

```css
/* Shared for all DIVS in example */
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
  background-repeat: no-repeat;
}
.two {
  background-repeat: repeat;
}
.three {
  background-repeat: repeat-x;
}
.four {
  background-repeat: repeat-y;
}
.five {
  background-repeat: space;
}
.six {
  background-repeat: round;
}

/* Multiple images */
.seven {
  background-image:
    url("star-solid.gif"), url("/shared-assets/images/examples/favicon32.png");
  background-repeat: repeat-x, repeat-y;
  height: 144px;
}
```

#### Kết quả

Trong ví dụ này, mỗi mục danh sách được khớp với một giá trị khác nhau của `background-repeat`.

{{EmbedLiveSample('Setting_background-repeat', 240, 560)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thành phần viết tắt {{cssxref("background")}} khác: {{cssxref("background-attachment")}}, {{cssxref("background-clip")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-origin")}}, {{cssxref("background-position")}} ({{cssxref("background-position-x")}} và {{cssxref("background-position-y")}}), và {{cssxref("background-size")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- [Mô-đun nền và viền CSS](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Hiểu tỷ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
