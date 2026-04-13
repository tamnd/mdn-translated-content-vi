---
title: XRCompositionLayer
slug: Web/API/XRCompositionLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRCompositionLayer
---

{{securecontext_header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRCompositionLayer`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là lớp cơ sở định nghĩa một tập hợp các thuộc tính và hành vi chung cho các kiểu layer WebXR. Nó không thể được khởi tạo trực tiếp.

Một số kiểu layer kế thừa từ `XRCompositionLayer`:

- {{domxref("XREquirectLayer")}}
- {{domxref("XRCubeLayer")}}
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRProjectionLayer")}}
- {{domxref("XRQuadLayer")}}

`XRCompositionLayer` tự nó kế thừa từ lớp {{domxref("XRLayer")}} chung (lớp này kế thừa từ {{domxref("EventTarget")}}).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("XRCompositionLayer.blendTextureSourceAlpha")}} {{Experimental_Inline}}
  - : Một giá trị boolean cho phép kênh alpha texture của layer.
- {{domxref("XRCompositionLayer.layout")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Kiểu bố cục của layer.
- {{domxref("XRCompositionLayer.mipLevels")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Số lượng mip level trong dữ liệu màu sắc và texture cho layer.
- {{domxref("XRCompositionLayer.needsRedraw")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị boolean báo hiệu rằng layer cần được kết xuất lại trong frame tiếp theo.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}_.

- {{domxref("XRCompositionLayer.destroy()")}} {{Experimental_Inline}}
  - : Xóa các tệp đính kèm layer bên dưới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("EventTarget")}}
- {{domxref("XREquirectLayer")}}
- {{domxref("XRCubeLayer")}}
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRProjectionLayer")}}
- {{domxref("XRQuadLayer")}}
