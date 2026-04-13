---
title: "DeviceMotionEvent: requestPermission() static method"
short-title: requestPermission()
slug: Web/API/DeviceMotionEvent/requestPermission_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.DeviceMotionEvent.requestPermission_static
---

{{APIRef("Device Orientation Events")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`requestPermission()`** của giao diện {{domxref("DeviceMotionEvent")}} yêu cầu quyền của người dùng để truy cập dữ liệu chuyển động thiết bị từ cảm biến gia tốc kế và con quay hồi chuyển. Phương thức này yêu cầu {{Glossary("transient activation")}}, nghĩa là nó phải được kích hoạt bởi một sự kiện UI như nhấn nút.

## Cú pháp

```js-nolint
DeviceMotionEvent.requestPermission()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với một chuỗi là `"granted"` hoặc `"denied"`.

### Ngoại lệ

Promise trả về sẽ bị từ chối với các ngoại lệ sau:

- `NotAllowedError` {{domxref("DOMException")}}
  - : Trạng thái quyền là `"prompt"` và hàm gọi không có {{Glossary("transient activation")}}.

## Bảo mật

Yêu cầu [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc phần tử UI để tính năng này hoạt động.

## Ví dụ

### Yêu cầu quyền chuyển động thiết bị khi nhấn chuột

```js
document.querySelector("button").addEventListener("click", async () => {
  if (typeof DeviceMotionEvent.requestPermission !== "function") {
    // The feature is not available, or does not need permission.
    return;
  }

  const permission = await DeviceMotionEvent.requestPermission();
  if (permission === "granted") {
    window.addEventListener("devicemotion", (event) => {
      console.log(`Acceleration X: ${event.acceleration.x}`);
      console.log(`Acceleration Y: ${event.acceleration.y}`);
      console.log(`Acceleration Z: ${event.acceleration.z}`);
    });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DeviceMotionEvent")}}
- {{domxref("DeviceOrientationEvent.requestPermission_static", "DeviceOrientationEvent.requestPermission()")}}
- {{domxref("Window.devicemotion_event", "devicemotion")}} event
- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
