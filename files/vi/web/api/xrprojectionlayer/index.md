---
title: XRProjectionLayer
slug: Web/API/XRProjectionLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRProjectionLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRProjectionLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một layer lấp đầy toàn bộ tầm nhìn của người quan sát và được làm mới gần với tốc độ frame tự nhiên của thiết bị.

`XRProjectionLayer` được hỗ trợ bởi tất cả các đối tượng {{domxref("XRSession")}} (không cần mô tả tính năng `layers`).

Để tạo một `XRProjectionLayer` mới, hãy gọi {{domxref("XRWebGLBinding.createProjectionLayer()")}}. Để trình bày các layer cho thiết bị XR, hãy thêm chúng vào trạng thái kết xuất `layers` bằng {{domxref("XRSession.updateRenderState()")}}.

Các đối tượng `XRProjectionLayer` không có {{domxref("XRSpace")}} liên quan, vì chúng kết xuất toàn bộ frame.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}._

- {{domxref("XRProjectionLayer.fixedFoveation")}} {{Experimental_Inline}}
  - : Một số cho biết mức độ foveation được compositor XR sử dụng cho layer. Fixed Foveated Rendering (FFR) kết xuất các cạnh của texture mắt ở độ phân giải thấp hơn so với trung tâm và giảm tải GPU.
- {{domxref("XRProjectionLayer.ignoreDepthValues")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean cho biết rằng compositor XR không sử dụng các giá trị depth buffer khi kết xuất layer.
- {{domxref("XRProjectionLayer.textureArrayLength")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số lượng layer của layer cho texture mảng khi sử dụng `texture-array` làm `textureType`.
- {{domxref("XRProjectionLayer.textureHeight")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chiều cao tính bằng pixel của texture màu sắc của layer này.
- {{domxref("XRProjectionLayer.textureWidth")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chiều rộng tính bằng pixel của texture màu sắc của layer này.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("XRCompositionLayer")}} và {{domxref("EventTarget")}}_.

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
- {{domxref("XRQuadLayer")}}
