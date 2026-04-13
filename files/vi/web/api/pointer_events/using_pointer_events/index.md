---
title: Sử dụng Pointer Events
slug: Web/API/Pointer_events/Using_Pointer_Events
page-type: guide
---

{{DefaultAPISidebar("Pointer Events")}}

Hướng dẫn này trình bày cách sử dụng [pointer events](/en-US/docs/Web/API/Pointer_events) và giao diện HTML5 {{domxref("PointerEvent")}} để xây dựng ứng dụng xử lý đầu vào đa điểm.

## Thuật ngữ

- Bề mặt kích hoạt
  - : Bề mặt nhạy cảm với cảm ứng. Đây có thể là màn hình hoặc trackpad.
- Điểm chạm
  - : Điểm tiếp xúc với bề mặt. Đây có thể là ngón tay (hoặc khuỷu tay, tai, mũi, bút cảm ứng, v.v.) hoặc chuột.

## Ví dụ

### Vẽ đơn giản

Ví dụ này minh họa cách xử lý pointer events để cho phép vẽ bằng nhiều loại thiết bị.

```html
<canvas id="canvas" width="400" height="400" style="border: 1px solid black;">
</canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Map để theo dõi các con trỏ đang hoạt động
const activePointers = new Map();

canvas.addEventListener("pointerdown", (ev) => {
  activePointers.set(ev.pointerId, { x: ev.clientX, y: ev.clientY });
  ctx.beginPath();
  ctx.arc(
    ev.clientX - canvas.offsetLeft,
    ev.clientY - canvas.offsetTop,
    3,
    0,
    Math.PI * 2,
  );
  ctx.fill();
});

canvas.addEventListener("pointermove", (ev) => {
  if (!activePointers.has(ev.pointerId)) return;

  const prev = activePointers.get(ev.pointerId);
  ctx.beginPath();
  ctx.moveTo(prev.x - canvas.offsetLeft, prev.y - canvas.offsetTop);
  ctx.lineTo(ev.clientX - canvas.offsetLeft, ev.clientY - canvas.offsetTop);
  ctx.stroke();

  activePointers.set(ev.pointerId, { x: ev.clientX, y: ev.clientY });
});

canvas.addEventListener("pointerup", (ev) => {
  activePointers.delete(ev.pointerId);
});

canvas.addEventListener("pointercancel", (ev) => {
  activePointers.delete(ev.pointerId);
});
```

## Chụp con trỏ (Pointer Capture)

Khi con trỏ được chụp, các sự kiện con trỏ sẽ được chuyển đến phần tử đã chụp ngay cả khi con trỏ di chuyển ra ngoài phần tử đó.

```js
element.addEventListener("pointerdown", (ev) => {
  element.setPointerCapture(ev.pointerId);
});

element.addEventListener("pointermove", (ev) => {
  // Sự kiện này tiếp tục kích hoạt ngay cả khi con trỏ ở ngoài phần tử
  const rect = element.getBoundingClientRect();
  const x = ev.clientX - rect.left;
  const y = ev.clientY - rect.top;
  element.style.left = x + "px";
  element.style.top = y + "px";
});

element.addEventListener("pointerup", (ev) => {
  element.releasePointerCapture(ev.pointerId);
});
```

## Ngăn sự kiện chuột mô phỏng

Để ngăn trình duyệt kích hoạt thêm sự kiện chuột sau sự kiện con trỏ, sử dụng `event.preventDefault()`:

```js
element.addEventListener("pointermove", (ev) => {
  ev.preventDefault();
  // Xử lý sự kiện con trỏ
});
```

## Xem thêm

- [Pointer events](/en-US/docs/Web/API/Pointer_events)
- {{domxref("PointerEvent")}}
- {{domxref("Element.setPointerCapture()")}}
