---
title: "XRSession: phương thức cancelAnimationFrame()"
short-title: cancelAnimationFrame()
slug: Web/API/XRSession/cancelAnimationFrame
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.cancelAnimationFrame
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`cancelAnimationFrame()`** của giao diện {{domxref("XRSession")}} hủy một khung hình hoạt ảnh đã được yêu cầu trước đó bằng cách gọi {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame")}}.

## Cú pháp

```js-nolint
cancelAnimationFrame(handle)
```

### Tham số

- `handle`
  - : Giá trị duy nhất được trả về bởi lệnh gọi {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} đã lên lịch callback hoạt ảnh trước đó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ghi chú sử dụng

Hàm này không có tác dụng nếu không thể tìm thấy `handle` được chỉ định.

## Ví dụ

Trong ví dụ bên dưới, chúng ta thấy mã khởi chạy một phiên WebXR nếu chế độ VR nhập vai được hỗ trợ. Sau khi bắt đầu, phiên lên lịch khung hình đầu tiên để kết xuất bằng cách gọi {{DOMxRef("XRSession.requestAnimationFrame", "requestAnimationFrame()")}}.

Hàm `pauseXR()` được hiển thị ở cuối có thể được gọi để tạm ngưng phiên WebVR, về cơ bản là hủy bất kỳ callback khung hình hoạt ảnh đang chờ nào. Vì mỗi callback khung hình lên lịch callback tiếp theo, việc xóa callback sẽ chấm dứt việc cập nhật cảnh WebXR.

```js
const XR = navigator.xr;

let requestHandle = null;
let xrSession = null;

if (XR) {
  XR.isSessionSupported("immersive-vr").then((isSupported) => {
    if (isSupported) {
      startXR();
    }
  });
}

function frameCallback(time, xrFrame) {
  xrSession.requestAnimationFrame(frameCallback);

  // Update and render the frame
}

async function startXR() {
  xrSession = XR.requestSession("immersive-vr");

  if (xrSession) {
    stopButton.onclick = stopXR;
    requestHandle = xrSession.requestAnimationFrame(frameCallback);
  }
}

function pauseXR() {
  if (xrSession && requestHandle) {
    xrSession.cancelAnimationFrame(requestHandle);
    requestHandle = null;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Window.cancelAnimationFrame")}}
- {{domxref("XRSession.requestAnimationFrame")}}
