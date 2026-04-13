---
title: "Element: sự kiện animationcancel"
short-title: animationcancel
slug: Web/API/Element/animationcancel_event
page-type: web-api-event
browser-compat: api.Element.animationcancel_event
---

{{APIRef("Web Animations")}}

Sự kiện **`animationcancel`** được kích hoạt khi một [CSS Animation](/en-US/docs/Web/CSS/Guides/Animations) bị hủy bất ngờ. Nói cách khác, bất cứ khi nào nó dừng chạy mà không gửi sự kiện {{domxref("Element/animationend_event", "animationend")}}. Điều này có thể xảy ra khi {{cssxref("animation-name")}} bị thay đổi dẫn đến hoạt ảnh bị xóa, hoặc khi nút đang hoạt ảnh bị ẩn bằng CSS. Do đó, trực tiếp hoặc vì bất kỳ nút chứa nào của nó bị ẩn.

Trình xử lý sự kiện cho sự kiện này có thể được thêm vào bằng cách thiết lập thuộc tính `onanimationcancel`, hoặc sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("animationcancel", (event) => { })

onanimationcancel = (event) => { }
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

Đoạn mã này lấy một phần tử đang được hoạt ảnh và thêm một trình lắng nghe cho sự kiện `animationcancel`. Sau đó thiết lập thuộc tính {{cssxref("display")}} của phần tử thành `none`, điều này sẽ kích hoạt sự kiện `animationcancel`.

```js
const animated = document.querySelector(".animated");

animated.addEventListener("animationcancel", () => {
  console.log("Animation canceled");
});

animated.style.display = "none";
```

Tương tự, nhưng sử dụng thuộc tính `onanimationcancel` thay vì `addEventListener()`:

```js
const animated = document.querySelector(".animated");
animated.onanimationcancel = () => {
  console.log("Animation canceled");
};

animated.style.display = "none";
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
- Các sự kiện liên quan: {{domxref("Element/animationstart_event", "animationstart")}}, {{domxref("Element/animationend_event", "animationend")}}, {{domxref("Element/animationiteration_event", "animationiteration")}}
