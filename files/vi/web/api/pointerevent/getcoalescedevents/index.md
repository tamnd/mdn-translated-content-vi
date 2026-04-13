---
title: "PointerEvent: getCoalescedEvents() method"
short-title: getCoalescedEvents()
slug: Web/API/PointerEvent/getCoalescedEvents
page-type: web-api-instance-method
browser-compat: api.PointerEvent.getCoalescedEvents
---

{{APIRef("Pointer Events")}} {{secureContext_header}}

Phương thức **`getCoalescedEvents()`** của giao diện {{domxref("PointerEvent")}} trả về một chuỗi các thực thể `PointerEvent` đã được gộp (kết hợp) vào một sự kiện {{domxref('Element/pointermove_event', 'pointermove')}} hoặc {{domxref('Element/pointerrawupdate_event', 'pointerrawupdate')}} duy nhất.
Thay vì một luồng nhiều sự kiện {{domxref('Element/pointermove_event', 'pointermove')}}, tác nhân người dùng gộp nhiều bản cập nhật vào một sự kiện duy nhất.
Điều này giúp cải thiện hiệu suất vì tác nhân người dùng phải xử lý ít sự kiện hơn, nhưng có sự giảm độ chi tiết và độ chính xác khi theo dõi, đặc biệt với các chuyển động nhanh và lớn.

Phương thức **`getCoalescedEvents()`** cho phép ứng dụng truy cập tất cả các thay đổi vị trí chưa được gộp để xử lý chính xác dữ liệu chuyển động con trỏ khi cần thiết.
Các thay đổi vị trí chưa được gộp phù hợp trong các ứng dụng vẽ, chẳng hạn, nơi việc truy cập tất cả các sự kiện giúp xây dựng các đường cong mượt mà hơn, phản ánh chuyển động của con trỏ tốt hơn.

Để xem minh họa về các sự kiện được gộp, hãy xem [Hình 7 trong đặc tả](https://w3c.github.io/pointerevents/#figure_coalesced).

## Cú pháp

```js-nolint
getCoalescedEvents()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi các thực thể {{domxref('PointerEvent')}}.

## Ví dụ

### HTML

```html
<canvas id="target" width="600" height="300"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("target");
const ctx = canvas.getContext("2d");

const pointerEvents = [];

function drawCircle(x, y, color) {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // draw the last 20 events
  if (pointerEvents.length > 20) {
    pointerEvents.shift();
  }
  pointerEvents.push({ x, y, color });

  for (const pointerEvent of pointerEvents) {
    ctx.beginPath();
    ctx.arc(pointerEvent.x, pointerEvent.y, 10, 0, 2 * Math.PI);
    ctx.strokeStyle = pointerEvent.color;
    ctx.stroke();
  }
}

canvas.addEventListener("pointermove", (e) => {
  // draw a circle for the current event
  drawCircle(e.clientX, e.clientY, "black");

  const coalescedEvents = e.getCoalescedEvents();
  for (let coalescedEvent of coalescedEvents) {
    // give it an offset so we can see the difference and color it red
    drawCircle(coalescedEvent.clientX + 20, coalescedEvent.clientY + 20, "red");
  }
});
```

### Kết quả

{{EmbedLiveSample("Example", "", "320")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
