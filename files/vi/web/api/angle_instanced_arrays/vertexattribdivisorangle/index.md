---
title: "ANGLE_instanced_arrays: phương thức vertexAttribDivisorANGLE()"
short-title: vertexAttribDivisorANGLE()
slug: Web/API/ANGLE_instanced_arrays/vertexAttribDivisorANGLE
page-type: web-api-instance-method
browser-compat: api.ANGLE_instanced_arrays.vertexAttribDivisorANGLE
---

{{APIRef("WebGL")}}

Phương thức **ANGLE_instanced_arrays.vertexAttribDivisorANGLE()** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thay đổi tốc độ mà các thuộc tính đỉnh tổng quát tiến lên khi kết xuất nhiều thể hiện của các nguyên thủy với {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}} và {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}.

> [!NOTE]
> Khi dùng {{domxref("WebGL2RenderingContext", "WebGL2")}}, phương thức này mặc định có sẵn dưới dạng {{domxref("WebGL2RenderingContext.vertexAttribDivisor()", "gl.vertexAttribDivisor()")}}.

## Cú pháp

```js-nolint
vertexAttribDivisorANGLE(index, divisor)
```

### Tham số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ số của các thuộc tính đỉnh tổng quát.
- `divisor`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định số thể hiện sẽ đi qua trước khi thuộc tính tổng quát được cập nhật.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("ANGLE_instanced_arrays");
ext.vertexAttribDivisorANGLE(0, 2);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}
- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
