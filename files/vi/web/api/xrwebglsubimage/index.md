---
title: XRWebGLSubImage
slug: Web/API/XRWebGLSubImage
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRWebGLSubImage
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRWebGLSubImage`** được sử dụng trong quá trình kết xuất các lớp WebGL.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{domxref("XRSubImage")}}._

- {{domxref("XRWebGLSubImage.colorTexture")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("WebGLTexture")}} màu sắc cho {{domxref("XRCompositionLayer")}} để kết xuất.
- {{domxref("XRWebGLSubImage.depthStencilTexture")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("WebGLTexture")}} độ sâu/stencil cho {{domxref("XRCompositionLayer")}} để kết xuất.
- {{domxref("XRWebGLSubImage.imageIndex")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho vị trí offset vào mảng texture nếu lớp được yêu cầu với `texture-array`; [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) trong trường hợp khác.
- {{domxref("XRWebGLSubImage.colorTextureWidth")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho chiều rộng tính bằng pixel của GL attachment.
- {{domxref("XRWebGLSubImage.colorTextureHeight")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một số đại diện cho chiều cao tính bằng pixel của GL attachment.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLayer")}}
- {{domxref("XRWebGLBinding.getSubImage()")}}
- {{domxref("XRWebGLBinding.getViewSubImage()")}}
