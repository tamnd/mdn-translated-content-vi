---
title: "PointerEvent: getPredictedEvents() method"
short-title: getPredictedEvents()
slug: Web/API/PointerEvent/getPredictedEvents
page-type: web-api-instance-method
browser-compat: api.PointerEvent.getPredictedEvents
---

{{APIRef("Pointer Events")}}

Phương thức **`getPredictedEvents()`** của giao diện {{domxref("PointerEvent")}} trả về một chuỗi các thực thể `PointerEvent` là các vị trí con trỏ tương lai được ước tính.
Cách tính các vị trí dự đoán phụ thuộc vào tác nhân người dùng, nhưng chúng dựa trên các điểm trước đó, vận tốc hiện tại và quỹ đạo.

Ứng dụng có thể sử dụng các sự kiện dự đoán để "vẽ trước" đến vị trí dự đoán, điều này có thể giảm độ trễ cảm nhận tùy thuộc vào cách ứng dụng diễn giải các sự kiện dự đoán và trường hợp sử dụng.

Để xem minh họa về các sự kiện dự đoán, hãy xem [Hình 8 trong đặc tả](https://w3c.github.io/pointerevents/#figure_predicted).

## Cú pháp

```js-nolint
getPredictedEvents()
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

  const predictedEvents = e.getPredictedEvents();
  for (let predictedEvent of predictedEvents) {
    // give it an offset so we can see the difference and color it red
    drawCircle(predictedEvent.clientX + 20, predictedEvent.clientY + 20, "red");
  }
});
```

### Kết quả

{{EmbedLiveSample("Example", "", "320")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
