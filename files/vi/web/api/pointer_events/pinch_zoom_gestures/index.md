---
title: Cử chỉ kẹp zoom
slug: Web/API/Pointer_events/Pinch_zoom_gestures
page-type: guide
---

{{DefaultAPISidebar("Pointer Events")}}

Hướng dẫn này trình bày cách triển khai **cử chỉ kẹp zoom** sử dụng [pointer events](/en-US/docs/Web/API/Pointer_events). Cử chỉ kẹp zoom là cử chỉ dùng hai ngón tay để phóng to hoặc thu nhỏ nội dung.

## Ví dụ đầy đủ

Ví dụ này triển khai kẹp zoom cơ bản trên một phần tử:

### HTML

```html
<style>
  #target {
    width: 300px;
    height: 300px;
    background: #eee;
    border: 1px solid black;
    transform-origin: center;
  }
</style>

<div id="target">
  <img src="example.jpg" alt="Pinch to zoom" style="width: 100%;" />
</div>
```

### JavaScript

```js
const target = document.getElementById("target");

// Lưu trữ các con trỏ đang hoạt động
const ongoingPointers = new Map();

let initialDistance = null;
let initialScale = 1;
let currentScale = 1;

function getPointerDistance() {
  const pointers = [...ongoingPointers.values()];
  if (pointers.length < 2) return null;
  const [p1, p2] = pointers;
  return Math.sqrt(
    Math.pow(p2.clientX - p1.clientX, 2) + Math.pow(p2.clientY - p1.clientY, 2),
  );
}

target.addEventListener("pointerdown", (ev) => {
  ongoingPointers.set(ev.pointerId, ev);
  target.setPointerCapture(ev.pointerId);
});

target.addEventListener("pointermove", (ev) => {
  ongoingPointers.set(ev.pointerId, ev);

  if (ongoingPointers.size === 2) {
    const distance = getPointerDistance();

    if (initialDistance === null) {
      initialDistance = distance;
      initialScale = currentScale;
    } else {
      currentScale = initialScale * (distance / initialDistance);
      // Giới hạn tỷ lệ zoom từ 0.5x đến 4x
      currentScale = Math.min(Math.max(currentScale, 0.5), 4);
      target.style.transform = `scale(${currentScale})`;
    }
  }
});

target.addEventListener("pointerup", (ev) => {
  ongoingPointers.delete(ev.pointerId);
  if (ongoingPointers.size < 2) {
    initialDistance = null;
  }
});

target.addEventListener("pointercancel", (ev) => {
  ongoingPointers.delete(ev.pointerId);
  initialDistance = null;
});
```

## Cách hoạt động

1. Khi người dùng đặt ngón tay thứ hai lên màn hình, `pointerdown` kích hoạt và chúng ta lưu trữ cả hai điểm chạm.

2. Khi ngón tay di chuyển, `pointermove` kích hoạt. Nếu có hai điểm chạm, chúng ta tính khoảng cách giữa chúng.

3. Khoảng cách hiện tại so với khoảng cách ban đầu xác định tỷ lệ zoom. Nếu khoảng cách tăng, nội dung phóng to; nếu khoảng cách giảm, nội dung thu nhỏ.

4. Khi ngón tay nhấc lên, chúng ta xóa điểm chạm và đặt lại khoảng cách ban đầu.

## Xem thêm

- [Pointer events](/en-US/docs/Web/API/Pointer_events)
- [Tương tác đa chạm](/en-US/docs/Web/API/Pointer_events/Multi-touch_interaction)
