---
title: "WebGLRenderingContext: generateMipmap() method"
short-title: generateMipmap()
slug: Web/API/WebGLRenderingContext/generateMipmap
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.generateMipmap
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.generateMipmap()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo ra một tập hợp các mipmap cho đối tượng {{domxref("WebGLTexture")}}.

Mipmap được sử dụng để tạo khoảng cách với các đối tượng. Mipmap có độ phân giải cao hơn được sử dụng cho các đối tượng ở gần hơn và mipmap có độ phân giải thấp hơn được sử dụng cho các đối tượng ở xa hơn. Nó bắt đầu với độ phân giải của hình ảnh kết cấu và giảm một nửa độ phân giải cho đến khi hình ảnh kết cấu có kích thước 1x1 được tạo ra.

## Cú pháp

```js-nolint
generateMipmap(target)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) của kết cấu đang hoạt động
mipmap của ai sẽ được tạo ra. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Một kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP`: Một kết cấu được ánh xạ hình khối.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.TEXTURE_3D`: Một kết cấu ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Một kết cấu mảng hai chiều.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.generateMipmap(gl.TEXTURE_2D);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameterf()")}}
- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameteri()")}}
