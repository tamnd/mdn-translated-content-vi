---
title: "PositionSensorVRDevice: resetSensor() method"
short-title: resetSensor()
slug: Web/API/PositionSensorVRDevice/resetSensor
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PositionSensorVRDevice.resetSensor
---

{{deprecated_header}}{{APIRef("WebVR API")}}{{Non-standard_header}}

Phương thức **`resetSensor()`** của giao diện {{domxref("VRDisplay")}} _có thể được dùng để đặt lại cảm biến nếu muốn, trả về_ các giá trị vị trí và hướng về không.

## Cú pháp

```js-nolint
resetSensor()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Demo sau sử dụng WebVR API để cập nhật view của một cảnh {{domxref("CanvasRenderingContext2D")}} đơn giản trên mỗi frame của vòng lặp {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}}. Demo có, ngoài các thứ khác, một nút "Reset Sensor" trong UI, khi được nhấn sẽ chạy hàm `resetSensor()` trên cảm biến vị trí. JavaScript trông như sau:

```js
document.querySelector("button").onclick = () => {
  gPositionSensor.resetSensor();
};
```

Khi nút được nhấn, vị trí, hướng hiện tại, v.v. của cảm biến/màn hình gắn đầu được đặt thành 0, điều này làm cho phương thức hữu ích khi hiệu chỉnh khi ứng dụng được tải lần đầu.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
