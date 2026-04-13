---
title: "PositionSensorVRDevice: getState() method"
short-title: getState()
slug: Web/API/PositionSensorVRDevice/getState
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.PositionSensorVRDevice.getState
---

{{deprecated_header}}{{APIRef("WebVR API")}}{{Non-standard_header}}

Phương thức **`getState()`** của giao diện {{domxref("PositionSensorVRDevice")}} trả về trạng thái hiện tại của cảm biến vị trí cho frame hiện tại (ví dụ, trong callback {{domxref("window.requestAnimationFrame")}} hiện tại) hoặc cho frame trước, được chứa trong đối tượng {{domxref("VRPose")}}. Đây là phương thức bạn thường muốn sử dụng thay vì {{domxref("PositionSensorVRDevice.getImmediateState")}}.

## Cú pháp

```js-nolint
getState()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("VRPose")}}.

## Ví dụ

Ví dụ sau đây sử dụng WebVR API để cập nhật view của một cảnh {{domxref("CanvasRenderingContext2D")}} đơn giản trên mỗi frame của vòng lặp {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}}.

```js
function setView() {
  const posState = gPositionSensor.getState();
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
