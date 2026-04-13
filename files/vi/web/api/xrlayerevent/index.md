---
title: XRLayerEvent
slug: Web/API/XRLayerEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRLayerEvent
---

{{APIRef("WebXR Device API")}} {{securecontext_header}}{{SeeCompatTable}}

Giao diện **`XRLayerEvent`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là loại sự kiện cho các sự kiện liên quan đến sự thay đổi trạng thái của một đối tượng {{domxref("XRLayer")}}. Các sự kiện này xảy ra, ví dụ, khi layer cần được vẽ lại.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRLayerEvent.XRLayerEvent", "XRLayerEvent()")}} {{Experimental_Inline}}
  - : Tạo và trả về một đối tượng `XRLayerEvent` mới.

## Thuộc tính phiên bản

_Ngoài các thuộc tính được kế thừa từ giao diện cha {{domxref("Event")}}, `XRLayerEvent` cung cấp thêm:_

- {{domxref("XRLayerEvent.layer", "layer")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : {{domxref("XRLayer")}} đã tạo ra sự kiện.

## Phương thức phiên bản

_Mặc dù `XRSessionEvent` không định nghĩa phương thức nào, nó kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Các loại sự kiện

_Các sự kiện sau đây được đại diện bằng giao diện `XRLayerEvent` và là các giá trị hợp lệ cho tham số `type` của nó._

### Sự kiện `redraw`

Sự kiện `redraw` được gửi đến đối tượng layer khi các tài nguyên cơ bản của layer bị mất hoặc khi XR Compositor không thể chiếu lại layer. Nếu sự kiện này được gửi, tác giả nên vẽ lại nội dung của layer trong khung hoạt ảnh XR tiếp theo. Nó có sẵn trên các đối tượng layer sau:

- {{domxref("XRQuadLayer")}}: {{domxref("XRQuadLayer.redraw_event", "redraw")}}
- {{domxref("XRCylinderLayer")}}: {{domxref("XRCylinderLayer.redraw_event", "redraw")}}
- {{domxref("XREquirectLayer")}}: {{domxref("XREquirectLayer.redraw_event", "redraw")}}
- {{domxref("XRCubeLayer")}}: {{domxref("XRCubeLayer.redraw_event", "redraw")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCompositionLayer.needsRedraw")}}
