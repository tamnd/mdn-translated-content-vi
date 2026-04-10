---
title: "WebGL2RenderingContext: phương thức vertexAttribDivisor()"
short-title: vertexAttribDivisor()
slug: Web/API/WebGL2RenderingContext/vertexAttribDivisor
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.vertexAttribDivisor
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.vertexAttribDivisor()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) sửa đổi tốc độ mà các thuộc tính đỉnh chung tiến lên khi kết xuất nhiều phiên bản của hình nguyên với {{domxref("WebGL2RenderingContext.drawArraysInstanced()", "gl.drawArraysInstanced()")}} và {{domxref("WebGL2RenderingContext.drawElementsInstanced()", "gl.drawElementsInstanced()")}}.

> [!NOTE]
> Khi sử dụng {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}, phần mở rộng {{domxref("ANGLE_instanced_arrays")}} cũng có thể cung cấp phương thức này.

## Cú pháp

```js-nolint
vertexAttribDivisor(index, divisor)
```

### Tham số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của các thuộc tính đỉnh chung.
- `divisor`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định số lượng phiên bản sẽ vượt qua giữa các lần cập nhật của thuộc tính chung.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.vertexAttribDivisor(0, 2);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()")}}