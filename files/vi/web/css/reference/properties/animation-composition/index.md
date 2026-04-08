---
title: animation-composition
slug: Web/CSS/Reference/Properties/animation-composition
page-type: css-property
browser-compat: css.properties.animation-composition
sidebar: cssref
---

Thuộc tính **`animation-composition`** [CSS](/en-US/docs/Web/CSS) chỉ định {{Glossary("composite operation")}} để sử dụng khi nhiều animation ảnh hưởng đến cùng một thuộc tính đồng thời.

## Cú pháp

```css
/* Animation đơn */
animation-composition: replace;
animation-composition: add;
animation-composition: accumulate;

/* Nhiều animation */
animation-composition: replace, add;
animation-composition: add, accumulate;
animation-composition: replace, add, accumulate;

/* Giá trị toàn cục */
animation-composition: inherit;
animation-composition: initial;
animation-composition: revert;
animation-composition: revert-layer;
animation-composition: unset;
```

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị được phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng sẽ được áp dụng cho các animation theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Nếu số lượng animation và composition khác nhau, các giá trị được liệt kê trong thuộc tính `animation-composition` sẽ được lặp từ giá trị đầu tiên đến cuối cùng `animation-name`, lặp lại cho đến khi tất cả các animation có giá trị `animation-composition` được gán. Để biết thêm thông tin, hãy xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

### Giá trị

- `replace`
  - : Giá trị hiệu ứng ghi đè giá trị cơ sở của thuộc tính. Đây là giá trị mặc định.
- `add`
  - : Giá trị hiệu ứng được xây dựng trên giá trị cơ sở của thuộc tính. Hoạt động này tạo ra hiệu ứng cộng. Đối với các loại animation mà phép cộng không có tính giao hoán, thứ tự các toán hạng là giá trị cơ sở theo sau là giá trị hiệu ứng.
- `accumulate`
  - : Các giá trị hiệu ứng và cơ sở được kết hợp. Đối với các loại animation mà phép cộng không có tính giao hoán, thứ tự các toán hạng là giá trị cơ sở theo sau là giá trị hiệu ứng.

## Mô tả

Mỗi thuộc tính được nhắm đến bởi at-rule [@keyframes](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes) được liên kết với một ngăn xếp hiệu ứng. Giá trị của ngăn xếp hiệu ứng được tính bằng cách kết hợp _giá trị cơ sở_ của thuộc tính trong quy tắc CSS style với _giá trị hiệu ứng_ của thuộc tính đó trong keyframe. Thuộc tính `animation-composition` giúp chỉ định cách kết hợp giá trị cơ sở với giá trị hiệu ứng.

Ví dụ, trong CSS dưới đây, `blur(5px)` là giá trị cơ sở và `blur(10px)` là giá trị hiệu ứng. Thuộc tính `animation-composition` chỉ định hoạt động cần thực hiện để tạo ra giá trị hiệu ứng cuối cùng sau khi ghép hiệu ứng của giá trị cơ sở và giá trị hiệu ứng.

```css
.icon:hover {
  filter: blur(5px);
  animation: 3s infinite pulse;
  animation-composition: add;
}

@keyframes pulse {
  0% {
    filter: blur(10px);
  }
  100% {
    filter: blur(20px);
  }
}
```

Hãy xem xét các giá trị khác nhau của thuộc tính `animation-composition` trong ví dụ trên. Giá trị hiệu ứng cuối cùng trong mỗi trường hợp đó sẽ được tính như sau:

- Với `replace`, `blur(10px)` sẽ thay thế `blur(5px)` trong keyframe `0%`. Đây là hành vi mặc định của thuộc tính.
- Với `add`, giá trị hiệu ứng composite trong keyframe `0%` sẽ là `blur(5px) blur(10px)`.
- Với `accumulate`, giá trị hiệu ứng composite trong keyframe `0%` sẽ là `blur(15px)`.

> [!NOTE]
> Hoạt động composite cũng có thể được chỉ định trong một keyframe. Trong trường hợp đó, hoạt động composite được chỉ định được sử dụng cho mỗi thuộc tính trước tiên trong keyframe đó và sau đó trên mỗi thuộc tính trong keyframe tiếp theo.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Hiểu các giá trị animation-composition

Ví dụ dưới đây hiển thị tác động của các giá trị `animation-composition` khác nhau cạnh nhau.

#### HTML

```html
<div class="container">
  replace
  <div id="replace" class="target"></div>
</div>
<div class="container">
  add
  <div id="add" class="target"></div>
</div>
<div class="container">
  accumulate
  <div id="accumulate" class="target"></div>
</div>
```

#### CSS

Ở đây giá trị cơ sở là `translateX(50px) rotate(45deg)`.

```css hidden
.container {
  width: 230px;
  height: 200px;
  background: cyan;
  display: inline-block;
  text-align: center;
}

.target {
  width: 20px;
  height: 50px;
  background: green;
  border-radius: 10px;
  margin: 20px 0;
}
```

```css
@keyframes slide {
  20%,
  40% {
    transform: translateX(100px);
    background: yellow;
  }
  80%,
  100% {
    transform: translateX(150px);
    background: orange;
  }
}

.target {
  transform: translateX(30px) rotate(45deg);
  animation: slide 5s linear infinite;
}
.target:hover {
  animation-play-state: paused;
}
#replace {
  animation-composition: replace;
}
#add {
  animation-composition: add;
}
#accumulate {
  animation-composition: accumulate;
}
```

#### Kết quả

{{EmbedLiveSample("Reversing the animation direction","100%","250")}}

- Với `replace`, giá trị hiệu ứng cuối cùng cho thuộc tính `transform` trong keyframe `20%, 40%` là `translateX(100px)` (hoàn toàn thay thế giá trị cơ sở `translateX(30px) rotate(45deg)`). Trong trường hợp này, phần tử xoay từ 45deg đến 0deg khi animate từ giá trị mặc định được đặt trên phần tử sang giá trị không xoay được đặt tại mốc 20%. Đây là hành vi mặc định.
- Với `add`, giá trị hiệu ứng cuối cùng cho thuộc tính `transform` trong keyframe `20%, 40%` là `translateX(30px) rotate(45deg) translateX(100px)`. Vì vậy phần tử được di chuyển 100px sang phải, xoay 45deg quanh gốc, sau đó di chuyển sang phải 30px.
- Với `accumulate`, giá trị hiệu ứng cuối cùng trong keyframe `20%, 40%` là `translateX(130px) rotate(45deg)`. Điều này có nghĩa là hai giá trị dịch trục X `30px` và `100px` được kết hợp hoặc "tích lũy".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- [Composite property of KeyFrameEffect](/en-US/docs/Web/API/KeyframeEffect/composite)
- Các thuộc tính animation liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
