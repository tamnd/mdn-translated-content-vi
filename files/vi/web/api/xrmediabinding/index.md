---
title: XRMediaBinding
slug: Web/API/XRMediaBinding
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRMediaBinding
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRMediaBinding`** được sử dụng để tạo các lớp hiển thị nội dung của một {{domxref("HTMLVideoElement")}}.

> [!NOTE]
> Chỉ các khung hình video sẽ được hiển thị trong lớp. Các điều khiển video cần được triển khai riêng và phải được vẽ trong lớp khác.

## Hàm khởi tạo

- {{domxref("XRMediaBinding.XRMediaBinding", "XRMediaBinding()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `XRMediaBinding` mới cho {{domxref("XRSession")}} đã chỉ định.

## Phương thức phiên bản

- {{domxref("XRMediaBinding.createCylinderLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRCylinderLayer")}} được liên kết với {{domxref("HTMLVideoElement")}}.
- {{domxref("XRMediaBinding.createEquirectLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XREquirectLayer")}} được liên kết với {{domxref("HTMLVideoElement")}}.
- {{domxref("XRMediaBinding.createQuadLayer()")}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("XRQuadLayer")}} được liên kết với {{domxref("HTMLVideoElement")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLVideoElement")}}
- {{domxref("XRCylinderLayer")}}, {{domxref("XREquirectLayer")}}, {{domxref("XRQuadLayer")}}
