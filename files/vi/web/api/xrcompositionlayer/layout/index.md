---
title: "XRCompositionLayer: layout property"
short-title: layout
slug: Web/API/XRCompositionLayer/layout
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCompositionLayer.layout
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`layout`** của giao diện {{domxref("XRCompositionLayer")}} là kiểu bố cục của layer.

Để chỉ định kiểu bố cục của một layer, hãy sử dụng một trong các phương thức tạo layer và tùy chọn `layout` của chúng:

- {{domxref("XRWebGLBinding.createQuadLayer()")}}
- {{domxref("XRWebGLBinding.createCylinderLayer()")}}
- {{domxref("XRWebGLBinding.createEquirectLayer()")}}
- {{domxref("XRWebGLBinding.createCubeLayer()")}}

## Giá trị

Một chuỗi. Các giá trị có thể:

- `default`
  - : Layer chứa tất cả các view của phiên. Khuyến nghị sử dụng kiểu texture `texture-array` cho bố cục `default`.
- `mono`
  - : Một {{domxref("XRSubImage")}} duy nhất được cấp phát và trình bày cho cả hai mắt.
- `stereo`
  - : User agent quyết định cách phân bổ {{domxref("XRSubImage")}} (một hoặc hai) và bố cục (trên/dưới hoặc trái/phải). Khuyến nghị sử dụng kiểu texture `texture-array` cho bố cục `stereo`.
- `stereo-left-right`
  - : Một {{domxref("XRSubImage")}} duy nhất được cấp phát. Mắt trái lấy vùng trái của texture, mắt phải lấy vùng phải. Bố cục này được thiết kế để giảm thiểu lời gọi vẽ cho nội dung đã ở dạng stereo (ví dụ: video hoặc hình ảnh stereo).
- `stereo-top-bottom`
  - : Một {{domxref("XRSubImage")}} duy nhất được cấp phát. Mắt trái lấy vùng trên của texture, mắt phải lấy vùng dưới. Bố cục này được thiết kế để giảm thiểu lời gọi vẽ cho nội dung đã ở dạng stereo (ví dụ: video hoặc hình ảnh stereo).

## Ví dụ

### Đặt và lấy bố cục của layer

Để chỉ định bố cục của layer, hãy sử dụng phương thức tạo layer (như {{domxref("XRWebGLBinding.createQuadLayer()")}}) và tùy chọn `layout` của nó. Để lấy kiểu bố cục layer, hãy sử dụng thuộc tính `layout`:

```js
const layer = xrGlBinding.createQuadLayer({
  pixelWidth: 1024,
  pixelHeight: 768,
  layout: "stereo",
});

layer.layout; // "stereo"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSubImage")}}
- {{domxref("XRWebGLBinding.createQuadLayer()")}}
- {{domxref("XRWebGLBinding.createCylinderLayer()")}}
- {{domxref("XRWebGLBinding.createEquirectLayer()")}}
- {{domxref("XRWebGLBinding.createCubeLayer()")}}
