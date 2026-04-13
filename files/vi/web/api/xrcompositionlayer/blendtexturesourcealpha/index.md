---
title: "XRCompositionLayer: blendTextureSourceAlpha property"
short-title: blendTextureSourceAlpha
slug: Web/API/XRCompositionLayer/blendTextureSourceAlpha
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCompositionLayer.blendTextureSourceAlpha
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính **`blendTextureSourceAlpha`** của giao diện {{domxref("XRCompositionLayer")}} là một giá trị boolean cho phép {{Glossary("Alpha", "kênh alpha")}} texture của layer.

## Giá trị

Một giá trị boolean. `true` bật kênh alpha, `false` tắt nó.

## Ví dụ

### Đặt kênh alpha texture của layer

Đoạn code sau chuyển đổi layer giữa không trong suốt và ngược lại.

```js
myLayer.blendTextureSourceAlpha = !myLayer.blendTextureSourceAlpha;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Glossary("Alpha", "Alpha channel")}}
