---
title: VRDisplay
slug: Web/API/VRDisplay
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`VRDisplay`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho bất kỳ thiết bị thực tế ảo nào được API này hỗ trợ. Nó bao gồm thông tin chung như ID và mô tả thiết bị, cũng như các phương thức để bắt đầu hiển thị cảnh thực tế ảo, truy xuất tham số mắt và khả năng màn hình, cùng các chức năng quan trọng khác.

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

Một mảng tất cả các thiết bị VR đã kết nối có thể được trả về bằng cách gọi phương thức {{domxref("Navigator.getVRDisplays()")}}.

## Thuộc tính phiên bản

- {{domxref("VRDisplay.capabilities")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về đối tượng {{domxref("VRDisplayCapabilities")}} cho biết các khả năng khác nhau của `VRDisplay`.
- {{domxref("VRDisplay.depthFar")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Lấy và đặt độ sâu z xác định mặt phẳng xa của [khung nhìn mắt](https://en.wikipedia.org/wiki/Viewing_frustum), tức là ranh giới có thể nhìn thấy xa nhất của cảnh.
- {{domxref("VRDisplay.depthNear")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Lấy và đặt độ sâu z xác định mặt phẳng gần của [khung nhìn mắt](https://en.wikipedia.org/wiki/Viewing_frustum), tức là ranh giới có thể nhìn thấy gần nhất của cảnh.
- {{domxref("VRDisplay.displayId")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về mã định danh cho `VRDisplay` cụ thể này, cũng được sử dụng làm điểm liên kết trong [Gamepad API](/en-US/docs/Web/API/Gamepad_API) (xem {{domxref("Gamepad.displayId")}}).
- {{domxref("VRDisplay.displayName")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về tên có thể đọc được để xác định `VRDisplay`.
- {{domxref("VRDisplay.isConnected")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu `VRDisplay` có đang kết nối với máy tính hay không.
- {{domxref("VRDisplay.isPresenting")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về giá trị boolean cho biết liệu `VRDisplay` có đang hiển thị nội dung hay không.
- {{domxref("VRDisplay.stageParameters")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về đối tượng {{domxref("VRStageParameters")}} chứa các tham số quy mô phòng, nếu `VRDisplay` có khả năng hỗ trợ trải nghiệm quy mô phòng.

## Phương thức phiên bản

- {{domxref("VRDisplay.getEyeParameters()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về đối tượng {{domxref("VREyeParameters")}} chứa các tham số mắt cho mắt được chỉ định.
- {{domxref("VRDisplay.getFrameData()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Nhận đối tượng {{domxref("VRFrameData")}} và điền vào đó các thông tin cần thiết để hiển thị khung hình hiện tại.
- {{domxref("VRDisplay.getImmediatePose()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về đối tượng {{domxref("VRPose")}} xác định tư thế hiện tại của `VRDisplay`, không áp dụng dự đoán. Phương thức này không còn cần thiết và đã bị xóa khỏi đặc tả.
- {{domxref("VRDisplay.getLayers()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về các lớp hiện đang được hiển thị bởi `VRDisplay`.
- {{domxref("VRDisplay.getPose()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về đối tượng {{domxref("VRPose")}} xác định tư thế dự đoán trong tương lai của `VRDisplay` khi khung hình hiện tại thực sự được hiển thị. **Phương thức này đã lỗi thời — thay vào đó, bạn nên sử dụng {{domxref("VRDisplay.getFrameData()")}}, phương thức này cũng cung cấp đối tượng {{domxref("VRPose")}}.**
- {{domxref("VRDisplay.resetPose()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Đặt lại tư thế cho `VRDisplay` này, lấy {{domxref("VRPose.position")}} và {{domxref("VRPose.orientation")}} hiện tại làm giá trị "gốc/không".
- {{domxref("VRDisplay.cancelAnimationFrame()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Triển khai đặc biệt của {{domxref("Window.cancelAnimationFrame")}} cho phép hủy đăng ký các callback đã đăng ký với {{domxref("VRDisplay.requestAnimationFrame()")}}.
- {{domxref("VRDisplay.requestAnimationFrame()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Triển khai đặc biệt của {{domxref("Window.requestAnimationFrame")}} chứa hàm callback được gọi mỗi lần khung hình mới của màn hình `VRDisplay` được hiển thị.
- {{domxref("VRDisplay.requestPresent()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Bắt đầu `VRDisplay` hiển thị một cảnh.
- {{domxref("VRDisplay.exitPresent()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Dừng `VRDisplay` hiển thị một cảnh.
- {{domxref("VRDisplay.submitFrame()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Ghi lại trạng thái hiện tại của {{domxref("VRLayerInit")}} đang được hiển thị và hiển thị nó trên `VRDisplay`.

## Ví dụ

```js
if (navigator.getVRDisplays) {
  console.log("WebVR 1.1 supported");
  // Then get the displays attached to the computer
  navigator.getVRDisplays().then((displays) => {
    // If a display is available, use it to present the scene
    if (displays.length > 0) {
      vrDisplay = displays[0];
      // Now we have our VRDisplay object and can do what we want with it
    }
  });
}
```

> [!NOTE]
> Bạn có thể xem mã đầy đủ tại [raw-webgl-example](https://github.com/mdn/webvr-tests/blob/main/webvr/raw-webgl-example/webgl-demo.js).

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/#interface-vrdisplay) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn.

Cho đến khi tất cả các trình duyệt triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/) hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển các ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
