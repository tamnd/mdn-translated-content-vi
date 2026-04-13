---
title: XRCylinderLayer
slug: Web/API/XRCylinderLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRCylinderLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRCylinderLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một lớp chiếm một khoảng không gian hình chữ nhật cong trong môi trường thực tế ảo. Chỉ mặt trước của lớp mới hiển thị.

`XRCylinderLayer` yêu cầu tính năng `layers` phải được kích hoạt cho {{domxref("XRSession")}}. Bạn có thể yêu cầu điều này trong {{domxref("XRSystem.requestSession()")}}.

Để tạo một `XRCylinderLayer` mới, hãy gọi một trong hai:

- {{domxref("XRWebGLBinding.createCylinderLayer()")}} cho lớp texture mờ đục WebGL, hoặc
- {{domxref("XRMediaBinding.createCylinderLayer()")}} cho lớp phát lại video HTML {{HTMLElement("video")}}.

Để trình bày các lớp lên thiết bị XR, hãy thêm chúng vào trạng thái dựng hình `layers` bằng {{domxref("XRSession.updateRenderState()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("XRCompositionLayer")}}._

- {{domxref("XRCylinderLayer.aspectRatio")}} {{Experimental_Inline}}
  - : Số biểu thị tỷ lệ của phần hình trụ hiển thị. Đây là tỷ lệ giữa chiều rộng của phần hình trụ hiển thị chia cho chiều cao của nó. Chiều rộng được tính bằng cách nhân `radius` với `centralAngle`.
- {{domxref("XRCylinderLayer.centralAngle")}} {{Experimental_Inline}}
  - : Số biểu thị góc tính bằng radian của phần hình trụ hiển thị.
- {{domxref("XRCylinderLayer.radius")}} {{Experimental_Inline}}
  - : Số biểu thị bán kính của hình trụ.
- {{domxref("XRCylinderLayer.space")}} {{Experimental_Inline}}
  - : Một {{domxref("XRSpace")}} đại diện cho mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
- {{domxref("XRCylinderLayer.transform")}} {{Experimental_Inline}}
  - : Một {{domxref("XRRigidTransform")}} đại diện cho độ lệch và hướng so với `space`.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}_.

## Sự kiện

- {{domxref("XRCylinderLayer.redraw_event", "redraw")}} {{Experimental_Inline}}
  - : Được gửi đến đối tượng `XRCylinderLayer` khi các tài nguyên cơ bản của lớp bị mất hoặc khi XR Compositor không thể chiếu lại lớp. Nếu sự kiện này được gửi, các tác giả nên vẽ lại nội dung của lớp trong khung hình hoạt ảnh XR tiếp theo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("EventTarget")}}
- {{domxref("XRCompositionLayer")}}
- {{domxref("XREquirectLayer")}}
- {{domxref("XRCubeLayer")}}
- {{domxref("XRQuadLayer")}}
- {{domxref("XRProjectionLayer")}}
