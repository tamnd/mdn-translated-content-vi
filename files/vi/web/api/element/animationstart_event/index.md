---
title: "Element: sự kiện animationstart"
short-title: animationstart
slug: Web/API/Element/animationstart_event
page-type: web-api-event
browser-compat: api.Element.animationstart_event
---

{{APIRef("Web Animations")}}

Sự kiện **`animationstart`** được kích hoạt khi một [CSS Animation](/en-US/docs/Web/CSS/Guides/Animations) đã bắt đầu. Nếu có {{cssxref("animation-delay")}}, sự kiện này sẽ được kích hoạt sau khi khoảng thời gian trễ đã hết. Một giá trị trễ âm sẽ khiến sự kiện được kích hoạt với {{domxref("AnimationEvent/elapsedTime", "elapsedTime")}} bằng giá trị tuyệt đối của độ trễ (và tương ứng, hoạt ảnh sẽ bắt đầu phát tại chỉ số thời gian đó trong chuỗi).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("animationstart", (event) => { })

onanimationstart = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("AnimationEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("AnimationEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ {{domxref("Event")}} cha_.

- {{domxref("AnimationEvent.animationName")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa giá trị của {{cssxref("animation-name")}} đã tạo ra hoạt ảnh.
- {{domxref("AnimationEvent.elapsedTime")}} {{ReadOnlyInline}}
  - : Một `float` cho biết khoảng thời gian hoạt ảnh đã chạy, tính bằng giây, khi sự kiện này được kích hoạt, loại trừ bất kỳ thời gian nào hoạt ảnh bị tạm dừng. Đối với sự kiện `animationstart`, `elapsedTime` là `0.0` trừ khi có giá trị âm cho {{cssxref("animation-delay")}}, trong trường hợp đó sự kiện sẽ được kích hoạt với `elapsedTime` chứa `(-1 * delay)`.
- {{domxref("AnimationEvent.pseudoElement")}} {{ReadOnlyInline}}
  - : Một chuỗi, bắt đầu bằng `'::'`, chứa tên của [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó. Nếu hoạt ảnh không chạy trên pseudo-element mà trên phần tử, là một chuỗi rỗng: `''`.

## Ví dụ

Đoạn mã này lắng nghe sự kiện `animationstart` và ghi lại thông báo khi nó được kích hoạt:

```js
const animated = document.querySelector(".animated");

animated.addEventListener("animationstart", () => {
  console.log("Animation started");
});
```

Tương tự, nhưng sử dụng `onanimationstart`:

```js
const animated = document.querySelector(".animated");

animated.onanimationstart = () => {
  console.log("Animation started");
};
```

### Ví dụ trực tiếp

#### HTML

```html
<div class="animation-example">
  <div class="container">
    <p class="animation">You chose a cold night to visit our planet.</p>
  </div>
  <button class="activate" type="button">Activate animation</button>
  <div class="event-log"></div>
</div>
```

#### CSS

```css
.container {
  height: 3rem;
}

.event-log {
  width: 25rem;
  height: 2rem;
  border: 1px solid black;
  margin: 0.2rem;
  padding: 0.2rem;
}

.animation.active {
  animation-duration: 2s;
  animation-name: slide-in;
  animation-iteration-count: 2;
}

@keyframes slide-in {
  from {
    transform: translateX(100%) scaleX(3);
  }
  to {
    transform: translateX(0) scaleX(1);
  }
}
```

#### JavaScript

```js
const animation = document.querySelector("p.animation");
const animationEventLog = document.querySelector(
  ".animation-example>.event-log",
);
const applyAnimation = document.querySelector(
  ".animation-example>button.activate",
);
let iterationCount = 0;

animation.addEventListener("animationstart", () => {
  animationEventLog.textContent = `${animationEventLog.textContent}'animation started' `;
});

animation.addEventListener("animationiteration", () => {
  iterationCount++;
  animationEventLog.textContent = `${animationEventLog.textContent}'animation iterations: ${iterationCount}' `;
});

animation.addEventListener("animationend", () => {
  animationEventLog.textContent = `${animationEventLog.textContent}'animation ended'`;
  animation.classList.remove("active");
  applyAnimation.textContent = "Activate animation";
});

animation.addEventListener("animationcancel", () => {
  animationEventLog.textContent = `${animationEventLog.textContent}'animation canceled'`;
});

applyAnimation.addEventListener("click", () => {
  animation.classList.toggle("active");
  animationEventLog.textContent = "";
  iterationCount = 0;
  const active = animation.classList.contains("active");
  applyAnimation.textContent = active
    ? "Cancel animation"
    : "Activate animation";
});
```

#### Kết quả

{{ EmbedLiveSample('Live_example', '100%', '150px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations)
- [Using CSS Animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- {{domxref("AnimationEvent")}}
- Các sự kiện liên quan: {{domxref("Element/animationend_event", "animationend")}}, {{domxref("Element/animationiteration_event", "animationiteration")}}, {{domxref("Element/animationcancel_event", "animationcancel")}}
