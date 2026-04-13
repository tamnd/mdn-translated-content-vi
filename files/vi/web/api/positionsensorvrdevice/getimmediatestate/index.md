---
title: "PositionSensorVRDevice: getImmediateState() method"
short-title: getImmediateState()
slug: Web/API/PositionSensorVRDevice/getImmediateState
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PositionSensorVRDevice.getImmediateState
---

{{deprecated_header}}{{APIRef("WebVR API")}}{{Non-standard_header}}

Phương thức **`getImmediateState()`** của giao diện {{domxref("VRDisplay")}} trả về trạng thái cảm biến vị trí tức thì hiện tại. Phương thức này chỉ dành để sử dụng hiếm khi, cho một số mục đích đặc biệt nhất định, ví dụ như lấy mẫu vị trí tức thì của cảm biến hướng tay.

Đối với hầu hết các mục đích tiêu chuẩn, bạn có thể muốn sử dụng {{domxref("PositionSensorVRDevice.getState")}} thay thế.

## Cú pháp

```js-nolint
getImmediateState()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("VRPose")}}.

## Ví dụ

Demo sau sử dụng WebVR API để cập nhật view của một cảnh {{domxref("CanvasRenderingContext2D")}} đơn giản trên mỗi frame của vòng lặp {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}}. Hàm chính cập nhật dữ liệu view như sau:

```js
function setView() {
  const posState = gPositionSensor.getImmediateState();
  if (posState.hasPosition) {
    posPara.textContent = `Position: x${roundToTwo(
      posState.position.x,
    )} y${roundToTwo(posState.position.y)} z${roundToTwo(posState.position.z)}`;
    xPos = -posState.position.x * WIDTH * 2;
    yPos = posState.position.y * HEIGHT * 2;
    zPos = -posState.position.z > 0.01 ? -posState.position.z : 0.01;
  }

  if (posState.hasOrientation) {
    orientPara.textContent = `Orientation: x${roundToTwo(
      posState.orientation.x,
    )} y${roundToTwo(posState.orientation.y)} z${roundToTwo(
      posState.orientation.z,
    )}`;
    xOrient = posState.orientation.x * WIDTH;
    yOrient = -posState.orientation.y * HEIGHT * 2;
    zOrient = posState.orientation.z * 180;
  }
}
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
