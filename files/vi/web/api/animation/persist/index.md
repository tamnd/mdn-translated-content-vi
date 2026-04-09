---
title: "Animation: phương thức persist()"
short-title: persist()
slug: Web/API/Animation/persist
page-type: web-api-instance-method
browser-compat: api.Animation.persist
---

{{APIRef("Web Animations")}}

Phương thức `persist()` của giao diện {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) lưu giữ hoạt ảnh một cách tường minh, ngăn nó bị [tự động loại bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations) khi bị thay thế bởi một hoạt ảnh khác.

## Cú pháp

```js-nolint
persist()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng `persist()`

Trong ví dụ này, chúng ta có ba nút:

- "Add persistent animation" và "Add transient animation" mỗi nút thêm một hoạt ảnh biến đổi mới vào hình vuông đỏ. Các hoạt ảnh luân phiên đổi hướng: vì vậy hoạt ảnh đầu tiên đi từ trái sang phải, hoạt ảnh thứ hai đi từ phải sang trái, v.v. "Add persistent animation" gọi `persist()` trên hoạt ảnh mà nó tạo ra.

- Nút thứ ba, "Cancel an animation", hủy hoạt ảnh được thêm gần đây nhất.

Ví dụ hiển thị danh sách tất cả hoạt ảnh chưa bị hủy, theo đúng thứ tự chúng được thêm vào, cùng với `replaceState` của từng hoạt ảnh.

#### HTML

```html
<div id="animation-target"></div>
<button id="start-persistent">Add persistent animation</button>
<button id="start-transient">Add transient animation</button>
<button id="cancel">Cancel an animation</button>
<ol id="stack"></ol>
```

```html hidden
<template id="list-item-template">
  <li>
    <span class="replaceState"></span>,
    <span class="description"></span>
  </li>
</template>
```

#### CSS

```css
div {
  width: 100px;
  height: 100px;
  background: red;
  transform: translate(100px);
}
```

#### JavaScript

```js
const target = document.getElementById("animation-target");
const persistentButton = document.getElementById("start-persistent");
const transientButton = document.getElementById("start-transient");
const cancelButton = document.getElementById("cancel");
persistentButton.addEventListener("click", () => startAnimation(true));
transientButton.addEventListener("click", () => startAnimation(false));
cancelButton.addEventListener("click", cancelTop);
const stack = [];

let offset = -100;

function startAnimation(persist) {
  offset = -offset;
  const animation = target.animate(
    { transform: `translate(${100 + offset}px)` },
    { duration: 500, fill: "forwards" },
  );
  stack.push(animation);
  if (persist) {
    animation.persist();
  }
  // Add the animation to the displayed stack (implementation not shown)
  show(animation, offset);
}

function cancelTop() {
  stack.pop()?.cancel();
}
```

```js hidden
const stackDisplay = document.getElementById("stack");
const template =
  document.getElementById("list-item-template").content.firstElementChild;
const nodes = new Map();

function show(animation, offset) {
  const direction = offset < 0 ? "left" : "right";
  const li = template.cloneNode(true);
  const description = li.querySelector(".description");
  const replaceState = li.querySelector(".replaceState");
  description.textContent = direction;
  replaceState.textContent = animation.replaceState;
  nodes.set(animation, { li, description, replaceState });
  stackDisplay.append(li);
  animation.addEventListener("cancel", () => {
    nodes.get(animation).li.remove();
    nodes.delete(animation);
  });
  animation.addEventListener("remove", () => {
    nodes.get(animation).replaceState.textContent = animation.replaceState;
  });
}
```

#### Kết quả

Lưu ý rằng việc thêm một hoạt ảnh tạm thời mới sẽ thay thế mọi hoạt ảnh tạm thời đã thêm trước đó. Những hoạt ảnh đó sẽ bị tự động loại bỏ, và `replaceState` của chúng sẽ là `"removed"`. Tuy nhiên, các hoạt ảnh được lưu giữ sẽ không bị loại bỏ.

Cũng lưu ý rằng các hoạt ảnh đã bị loại bỏ không ảnh hưởng tới phần hiển thị; vị trí của {{htmlelement("div")}} được xác định bởi hoạt ảnh đang hoạt động hoặc đã được lưu giữ gần đây nhất.

{{EmbedLiveSample("using_persist","",300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.
- {{domxref("Animation.replaceState")}}
- Sự kiện {{domxref("Animation.remove_event","remove")}}
