---
title: WebXR Device API
slug: Web/API/WebXR_Device_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Navigator.xr
spec-urls:
  - https://immersive-web.github.io/webxr/
  - https://immersive-web.github.io/anchors/
  - https://immersive-web.github.io/webxr-ar-module/
  - https://immersive-web.github.io/depth-sensing/
  - https://immersive-web.github.io/dom-overlays/
  - https://immersive-web.github.io/webxr-gamepads-module/
  - https://immersive-web.github.io/webxr-hand-input/
  - https://immersive-web.github.io/hit-test/
  - https://immersive-web.github.io/layers/
  - https://immersive-web.github.io/lighting-estimation/
---

{{DefaultAPISidebar("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

**WebXR** là một nhóm các tiêu chuẩn được dùng cùng nhau để hỗ trợ việc dựng các cảnh 3D lên phần cứng được thiết kế cho việc trình bày các thế giới ảo (**virtual reality**, hay **VR**), hoặc để bổ sung hình ảnh đồ họa vào thế giới thực (**augmented reality**, hay **AR**). **WebXR Device API** triển khai phần lõi của tập tính năng WebXR, quản lý việc chọn thiết bị đầu ra, dựng cảnh 3D lên thiết bị đã chọn với tốc độ khung hình phù hợp, và quản lý các vector chuyển động được tạo từ các bộ điều khiển nhập liệu.

Các thiết bị tương thích WebXR bao gồm headset 3D đắm chìm hoàn toàn với tính năng theo dõi chuyển động và hướng, kính đeo phủ đồ họa lên cảnh thế giới thực đi qua khung kính, và điện thoại di động cầm tay bổ sung thực tại bằng cách ghi lại thế giới bằng camera rồi bổ sung cảnh đó bằng hình ảnh do máy tính tạo ra.

Để làm được những việc này, WebXR Device API cung cấp các năng lực chính sau:

- Tìm các thiết bị đầu ra VR hoặc AR tương thích
- Dựng một cảnh 3D lên thiết bị ở tốc độ khung hình phù hợp
- (Tùy chọn) phản chiếu đầu ra lên một màn hình 2D
- Tạo các vector biểu diễn chuyển động của các điều khiển nhập liệu

Ở mức cơ bản nhất, một cảnh được trình bày trong 3D bằng cách tính toán phối cảnh áp dụng cho cảnh để dựng nó từ góc nhìn của từng mắt người dùng, bằng cách tính vị trí của mỗi mắt và dựng cảnh từ vị trí đó, nhìn theo hướng mà người dùng hiện đang hướng tới. Mỗi một trong hai hình ảnh này được dựng vào cùng một framebuffer, với ảnh được dựng của mắt trái ở bên trái và góc nhìn của mắt phải được dựng vào nửa phải của bộ đệm. Sau khi cả hai phối cảnh của cảnh đã được dựng xong, framebuffer thu được sẽ được chuyển đến thiết bị WebXR để trình bày cho người dùng thông qua headset hoặc một thiết bị hiển thị phù hợp khác.

Trong khi [WebVR API](/en-US/docs/Web/API/WebVR_API) cũ hơn chỉ được thiết kế để hỗ trợ Virtual Reality (VR), WebXR cung cấp hỗ trợ cho cả VR và Augmented Reality (AR) trên web. Hỗ trợ cho chức năng AR được bổ sung bởi WebXR Augmented Reality Module.

Một thiết bị XR điển hình có thể có 3 hoặc 6 bậc tự do và có thể có hoặc không có cảm biến vị trí bên ngoài.

Thiết bị cũng có thể bao gồm gia tốc kế, áp kế hoặc các cảm biến khác được dùng để phát hiện khi người dùng di chuyển trong không gian, xoay đầu, hoặc các chuyển động tương tự.

## Tài liệu tham khảo WebXR

<div class="index">

### Khởi tạo

- {{domxref("navigator.xr")}}
- {{domxref("XRSystem")}}
- {{domxref("XRPermissionStatus")}}
- `Permissions-Policy`: [`xr-spatial-tracking`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/xr-spatial-tracking)

### Phiên

- {{DOMxRef("XRSession")}}
- {{domxref("XRSessionEvent")}}
- {{DOMxRef("XRRenderState")}}

### Vòng lặp khung hình

- {{DOMxRef("XRFrame")}}

### Không gian

- {{DOMxRef("XRSpace")}}
- {{DOMxRef("XRReferenceSpace")}}
- {{DOMxRef("XRBoundedReferenceSpace")}}
- {{domxref("XRReferenceSpaceEvent")}}
- {{domxref("XRJointSpace")}}

### Góc nhìn

- {{DOMxRef("XRView")}}
- {{DOMxRef("XRViewport")}}

### Các khối hình học cơ bản

- {{DOMxRef("XRRigidTransform")}}

### Tư thế

- {{DOMxRef("XRPose")}}
- {{DOMxRef("XRJointPose")}}
- {{DOMxRef("XRViewerPose")}}

### Đầu vào

- {{DOMxRef("XRHand")}}
- {{DOMxRef("XRInputSource")}}
- {{DOMxRef("XRInputSourceArray")}}
- {{domxref("XRInputSourceEvent")}}
- {{domxref("XRInputSourcesChangeEvent")}}

### Lớp

- {{DOMxRef("XRLayer")}}
- {{DOMxRef("XRLayerEvent")}}
- {{DOMxRef("XRCompositionLayer")}}
- {{DOMxRef("XRCubeLayer")}}
- {{DOMxRef("XRCylinderLayer")}}
- {{DOMxRef("XREquirectLayer")}}
- {{DOMxRef("XRProjectionLayer")}}
- {{DOMxRef("XRQuadLayer")}}
- {{DOMxRef("XRMediaBinding")}}

### Liên kết WebGL

- {{DOMxRef("XRWebGLBinding")}}
- {{domxref("WebGLRenderingContext.makeXRCompatible()")}}
- {{DOMxRef("XRWebGLLayer")}}
- {{DOMxRef("XRSubImage")}}
- {{DOMxRef("XRWebGLSubImage")}}

### Neo

- {{domxref("XRAnchor")}}
- {{domxref("XRAnchorSet")}}

### Cảm nhận độ sâu

- {{domxref("XRDepthInformation")}}
- {{domxref("XRCPUDepthInformation")}}
- {{domxref("XRWebGLDepthInformation")}}

### Kiểm tra va chạm

- {{domxref("XRHitTestSource")}}
- {{domxref("XRTransientInputHitTestSource")}}
- {{domxref("XRHitTestResult")}}
- {{domxref("XRTransientInputHitTestResult")}}
- {{domxref("XRRay")}}

### Ước lượng ánh sáng

- {{domxref("XRLightEstimate")}}
- {{domxref("XRLightProbe")}}

</div>

## Hướng dẫn và bài viết

Các hướng dẫn và bài viết sau là nguồn tham khảo hữu ích để tìm hiểu WebXR và các khái niệm đồ họa 3D, VR/AR nền tảng.

<div class="index">

### Nền tảng và kiến thức cơ bản

- [Fundamentals of WebXR](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals)
- [Matrix math for the web](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web)
- [WebXR application life cycle](/en-US/docs/Web/API/WebXR_Device_API/Lifecycle)

### Tạo trải nghiệm thực tế hỗn hợp

- [Starting up and shutting down a WebXR session](/en-US/docs/Web/API/WebXR_Device_API/Startup_and_shutdown)
- [Geometry and reference spaces in WebXR](/en-US/docs/Web/API/WebXR_Device_API/Geometry)
- [Spatial tracking in WebXR](/en-US/docs/Web/API/WebXR_Device_API/Spatial_tracking)
- [Rendering and the WebXR frame animation callback](/en-US/docs/Web/API/WebXR_Device_API/Rendering)
- [Viewpoints and viewers: Simulating cameras in WebXR](/en-US/docs/Web/API/WebXR_Device_API/Cameras)
- [A perspective retrospective for WebXR developers](/en-US/docs/Web/API/WebXR_Device_API/Perspective)
- [Lighting a WebXR setting](/en-US/docs/Web/API/WebXR_Device_API/Lighting)
- [Using bounded reference spaces](/en-US/docs/Web/API/WebXR_Device_API/Bounded_reference_spaces)

### Làm cho nó tương tác

- [Movement, orientation, and motion: A WebXR example](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion)
- [Inputs and input sources](/en-US/docs/Web/API/WebXR_Device_API/Inputs)
- [Targeting and hit detection](/en-US/docs/Web/API/WebXR_Device_API/Targeting)

### Hiệu năng và bảo mật

- [WebXR performance guide](/en-US/docs/Web/API/WebXR_Device_API/Performance)
- [Permissions and security for WebXR](/en-US/docs/Web/API/WebXR_Device_API/Permissions_and_security)

</div>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Drawing graphics](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics)
- [WebGL API](/en-US/docs/Web/API/WebGL_API): Accelerated 2D and 3D graphics on the web
- [Canvas API](/en-US/docs/Web/API/Canvas_API): 2D drawing for the web
- [Canvas tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial)
