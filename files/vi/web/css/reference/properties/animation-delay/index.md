---
title: animation-delay
slug: Web/CSS/Reference/Properties/animation-delay
page-type: css-property
browser-compat: css.properties.animation-delay
sidebar: cssref
---

Thuộc tính **`animation-delay`** [CSS](/en-US/docs/Web/CSS) chỉ định lượng thời gian chờ từ khi áp dụng animation cho một phần tử trước khi bắt đầu thực hiện animation. Animation có thể bắt đầu muộn hơn, ngay lập tức từ đầu, hoặc ngay lập tức và ở giữa animation.

Thường thuận tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("animation")}} để đặt tất cả các thuộc tính animation cùng một lúc.

{{InteractiveExample("CSS Demo: animation-delay")}}

```css interactive-example-choice
animation-delay: 250ms;
```

```css interactive-example-choice
animation-delay: 2s;
```

```css interactive-example-choice
animation-delay: -2s;
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div>Animation <span id="play-status"></span></div>
  <div id="example-element">Select a delay to start!</div>
</section>
```

```css interactive-example
#example-element {
  background-color: #1766aa;
  color: white;
  margin: auto;
  margin-left: 0;
  border: 5px solid #333333;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

#play-status {
  font-weight: bold;
}

.animating {
  animation-name: slide;
  animation-duration: 3s;
  animation-timing-function: ease-in;
  animation-iteration-count: 2;
  animation-direction: alternate;
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
const status = document.getElementById("play-status");

function update() {
  status.textContent = "delaying";
  el.className = "";
  window.requestAnimationFrame(() => {
    window.requestAnimationFrame(() => {
      el.className = "animating";
    });
  });
}

el.addEventListener("animationstart", () => {
  status.textContent = "playing";
});

el.addEventListener("animationend", () => {
  status.textContent = "finished";
});

const observer = new MutationObserver(() => {
  update();
});

observer.observe(el, {
  attributes: true,
  attributeFilter: ["style"],
});

update();
```

## Cú pháp

```css
/* Animation đơn */
animation-delay: 3s;
animation-delay: 0s;
animation-delay: -1500ms;

/* Nhiều animation */
animation-delay: 2.1s, 480ms;

/* Giá trị toàn cục */
animation-delay: inherit;
animation-delay: initial;
animation-delay: revert;
animation-delay: revert-layer;
animation-delay: unset;
```

### Giá trị

- {{cssxref("&lt;time&gt;")}}
  - : Độ lệch thời gian, từ thời điểm animation được áp dụng cho phần tử, tại đó animation sẽ bắt đầu. Giá trị này có thể được chỉ định bằng giây (`s`) hoặc mili giây (`ms`). Đơn vị là bắt buộc.

    Giá trị dương cho biết animation sẽ bắt đầu sau khi đã trôi qua khoảng thời gian được chỉ định. Giá trị `0s`, là giá trị mặc định, cho biết animation sẽ bắt đầu ngay khi được áp dụng.

    Giá trị âm khiến animation bắt đầu ngay lập tức, nhưng ở giữa chu kỳ của nó. Ví dụ, nếu bạn chỉ định `-1s` làm thời gian trễ animation, animation sẽ bắt đầu ngay lập tức nhưng sẽ bắt đầu từ giây thứ 1 trong chuỗi animation. Nếu bạn chỉ định giá trị âm cho thời gian trễ animation, nhưng giá trị bắt đầu là ngầm định, giá trị bắt đầu được lấy từ thời điểm animation được áp dụng cho phần tử.

> [!NOTE]
> Khi bạn chỉ định nhiều giá trị được phân tách bằng dấu phẩy trên thuộc tính `animation-*`, chúng được áp dụng cho các animation theo thứ tự xuất hiện của {{cssxref("animation-name")}}. Đối với các tình huống mà số lượng animation và giá trị thuộc tính `animation-*` không khớp, hãy xem [Setting multiple animation property values](/en-US/docs/Web/CSS/Guides/Animations/Using#setting_multiple_animation_property_values).

> [!NOTE]
> `animation-delay` không có hiệu lực đối với [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt thời gian trễ animation

Animation này có thời gian trễ là 2 giây.

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
  animation-delay: 2s;
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

{{EmbedLiveSample("Setting an animation delay","100%","250")}}

Xem [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using) để biết thêm ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- JavaScript {{domxref("AnimationEvent")}} API
- Các thuộc tính animation liên quan khác: {{cssxref("animation")}}, {{cssxref("animation-composition")}}, {{cssxref("animation-direction")}}, {{cssxref("animation-duration")}}, {{cssxref("animation-fill-mode")}}, {{cssxref("animation-iteration-count")}}, {{cssxref("animation-name")}}, {{cssxref("animation-play-state")}}, {{cssxref("animation-timeline")}}, {{cssxref("animation-timing-function")}}
