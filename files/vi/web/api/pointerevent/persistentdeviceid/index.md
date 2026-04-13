---
title: "PointerEvent: persistentDeviceId property"
short-title: persistentDeviceId
slug: Web/API/PointerEvent/persistentDeviceId
page-type: web-api-instance-property
browser-compat: api.PointerEvent.persistentDeviceId
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`persistentDeviceId`** của giao diện {{domxref("PointerEvent")}} là một định danh duy nhất cho thiết bị trỏ đang tạo ra `PointerEvent`.
Điều này cung cấp một cách an toàn, đáng tin cậy để xác định nhiều thiết bị trỏ (chẳng hạn như các bút stylus) tương tác với màn hình cùng lúc.

Một `persistentDeviceId` tồn tại trong suốt thời gian của một phiên duyệt web.
Để tránh rủi ro về theo dõi dấu vân tay, các thiết bị trỏ được gán một `persistentDeviceId` mới ở đầu mỗi phiên.

Các sự kiện con trỏ mà thiết bị tạo ra không thể được xác định sẽ được gán giá trị `persistentDeviceId` là `0`.

## Giá trị

Một số nguyên, hoặc `0` nếu không thể xác định thiết bị tạo ra `PointerEvent`.

> [!NOTE]
> Do các hạn chế về phần cứng digitizer và thiết bị trỏ, `persistentDeviceId` có thể không có sẵn cho tất cả các sự kiện con trỏ, đặc biệt với phần cứng cũ hơn.
> Ví dụ: thiết bị trỏ có thể không báo cáo ID phần cứng của nó đến digitizer kịp thời cho `pointerdown` để nhận `persistentDeviceId`: ban đầu nó có thể là `0` và thay đổi thành giá trị hợp lệ cho các sự kiện sau trong nét vẽ.

## Ví dụ

### Gán màu cho mỗi persistentDeviceId

Giả sử HTML sau:

```html
<canvas id="inking-surface" width="1280" height="720"></canvas>
```

JavaScript sau gán màu vẽ khác nhau cho tối đa ba con trỏ duy nhất tương tác với canvas:

```js
const colorBlue = 0;
const colorGreen = 1;
const colorYellow = 2;
const colors = [colorBlue, colorGreen, colorYellow];

const pointerToColorMap = new Map();
let colorAssignmentIndex = 0;

const canvas = document.querySelector("#inking-surface");

// Listen for a pointerdown event and map the persistentDeviceId to a color
// if it exists and has not been mapped yet
canvas.addEventListener("pointerdown", (e) => {
  if (e.persistentDeviceId && !pointerToColorMap.has(e.persistentDeviceId)) {
    pointerToColorMap.set(e.persistentDeviceId, colors[colorAssignmentIndex]);

    // Bump the color assignment index and loop back over if needed
    colorAssignmentIndex = (colorAssignmentIndex + 1) % colors.length;
  }
});

// Listen for a `pointermove` and get the color assigned to this pointer
// if persistentDeviceId exists and the pointer has been color mapped
canvas.addEventListener("pointermove", (e) => {
  if (e.persistentDeviceId && pointerToColorMap.has(e.persistentDeviceId)) {
    const pointerColor = pointerToColorMap.get(e.persistentDeviceId);
    // Do some inking on the <canvas>
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
