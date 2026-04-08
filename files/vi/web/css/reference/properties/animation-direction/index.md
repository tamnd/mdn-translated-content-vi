---
title: animation-direction
slug: Web/CSS/Reference/Properties/animation-direction
page-type: css-property
browser-compat: css.properties.animation-direction
sidebar: cssref
---

Thuộc tính **`animation-direction`** [CSS](/en-US/docs/Web/CSS) đặt xem animation có nên phát tiến, phát lùi, hay luân phiên giữa phát tiến và phát lùi.

Thường thuận tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để đặt tất cả các thuộc tính animation cùng một lúc.

{{InteractiveExample("CSS Demo: animation-direction")}}

```css interactive-example-choice
animation-direction: normal;
```

```css interactive-example-choice
animation-direction: reverse;
```

```css interactive-example-choice
animation-direction: alternate;
```

```css interactive-example-choice
animation-direction: alternate-reverse;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div id="example-element"></div>
  <button id="play-pause">Play</button>
</section>
```

```css interactive-example
#example-element {
  animation-duration: 3s;
  animation-iteration-count: infinite;
  animation-name: slide;
  animation-play-state: paused;
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

#example-element.running {
  animation-play-state: running;
}

#play-pause {
  font-size: 2rem;
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
```

```js interactive-example
const el = document.getElementById("example-element");
const button = document.getElementById("play-pause");

button.addEventListener("click", () => {
  if (el.classList.contains("running")) {
    el.classList.remove("running");
    button.textContent = "Play";
  } else {
    el.classList.add("running");
    button.textContent = "Pause";
  }
});
```

## Cú pháp

```css
/* Animation đơn */
animation-direction: normal;
animation-direction: reverse;
animation-direction: alternate;
animation-direction: alternate-reverse;

/* Nhiều animation */
animation-direction: normal, reverse;
animation-direction: alternate, reverse, normal;

/* Giá trị toàn cục */
animation-direction: inherit;
animation-direction: initial;
animation-direction: revert;
animation-direction: revert-layer;
animation-direction: unset;
```

### Giá trị

- `normal`
  - : Animation phát _tiến_ mỗi chu kỳ. Nói cách khác, mỗi lần animation lặp lại, animation sẽ reset về trạng thái ban đầu và bắt đầu lại. Đây là giá trị mặc định.
- `reverse`
  - : Animation phát _lùi_ mỗi chu kỳ. Nói cách khác, mỗi lần animation lặp lại, animation sẽ reset về trạng thái kết thúc và bắt đầu lại. Các bước animation được thực hiện ngược lại, và các hàm easing cũng bị đảo ngược. Ví dụ, hàm easing `ease-in` trở thành `ease-out`.
- `alternate`
  - : Animation đảo ngược hướng mỗi chu kỳ, với lần lặp đầu tiên được phát _tiến_. Số đếm để xác định xem một chu kỳ là chẵn hay lẻ bắt đầu từ một.
- `alternate-reverse`
  - : Animation đảo ngược hướng mỗi chu kỳ, với lần lặp đầu tiên được phát _lùi_. Số đếm để xác định xem một chu kỳ là chẵn hay lẻ bắt đầu từ một.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị được phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng được áp dụng cho các animation theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các tình huống mà số lượng animation và giá trị thuộc tính `animation-*` không khớp, hãy xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> Khi tạo [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), việc chỉ định `animation-direction` hoạt động như mong đợi, ví dụ `reverse` khiến animation chạy ngược lại trong quá trình tiến triển của timeline. Giá trị `alternate` (kết hợp với {{cssxref("animation-iteration-count")}}) khiến animation chạy tiến và lùi khi timeline được tiến triển.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đảo ngược hướng animation

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
  animation-direction: reverse;
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

{{EmbedLiveSample("Reversing the animation direction","100%","250")}}

Xem [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- JavaScript {{domxref("AnimationEvent")}} API
- Các thuộc tính animation liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
