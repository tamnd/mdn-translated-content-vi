---
title: WebVR API
slug: Web/API/WebVR_API
page-type: web-api-overview
status:
  - deprecated
  - non-standard
browser-compat: api.Navigator.getVRDisplays
---

{{DefaultAPISidebar("WebVR API")}}{{Deprecated_Header}}{{Non-standard_header}}

> [!NOTE]
> WebVR API được thay thế bởi [WebXR API](/en-US/docs/Web/API/WebXR_Device_API). WebVR chưa bao giờ được phê chuẩn thành một tiêu chuẩn, chỉ được triển khai và bật mặc định trong rất ít trình duyệt, và chỉ hỗ trợ một số ít thiết bị.

WebVR cung cấp hỗ trợ để đưa các thiết bị thực tế ảo - ví dụ như màn hình đeo đầu như Oculus Rift hoặc HTC Vive - ra cho các ứng dụng web, cho phép nhà phát triển chuyển thông tin vị trí và chuyển động từ màn hình thành chuyển động trong một cảnh 3D. Điều này có rất nhiều ứng dụng thú vị, từ tham quan sản phẩm ảo và ứng dụng đào tạo tương tác cho đến trò chơi góc nhìn thứ nhất nhập vai.

## Khái niệm và cách dùng

Bất kỳ thiết bị VR nào được kết nối với máy tính của bạn sẽ được trả về bởi phương thức {{DOMxRef("Navigator.getVRDisplays()")}}; mỗi thiết bị sẽ được biểu diễn bởi một đối tượng {{DOMxRef("VRDisplay")}}.

![Sketch of a person in a chair with wearing goggles labelled "Head mounted display (HMD)" facing a monitor with a webcam labelled "Position sensor"](hw-setup.png)

{{DOMxRef("VRDisplay")}} là giao diện trung tâm trong WebVR API - thông qua các thuộc tính và phương thức của nó, bạn có thể truy cập các chức năng để:

- Lấy thông tin hữu ích để nhận diện màn hình, các khả năng nó có, các bộ điều khiển đi kèm, và nhiều hơn nữa.
- Lấy [frame data](/en-US/docs/Web/API/VRFrameData) cho mỗi khung nội dung bạn muốn hiển thị trên màn hình, rồi gửi các khung đó để hiển thị ở tốc độ nhất quán.
- Bắt đầu và dừng việc trình chiếu lên màn hình.

Một ứng dụng WebVR điển hình (đơn giản) sẽ hoạt động như sau:

1. {{DOMxRef("Navigator.getVRDisplays()")}} được dùng để lấy tham chiếu tới màn hình VR của bạn.
2. {{DOMxRef("VRDisplay.requestPresent()")}} được dùng để bắt đầu trình chiếu lên màn hình VR.
3. Phương thức chuyên dụng của WebVR, {{DOMxRef("VRDisplay.requestAnimationFrame()")}}, được dùng để chạy vòng lặp render của ứng dụng ở tốc độ làm mới phù hợp với màn hình.
4. Bên trong vòng lặp render, bạn lấy dữ liệu cần để hiển thị khung hiện tại ({{DOMxRef("VRDisplay.getFrameData()")}}), vẽ cảnh hiển thị hai lần - một lần cho góc nhìn của mỗi mắt - rồi gửi khung đã render tới màn hình để hiển thị cho người dùng ({{DOMxRef("VRDisplay.submitFrame()")}}).

Ngoài ra, WebVR 1.1 bổ sung một số sự kiện trên đối tượng {{DOMxRef("Window")}} để cho phép JavaScript phản hồi các thay đổi về trạng thái của màn hình.

> [!NOTE]
> Bạn có thể tìm hiểu thêm rất nhiều về cách API hoạt động trong các bài viết [Using the WebVR API](/en-US/docs/Web/API/WebVR_API/Using_the_WebVR_API) và [WebVR Concepts](/en-US/docs/Web/API/WebVR_API/Concepts).

### Khả dụng của API

WebVR API, vốn chưa bao giờ được phê chuẩn như một tiêu chuẩn web, đã bị ngừng khuyến nghị để thay bằng [WebXR API](/en-US/docs/Web/API/WebXR_Device_API), một API đang đi khá tốt trên con đường hoàn thiện quá trình tiêu chuẩn hóa. Vì vậy, bạn nên cố gắng cập nhật mã hiện có để dùng API mới hơn. Nhìn chung, việc chuyển đổi sẽ khá suôn sẻ.

Ngoài ra, trên một số thiết bị và/hoặc trình duyệt, WebVR yêu cầu trang phải được tải bằng secure context, qua kết nối HTTPS. Nếu trang không hoàn toàn an toàn, các phương thức và hàm WebVR sẽ không khả dụng. Bạn có thể kiểm tra điều này dễ dàng bằng cách xem phương thức {{domxref("Navigator")}} {{domxref("Navigator.getVRDisplays", "getVRDisplays()")}} có là `NULL` hay không:

```js
if (!navigator.getVRDisplays) {
  console.error("WebVR is not available");
} else {
  /* Use WebVR */
}
```

### Dùng bộ điều khiển: Kết hợp WebVR với Gamepad API

Nhiều cấu hình phần cứng WebVR có các bộ điều khiển đi kèm với headset. Chúng có thể được dùng trong ứng dụng WebVR thông qua [Gamepad API](/en-US/docs/Web/API/Gamepad_API), cụ thể là [Gamepad Extensions API](/en-US/docs/Web/API/Gamepad_API#experimental_gamepad_extensions), API này bổ sung các tính năng để truy cập [controller pose](/en-US/docs/Web/API/GamepadPose), [haptic actuators](/en-US/docs/Web/API/GamepadHapticActuator), và nhiều hơn nữa.

> [!NOTE]
> Bài viết [Using VR controllers with WebVR](/en-US/docs/Web/API/WebVR_API/Using_VR_controllers_with_WebVR) của chúng tôi giải thích những điều cơ bản về cách dùng bộ điều khiển VR với ứng dụng WebVR.

## Các giao diện WebVR

- {{DOMxRef("VRDisplay")}}
  - : Đại diện cho bất kỳ thiết bị VR nào được API này hỗ trợ. Nó bao gồm thông tin chung như mã định danh thiết bị và mô tả, cũng như các phương thức để bắt đầu trình chiếu một cảnh VR, lấy tham số mắt và khả năng hiển thị, cùng các chức năng quan trọng khác.
- {{DOMxRef("VRDisplayCapabilities")}}
  - : Mô tả các khả năng của một {{DOMxRef("VRDisplay")}} - các đặc điểm của nó có thể được dùng để thực hiện kiểm tra khả năng của thiết bị VR, ví dụ nó có trả về thông tin vị trí hay không.
- {{DOMxRef("VRDisplayEvent")}}
  - : Đại diện cho đối tượng sự kiện của các sự kiện liên quan đến WebVR (xem các [sự kiện cửa sổ](#window_events) được liệt kê bên dưới).
- {{DOMxRef("VRFrameData")}}
  - : Đại diện cho toàn bộ thông tin cần thiết để render một khung duy nhất của cảnh VR; được tạo bởi {{DOMxRef("VRDisplay.getFrameData()")}}.
- {{DOMxRef("VRPose")}}
  - : Đại diện cho trạng thái vị trí tại một dấu thời gian nhất định (bao gồm orientation, position, velocity, và acceleration).
- {{DOMxRef("VREyeParameters")}}
  - : Cung cấp quyền truy cập tới toàn bộ thông tin cần thiết để render đúng một cảnh cho từng mắt, bao gồm thông tin field of view.
- {{DOMxRef("VRFieldOfView")}}
  - : Đại diện cho field of view được xác định bởi 4 giá trị độ khác nhau mô tả tầm nhìn từ một điểm trung tâm.
- {{DOMxRef("VRLayerInit")}}
  - : Đại diện cho một lớp sẽ được trình chiếu trong một {{DOMxRef("VRDisplay")}}.
- {{DOMxRef("VRStageParameters")}}
  - : Đại diện cho các giá trị mô tả khu vực stage đối với các thiết bị hỗ trợ trải nghiệm room-scale.

### Các mở rộng cho giao diện khác

WebVR API mở rộng các API sau, bổ sung những tính năng được liệt kê.

#### Gamepad

- {{DOMxRef("Gamepad.displayId")}} {{ReadOnlyInline}}
  - : _Trả về {{DOMxRef("VRDisplay.displayId")}} của {{DOMxRef("VRDisplay")}} liên kết - `VRDisplay` đang điều khiển cảnh hiển thị của gamepad._

#### Navigator

- {{DOMxRef("Navigator.activeVRDisplays")}} {{ReadOnlyInline}}
  - : Trả về một mảng chứa mọi đối tượng {{DOMxRef("VRDisplay")}} hiện đang trình chiếu ({{DOMxRef("VRDisplay.isPresenting")}} là `true`).
- {{DOMxRef("Navigator.getVRDisplays()")}}
  - : Trả về một promise resolve thành một mảng các đối tượng {{DOMxRef("VRDisplay")}} đại diện cho mọi màn hình VR sẵn có được kết nối với máy tính.

#### Sự kiện Window

- {{DOMxRef("Window.vrdisplaypresentchange_event", "vrdisplaypresentchange")}}
  - : Được kích hoạt khi trạng thái trình chiếu của một màn hình VR thay đổi - tức là chuyển từ đang trình chiếu sang không trình chiếu hoặc ngược lại.
- {{DOMxRef("Window.vrdisplayconnect_event", "vrdisplayconnect")}}
  - : Được kích hoạt khi một màn hình VR tương thích được kết nối với máy tính.
- {{DOMxRef("Window.vrdisplaydisconnect_event", "vrdisplaydisconnect")}}
  - : Được kích hoạt khi một màn hình VR tương thích bị ngắt kết nối khỏi máy tính.
- {{DOMxRef("Window.vrdisplayactivate_event", "vrdisplayactivate")}}
  - : Được kích hoạt khi một màn hình có thể được trình chiếu.
- {{DOMxRef("Window.vrdisplaydeactivate_event", "vrdisplaydeactivate")}}
  - : Được kích hoạt khi một màn hình không còn có thể được trình chiếu nữa.

## Ví dụ

Bạn có thể tìm thấy một số ví dụ tại các vị trí sau:

- [webvr-tests](https://github.com/mdn/webvr-tests) - các ví dụ rất đơn giản đi kèm với tài liệu WebVR của MDN.
- [Carmel starter kit](https://github.com/facebookarchive/Carmel-Starter-Kit) - các ví dụ đơn giản, có chú thích tốt, đi kèm với Carmel, trình duyệt WebVR của Facebook.
- [WebVR.info samples](https://webvr.info/samples/) - các ví dụ sâu hơn một chút cùng mã nguồn
- [A-Frame homepage](https://aframe.io/) - các ví dụ cho thấy cách dùng A-Frame

## Thông số kỹ thuật

API này được định nghĩa trong [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ, vốn đã bị thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên lộ trình trở thành một tiêu chuẩn nữa.

Cho đến khi mọi trình duyệt đã triển khai các [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, bạn nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển các ứng dụng WebXR có thể hoạt động trên mọi trình duyệt. Đọc hướng dẫn [Meta's Porting from WebVR to WebXR](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [A-Frame](https://aframe.io/) - framework web mã nguồn mở để xây dựng trải nghiệm VR.
- [webvr.info](https://webvr.info/) - thông tin cập nhật về WebVR, thiết lập trình duyệt và cộng đồng.
- [threejs-vr-boilerplate](https://github.com/MozillaReality/vr-web-examples/tree/master/threejs-vr-boilerplate) - một mẫu khởi đầu hữu ích để viết ứng dụng WebVR.
- [Web VR polyfill](https://github.com/immersive-web/webvr-polyfill) - triển khai JavaScript cho WebVR.
- [WebVR Directory](https://webvr.directory/) - danh sách các trang WebVR chất lượng.
