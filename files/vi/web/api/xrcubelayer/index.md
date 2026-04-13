---
title: XRCubeLayer
slug: Web/API/XRCubeLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRCubeLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRCubeLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một layer render trực tiếp từ [cubemap](https://en.wikipedia.org/wiki/Cube_mapping) và chiếu nó lên các mặt bên trong của hình khối.

`XRCubeLayer` yêu cầu tính năng `layers` phải được bật cho {{domxref("XRSession")}}. Bạn có thể yêu cầu nó trong {{domxref("XRSystem.requestSession()")}}.

Để tạo một `XRCubeLayer` mới, hãy gọi {{domxref("XRWebGLBinding.createCubeLayer()")}}.

Để trình bày các layer đến thiết bị XR, hãy thêm chúng vào trạng thái render `layers` bằng cách sử dụng {{domxref("XRSession.updateRenderState()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("XRCompositionLayer")}}._

- {{domxref("XRCubeLayer.space")}} {{Experimental_Inline}}
  - : Một {{domxref("XRSpace")}} đại diện cho mối quan hệ không gian của layer với môi trường vật lý của người dùng.
- {{domxref("XRCubeLayer.orientation")}} {{Experimental_Inline}}
  - : Một {{domxref("DOMPointReadOnly")}} đại diện cho hướng tương đối với thuộc tính `space`.

## Phương thức phiên bản

_Kế thừa các phương thức từ cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}_.

## Sự kiện

- {{domxref("XRCubeLayer.redraw_event", "redraw")}} {{Experimental_Inline}}
  - : Được gửi đến đối tượng `XRCubeLayer` khi các tài nguyên cơ bản của layer bị mất hoặc khi XR Compositor không còn có thể chiếu lại layer. Nếu sự kiện này được gửi, tác giả nên vẽ lại nội dung của layer trong khung hoạt ảnh XR tiếp theo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("EventTarget")}}
- {{domxref("XRCompositionLayer")}}
- {{domxref("XREquirectLayer")}}
- {{domxref("XRQuadLayer")}}
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRProjectionLayer")}}
