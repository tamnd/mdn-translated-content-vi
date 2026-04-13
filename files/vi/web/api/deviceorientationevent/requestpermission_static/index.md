---
title: "DeviceOrientationEvent: requestPermission() static method"
short-title: requestPermission()
slug: Web/API/DeviceOrientationEvent/requestPermission_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.DeviceOrientationEvent.requestPermission_static
---

{{APIRef("Device Orientation Events")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`requestPermission()`** của giao diện {{domxref("DeviceOrientationEvent")}} yêu cầu quyền của người dùng để truy cập dữ liệu hướng thiết bị từ cảm biến gia tốc kế và con quay hồi chuyển. Nó cũng có thể yêu cầu quyền truy cập dữ liệu từ tính kế khi cần hướng tuyệt đối. Phương thức này yêu cầu {{Glossary("transient activation")}}, nghĩa là nó phải được kích hoạt bởi một sự kiện UI như nhấn nút.

## Cú pháp

```js-nolint
DeviceOrientationEvent.requestPermission()
DeviceOrientationEvent.requestPermission(absolute)
```

### Tham số

- `absolute` {{optional_inline}}
  - : Giá trị boolean cho biết có cần dữ liệu hướng tuyệt đối hay không. Khi là `true`, yêu cầu quyền cũng bao gồm cảm biến từ tính kế. Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với một chuỗi là `"granted"` hoặc `"denied"`.

### Ngoại lệ

Promise trả về sẽ bị từ chối với các ngoại lệ sau:

- `NotAllowedError` {{domxref("DOMException")}}
  - : Trạng thái quyền là `"prompt"` và hàm gọi không có {{Glossary("transient activation")}}.

## Bảo mật

Yêu cầu [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc phần tử UI để tính năng này hoạt động.

## Ví dụ

### Yêu cầu quyền hướng thiết bị khi nhấn chuột

```js
document.querySelector("button").addEventListener("click", async () => {
  if (typeof DeviceOrientationEvent.requestPermission !== "function") {
    // The feature is not available, or does not need permission.
    return;
  }

  const permission = await DeviceOrientationEvent.requestPermission();
  if (permission === "granted") {
    window.addEventListener("deviceorientation", (event) => {
      console.log(`Alpha: ${event.alpha}`);
      console.log(`Beta: ${event.beta}`);
      console.log(`Gamma: ${event.gamma}`);
    });
  }
});
```

### Yêu cầu quyền hướng tuyệt đối

Khi cần dữ liệu hướng tuyệt đối (ví dụ: cho các ứng dụng dựa trên la bàn), truyền `true` làm tham số `absolute`. Điều này bổ sung thêm yêu cầu truy cập từ tính kế.

```js
document.querySelector("button").addEventListener("click", async () => {
  if (typeof DeviceOrientationEvent.requestPermission !== "function") {
    return;
  }

  const permission = await DeviceOrientationEvent.requestPermission(true);
  if (permission === "granted") {
    window.addEventListener("deviceorientationabsolute", (event) => {
      console.log(`Absolute alpha: ${event.alpha}`);
    });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DeviceOrientationEvent")}}
- {{domxref("DeviceMotionEvent.requestPermission_static", "DeviceMotionEvent.requestPermission()")}}
- {{domxref("Window.deviceorientation_event", "deviceorientation")}} event
- {{domxref("Window.deviceorientationabsolute_event", "deviceorientationabsolute")}} event
- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
