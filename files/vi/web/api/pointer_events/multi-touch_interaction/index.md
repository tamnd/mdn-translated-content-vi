---
title: Tương tác đa chạm
slug: Web/API/Pointer_events/Multi-touch_interaction
page-type: guide
---

{{DefaultAPISidebar("Pointer Events")}}

Pointer events có thể được sử dụng để xử lý các tương tác đa chạm. Hướng dẫn này mô tả cách sử dụng pointer events để hỗ trợ tương tác đa chạm.

## Theo dõi nhiều điểm chạm

Không giống với mouse events, pointer events hỗ trợ nhiều điểm chạm hoạt động đồng thời. Mỗi điểm chạm được xác định bởi thuộc tính `pointerId` duy nhất.

```js
const activePointers = new Map();

element.addEventListener("pointerdown", (ev) => {
  // Lưu trữ thông tin điểm chạm mới
  activePointers.set(ev.pointerId, {
    x: ev.clientX,
    y: ev.clientY,
    type: ev.pointerType,
  });
  console.log(`Active pointers: ${activePointers.size}`);
});

element.addEventListener("pointermove", (ev) => {
  if (!activePointers.has(ev.pointerId)) return;
  // Cập nhật vị trí
  activePointers.set(ev.pointerId, {
    x: ev.clientX,
    y: ev.clientY,
    type: ev.pointerType,
  });
});

element.addEventListener("pointerup", (ev) => {
  activePointers.delete(ev.pointerId);
});

element.addEventListener("pointercancel", (ev) => {
  activePointers.delete(ev.pointerId);
});
```

## Nhận diện cử chỉ kéo

Cử chỉ kéo (pan) di chuyển nội dung theo hướng ngón tay di chuyển.

```js
let startX, startY;
let startScrollX, startScrollY;

element.addEventListener("pointerdown", (ev) => {
  if (activePointers.size === 0) {
    startX = ev.clientX;
    startY = ev.clientY;
    startScrollX = element.scrollLeft;
    startScrollY = element.scrollTop;
  }
  activePointers.set(ev.pointerId, { x: ev.clientX, y: ev.clientY });
  element.setPointerCapture(ev.pointerId);
});

element.addEventListener("pointermove", (ev) => {
  if (activePointers.size === 1) {
    // Một ngón tay: kéo
    const dx = ev.clientX - startX;
    const dy = ev.clientY - startY;
    element.scrollLeft = startScrollX - dx;
    element.scrollTop = startScrollY - dy;
  }
  activePointers.set(ev.pointerId, { x: ev.clientX, y: ev.clientY });
});
```

## Nhận diện cử chỉ kẹp zoom

Cử chỉ kẹp zoom (pinch-to-zoom) dùng hai ngón tay để phóng to/thu nhỏ nội dung.

```js
let initialDistance = null;
let initialScale = 1;
let currentScale = 1;

function getDistance(touches) {
  const [t1, t2] = [...touches.values()];
  return Math.sqrt(Math.pow(t2.x - t1.x, 2) + Math.pow(t2.y - t1.y, 2));
}

element.addEventListener("pointermove", (ev) => {
  activePointers.set(ev.pointerId, { x: ev.clientX, y: ev.clientY });

  if (activePointers.size === 2) {
    const distance = getDistance(activePointers);

    if (initialDistance === null) {
      initialDistance = distance;
      initialScale = currentScale;
    }

    currentScale = initialScale * (distance / initialDistance);
    element.style.transform = `scale(${currentScale})`;
  }
});

element.addEventListener("pointerup", (ev) => {
  activePointers.delete(ev.pointerId);
  if (activePointers.size < 2) {
    initialDistance = null;
  }
});
```

## Xem thêm

- [Pointer events](/en-US/docs/Web/API/Pointer_events)
- [Cử chỉ kẹp zoom](/en-US/docs/Web/API/Pointer_events/Pinch_zoom_gestures)
