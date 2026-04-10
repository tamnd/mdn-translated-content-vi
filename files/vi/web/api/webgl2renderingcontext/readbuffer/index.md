---
title: "WebGL2RenderingContext: phương thức readBuffer()"
short-title: readBuffer()
slug: Web/API/WebGL2RenderingContext/readBuffer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.readBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.readBuffer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chọn một bộ đệm màu làm nguồn cho pixel cho các lệnh gọi tiếp theo đến {{domxref("WebGLRenderingContext.copyTexImage2D", "copyTexImage2D")}}, {{domxref("WebGLRenderingContext.copyTexSubImage2D", "copyTexSubImage2D")}}, {{domxref("WebGL2RenderingContext.copyTexSubImage3D", "copyTexSubImage3D")}} hoặc {{domxref("WebGLRenderingContext.readPixels", "readPixels")}}.

## Cú pháp

```js-nolint
readBuffer(source)
```

### Tham số

- `source`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định một bộ đệm màu. Các giá trị có thể:
    - `gl.BACK`
      - : Đọc từ bộ đệm màu phía sau.
    - `gl.NONE`
      - : Không đọc từ bộ đệm màu nào.
    - `gl.COLOR_ATTACHMENT{0-15}`
      - : Đọc từ một trong 16 bộ đệm gắn màu.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.readBuffer(gl.COLOR_ATTACHMENT0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.copyTexSubImage2D()")}}
- {{domxref("WebGL2RenderingContext.copyTexSubImage3D()")}}
- {{domxref("WebGLRenderingContext.readPixels()")}}