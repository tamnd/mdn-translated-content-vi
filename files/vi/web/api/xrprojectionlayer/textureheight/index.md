---
title: "XRProjectionLayer: textureHeight property"
short-title: textureHeight
slug: Web/API/XRProjectionLayer/textureHeight
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRProjectionLayer.textureHeight
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`textureHeight`** của giao diện {{domxref("XRProjectionLayer")}} cho biết chiều cao tính bằng pixel của texture màu sắc của layer này.

Chiều cao texture của projection layer được xác định bởi user agent hoặc thiết bị. Nó được báo cáo trong {{domxref("XRSubImage")}}, chỉ có thể được truy cập bên trong vòng lặp frame. Nếu bạn muốn quản lý các depth buffer của riêng mình và không muốn đợi frame đầu tiên sau khi tạo layer để xác định kích thước cần thiết cho các buffer đó, thuộc tính `textureHeight` cho phép truy cập chiều cao texture của layer bên ngoài vòng lặp frame. Việc phân bổ các buffer này có thể xảy ra ngay sau khi tạo layer.

## Giá trị

Một số cho biết chiều cao tính bằng pixel.

## Ví dụ

### Sử dụng `textureHeight`

`textureHeight` của một layer hữu ích khi tạo render buffer cho một layer. Xem thêm {{domxref("WebGL2RenderingContext.renderbufferStorageMultisample()")}}.

```js
let glLayer = xrGLBinding.createProjectionLayer();

let colorRB = gl.createRenderbuffer();
gl.bindRenderbuffer(gl.RENDERBUFFER, colorRB);
gl.renderbufferStorageMultisample(
  gl.RENDERBUFFER,
  samples,
  gl.RGBA8,
  glLayer.textureWidth,
  glLayer.textureHeight,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLBinding.createProjectionLayer()")}}
- {{domxref("WebGL2RenderingContext.renderbufferStorageMultisample()")}}
- {{domxref("XRSubImage")}}
