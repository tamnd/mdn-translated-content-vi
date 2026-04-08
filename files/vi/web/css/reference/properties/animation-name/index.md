---
title: animation-name
slug: Web/CSS/Reference/Properties/animation-name
page-type: css-property
browser-compat: css.properties.animation-name
sidebar: cssref
---

Thuộc tính **`animation-name`** trong [CSS](/en-US/docs/Web/CSS) chỉ định tên của một hoặc nhiều quy tắc at-rule {{cssxref("@keyframes")}} mô tả hoạt ảnh cần áp dụng cho phần tử. Nhiều quy tắc at-rule `@keyframes` được chỉ định dưới dạng danh sách tên phân cách bằng dấu phẩy. Nếu tên được chỉ định không khớp với bất kỳ quy tắc at-rule `@keyframes` nào, sẽ không có thuộc tính nào được tạo hoạt ảnh.

Thường tiện lợi khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để đặt tất cả các thuộc tính hoạt ảnh cùng một lúc.

{{InteractiveExample("CSS Demo: animation-name")}}

```css interactive-example-choice
animation-name: none;
```

```css interactive-example-choice
animation-name: slide;
```

```css interactive-example-choice
animation-name: bounce;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div class="animating" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  animation-direction: alternate;
  animation-duration: 1s;
  animation-iteration-count: infinite;
  animation-timing-function: ease-in;
  background-color: #1766aa;
  border-radius: 50%;
  border: 5px solid #333333;
  color: white;
  height: 150px;
  margin: auto;
  margin-left: 0;
  width: 150px;
}

@keyframes slide {
  from {
    background-color: orange;
    color: black;
    margin-left: 0;
  }
  to {
    background-color: orange;
    color: black;
    margin-left: 80%;
  }
}

@keyframes bounce {
  from {
    background-color: orange;
    color: black;
    margin-top: 0;
  }
  to {
    background-color: orange;
    color: black;
    margin-top: 40%;
  }
}
```

## Cú pháp

```css
/* Không có hoạt ảnh */
animation-name: none;

/* Một hoạt ảnh */
animation-name: test_05;
animation-name: -specific;
animation-name: "sliding-vertically";

/* Nhiều hoạt ảnh */
animation-name: test1, animation4;
animation-name:
  none,
  -moz-specific,
  sliding;

/* Giá trị toàn cục */
animation-name: inherit;
animation-name: initial;
animation-name: revert;
animation-name: revert-layer;
animation-name: unset;
```

### Giá trị

- `none`
  - : Từ khóa đặc biệt biểu thị không có keyframe. Có thể dùng để tắt hoạt ảnh mà không thay đổi thứ tự của các định danh khác, hoặc để vô hiệu hóa các hoạt ảnh đến từ cascade.
- {{cssxref("&lt;custom-ident&gt;")}}
  - : Tên không được đặt trong dấu ngoặc kép để xác định hoạt ảnh. Định danh này được tạo thành từ sự kết hợp của các chữ cái phân biệt hoa thường `a` đến `z`, số `0` đến `9`, dấu gạch dưới (`_`), và/hoặc dấu gạch ngang (`-`). Ký tự đầu tiên không phải dấu gạch ngang phải là chữ cái. Ngoài ra, không được có hai dấu gạch ngang ở đầu định danh. Hơn nữa, định danh không được là `none`, `unset`, `initial`, hoặc `inherit`.
- {{cssxref("&lt;string&gt;")}}
  - : Một chuỗi ký tự tuân theo các quy tắc giống như định danh tùy chỉnh, như mô tả ở trên, ngoại trừ chúng được bao quanh bởi dấu ngoặc kép (`"`) hoặc dấu nháy đơn (`'`). Nếu dùng chuỗi có dấu ngoặc kép cho cả `animation-name` và tên quy tắc at-rule {{cssxref("@keyframes")}} tương ứng, `none`, các từ khóa toàn cục, và tên bắt đầu bằng dấu gạch dưới hoặc hai dấu gạch ngang đều hợp lệ, dù không được khuyến khích.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị phân cách bằng dấu phẩy trên một thuộc tính `animation-*`, chúng được áp dụng cho các hoạt ảnh theo thứ tự xuất hiện của `animation-name`. Đối với các trường hợp số lượng hoạt ảnh và giá trị thuộc tính `animation-*` không khớp, hãy xem [Đặt nhiều giá trị thuộc tính hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt tên cho hoạt ảnh

Hoạt ảnh này có `animation-name` là `rotate`.

#### HTML

```html
<div class="box"></div>
```

#### CSS

```css
.box {
  background-color: rebeccapurple;
  border-radius: 10px;
  width: 100px;
  height: 100px;
}

.box:hover {
  animation-name: rotate;
  animation-duration: 0.7s;
}

@keyframes rotate {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
```

#### Kết quả

Di chuột qua hình chữ nhật để bắt đầu hoạt ảnh.

{{EmbedLiveSample("Naming an animation","100%","250")}}

Xem [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using)
- API JavaScript {{domxref("AnimationEvent")}}
- Các thuộc tính hoạt ảnh liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
