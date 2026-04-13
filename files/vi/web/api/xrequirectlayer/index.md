---
title: XREquirectLayer
slug: Web/API/XREquirectLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XREquirectLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XREquirectLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một lớp ánh xạ dữ liệu mã hóa [equirectangular](https://en.wikipedia.org/wiki/Equirectangular_projection) lên mặt trong của một hình cầu.

`XREquirectLayer` yêu cầu tính năng `layers` phải được bật cho {{domxref("XRSession")}}. Bạn có thể yêu cầu nó trong {{domxref("XRSystem.requestSession()")}}.

Để tạo một `XREquirectLayer` mới, gọi:

- {{domxref("XRWebGLBinding.createEquirectLayer()")}} cho lớp texture mờ đục WebGL, hoặc
- {{domxref("XRMediaBinding.createEquirectLayer()")}} cho lớp phát video HTML {{HTMLElement("video")}}.

Để trình bày các lớp với thiết bị XR, thêm chúng vào trạng thái kết xuất `layers` bằng cách sử dụng {{domxref("XRSession.updateRenderState()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("XRCompositionLayer")}}._

- {{domxref("XREquirectLayer.centralHorizontalAngle")}} {{Experimental_Inline}}
  - : Một số cho biết góc ngang trung tâm tính bằng radian cho hình cầu.
- {{domxref("XREquirectLayer.lowerVerticalAngle")}} {{Experimental_Inline}}
  - : Một số cho biết góc dọc dưới tính bằng radian cho hình cầu.
- {{domxref("XREquirectLayer.radius")}} {{Experimental_Inline}}
  - : Một số cho biết bán kính của hình cầu.
- {{domxref("XREquirectLayer.space")}} {{Experimental_Inline}}
  - : Một {{domxref("XRSpace")}} đại diện cho mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
- {{domxref("XREquirectLayer.transform")}} {{Experimental_Inline}}
  - : Một {{domxref("XRRigidTransform")}} đại diện cho độ lệch và hướng tương đối với `space`.
- {{domxref("XREquirectLayer.upperVerticalAngle")}} {{Experimental_Inline}}
  - : Một số cho biết góc dọc trên tính bằng radian cho hình cầu.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}_.

## Sự kiện

- {{domxref("XREquirectLayer.redraw_event", "redraw")}} {{Experimental_Inline}}
  - : Được gửi đến đối tượng `XREquirectLayer` khi các tài nguyên cơ bản của lớp bị mất hoặc khi XR Compositor không thể tái chiếu lớp nữa. Nếu sự kiện này được gửi, tác giả nên vẽ lại nội dung của lớp trong khung animation XR tiếp theo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("EventTarget")}}
- {{domxref("XRCompositionLayer")}}
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRCubeLayer")}}
- {{domxref("XRQuadLayer")}}
- {{domxref("XRProjectionLayer")}}
