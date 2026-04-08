---
title: animation-duration
slug: Web/CSS/Reference/Properties/animation-duration
page-type: css-property
browser-compat: css.properties.animation-duration
sidebar: cssref
---

Thuộc tính **`animation-duration`** [CSS](/en-US/docs/Web/CSS) đặt độ dài thời gian một animation cần để hoàn thành một chu kỳ.

Thường thuận tiện hơn khi sử dụng thuộc tính viết tắt {{ cssxref("animation") }} để đặt tất cả các thuộc tính animation cùng một lúc.

{{InteractiveExample("CSS Demo: animation-duration")}}

```css interactive-example-choice
animation-duration: 750ms;
```

```css interactive-example-choice
animation-duration: 3s;
```

```css interactive-example-choice
animation-duration: 0s;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div class="animating" id="example-element"></div>
  <button id="play-pause">Play</button>
</section>
```

```css interactive-example
#example-element {
  animation-direction: alternate;
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
animation-duration: auto; /* Mặc định */
animation-duration: 6s;
animation-duration: 120ms;

/* Nhiều animation */
animation-duration: 1.64s, 15.22s;
animation-duration: 10s, 35s, 230ms;

/* Giá trị toàn cục */
animation-duration: inherit;
animation-duration: initial;
animation-duration: revert;
animation-duration: revert-layer;
animation-duration: unset;
```

### Giá trị

- `auto`
  - : Đối với animation dựa trên thời gian, `auto` tương đương với giá trị `0s` (xem bên dưới). Đối với [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), `auto` lấp đầy toàn bộ timeline bằng animation.

- {{cssxref("&lt;time&gt;")}}
  - : Thời gian để animation hoàn thành một chu kỳ. Có thể được chỉ định bằng giây (`s`) hoặc mili giây (`ms`). Giá trị phải là dương hoặc bằng không và đơn vị là bắt buộc.

    Nếu không có giá trị nào được cung cấp, giá trị mặc định `0s` được sử dụng, trong trường hợp này animation vẫn thực thi (các sự kiện [`animationStart`](/en-US/docs/Web/API/Element/animationstart_event) và [`animationEnd`](/en-US/docs/Web/API/Element/animationend_event) được kích hoạt). Liệu animation có hiển thị khi duration là `0s` hay không sẽ phụ thuộc vào giá trị của {{cssxref("animation-fill-mode")}}, như được giải thích bên dưới:
    - Nếu `animation-fill-mode` được đặt thành `backwards` hoặc `both`, frame đầu tiên của animation như được định nghĩa bởi `animation-direction` sẽ được hiển thị trong thời gian đếm ngược {{cssxref("animation-delay")}}.
    - Nếu `animation-fill-mode` được đặt thành `forwards` hoặc `both`, frame cuối cùng của animation sẽ được hiển thị, như được định nghĩa bởi `animation-direction`, sau khi `animation-delay` hết hạn.
    - Nếu `animation-fill-mode` được đặt thành `none`, animation sẽ không có hiệu ứng hiển thị.

> [!NOTE]
> Giá trị âm là không hợp lệ, khiến khai báo bị bỏ qua. Một số triển khai tiền tố sớm có thể coi chúng giống như `0s`.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị được phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng được áp dụng cho các animation theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các tình huống mà số lượng animation và giá trị thuộc tính `animation-*` không khớp, hãy xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> Khi tạo [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations), việc chỉ định giá trị `animation-duration` bằng giây hoặc mili giây thực sự không có ý nghĩa. Trong các thử nghiệm, có vẻ không có hiệu lực đối với animation scroll progress timeline, trong khi đối với animation view progress timeline có vẻ đẩy animation xảy ra gần cuối timeline hơn. Tuy nhiên, Firefox yêu cầu phải đặt `animation-duration` để áp dụng animation thành công. Do đó, bạn nên đặt `animation-duration` thành `1ms` để animation hoạt động trong Firefox, nhưng hiệu ứng không bị thay đổi quá nhiều bởi điều đó.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt thời lượng animation

Animation này có animation-duration là 0.7 giây.

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

Di chuột qua hình chữ nhật để bắt đầu animation.

{{EmbedLiveSample("Setting animation duration","100%","250")}}

Xem [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- JavaScript {{domxref("AnimationEvent")}} API
- Các thuộc tính animation liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-delay")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
