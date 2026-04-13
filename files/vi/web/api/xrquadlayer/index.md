---
title: XRQuadLayer
slug: Web/API/XRQuadLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRQuadLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRQuadLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một layer chiếm một không gian hình chữ nhật phẳng trong môi trường ảo. `XRQuadLayer` không có độ dày. Nó là một đối tượng hai chiều được định vị và định hướng trong không gian 3D. Vị trí của quad đề cập đến trung tâm của quad. Chỉ mặt trước của layer mới hiển thị.

`XRQuadLayer` yêu cầu tính năng `layers` được bật cho {{domxref("XRSession")}}. Bạn có thể yêu cầu nó trong {{domxref("XRSystem.requestSession()")}}.

Để tạo một `XRQuadLayer` mới, hãy gọi:

- {{domxref("XRWebGLBinding.createQuadLayer()")}} cho một quad layer texture mờ WebGL, hoặc
- {{domxref("XRMediaBinding.createQuadLayer()")}} cho một quad layer phát lại {{HTMLElement("video")}} HTML.

Để trình bày các layer cho thiết bị XR, hãy thêm chúng vào trạng thái kết xuất `layers` bằng {{domxref("XRSession.updateRenderState()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("XRCompositionLayer")}}._

- {{domxref("XRQuadLayer.height")}} {{Experimental_Inline}}
  - : Đại diện chiều cao của layer tính bằng mét.
- {{domxref("XRQuadLayer.space")}} {{Experimental_Inline}}
  - : Một {{domxref("XRSpace")}} đại diện mối quan hệ không gian của layer với môi trường vật lý của người dùng.
- {{domxref("XRQuadLayer.transform")}} {{Experimental_Inline}}
  - : Một {{domxref("XRRigidTransform")}} đại diện độ lệch và hướng so với `space`.
- {{domxref("XRQuadLayer.width")}} {{Experimental_Inline}}
  - : Đại diện chiều rộng của layer tính bằng mét.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}_.

## Sự kiện

- {{domxref("XRQuadLayer.redraw_event", "redraw")}} {{Experimental_Inline}}
  - : Được gửi đến đối tượng `XRQuadLayer` khi các tài nguyên bên dưới của layer bị mất hoặc khi compositor XR không thể chiếu lại layer. Nếu sự kiện này được gửi, các tác giả nên vẽ lại nội dung của layer trong frame hoạt ảnh XR tiếp theo.

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
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRProjectionLayer")}}
