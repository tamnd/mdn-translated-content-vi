---
title: PositionSensorVRDevice
slug: Web/API/PositionSensorVRDevice
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.PositionSensorVRDevice
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`PositionSensorVRDevice`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho cảm biến vị trí của phần cứng VR. Bạn có thể truy cập thông tin như vị trí và hướng hiện tại của cảm biến so với màn hình gắn đầu thông qua phương thức {{domxref("PositionSensorVRDevice.getState()")}}.

## Phương thức phiên bản

- {{domxref("PositionSensorVRDevice.getState()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về trạng thái hiện tại của cảm biến vị trí cho frame hiện tại (ví dụ, trong callback {{domxref("window.requestAnimationFrame")}} hiện tại) hoặc cho frame trước, được chứa trong đối tượng {{domxref("VRPose")}}. Đây là phương thức bạn thường muốn sử dụng thay vì `getImmediateState()`.
- {{domxref("PositionSensorVRDevice.getImmediateState()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về trạng thái cảm biến vị trí tức thì hiện tại. Phương thức này chỉ dành để sử dụng hiếm khi, cho một số mục đích đặc biệt nhất định, ví dụ như lấy mẫu vị trí tức thì của cảm biến hướng tay.
- {{domxref("PositionSensorVRDevice.resetSensor()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : _Có thể được dùng để đặt lại cảm biến nếu muốn, trả về_ các giá trị vị trí và hướng về không.

## Thuộc tính phiên bản

_Giao diện này không định nghĩa bất kỳ thuộc tính nào của riêng nó, nhưng kế thừa các thuộc tính từ giao diện cha, {{domxref("VRDisplay")}}._

- {{domxref("VRDisplay.displayId")}} {{ReadOnlyInline}}
  - : Trả về ID cho `VRDevice` cụ thể này. ID không nên thay đổi qua các lần khởi động lại trình duyệt, cho phép lưu dữ liệu cấu hình dựa trên nó.
- {{domxref("VRDisplay.displayName")}} {{ReadOnlyInline}}
  - : Tên có thể đọc được bởi người dùng để nhận dạng `VRDevice`.

## Ví dụ

Ví dụ sau đây sử dụng WebVR API để cập nhật view của một cảnh [2D canvas](/en-US/docs/Web/API/CanvasRenderingContext2D) đơn giản trên mỗi frame của vòng lặp {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}}.

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

Ở đây chúng ta lấy đối tượng {{domxref("VRPose")}} bằng cách dùng {{domxref("PositionSensorVRDevice.getState()")}} và lưu vào `posState`. Sau đó chúng ta kiểm tra để đảm bảo thông tin vị trí và hướng có trong frame hiện tại bằng cách dùng {{domxref("VRPose.position")}} và {{domxref("VRPose.orientation")}} (các giá trị này trả về `null` nếu, ví dụ, màn hình gắn đầu bị tắt hoặc không hướng về phía cảm biến vị trí, điều này sẽ gây ra lỗi.)

Sau đó chúng ta hiển thị các giá trị vị trí và hướng x, y và z cho mục đích thông tin, và sử dụng các giá trị đó để cập nhật các biến `xPos`, `yPos`, `zPos`, `xOrient`, `yOrient`, và `zOrient`, được dùng để cập nhật kết xuất cảnh trên mỗi frame.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
