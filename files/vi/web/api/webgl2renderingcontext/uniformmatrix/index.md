---
title: "WebGL2RenderingContext: phương thức uniformMatrix[234]x[234]fv()"
short-title: uniformMatrix[234]x[234]fv()
slug: Web/API/WebGL2RenderingContext/uniformMatrix
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.uniformMatrix2fv
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Các phương thức **`WebGL2RenderingContext.uniformMatrix[234]x[234]fv()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị ma trận cho các biến uniform.

> [!NOTE]
> Không có các phiên bản `2x2`, `3x3` và `4x4` của phương thức này. Chúng được viết tắt thành `2`, `3` và `4`. Xem cú pháp bên dưới.

## Cú pháp

```js-nolint
uniformMatrix2fv(location, transpose, data)
uniformMatrix2fv(location, transpose, data, srcOffset)
uniformMatrix2fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix3x2fv(location, transpose, data)
uniformMatrix3x2fv(location, transpose, data, srcOffset)
uniformMatrix3x2fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix4x2fv(location, transpose, data)
uniformMatrix4x2fv(location, transpose, data, srcOffset)
uniformMatrix4x2fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix2x3fv(location, transpose, data)
uniformMatrix2x3fv(location, transpose, data, srcOffset)
uniformMatrix2x3fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix3fv(location, transpose, data)
uniformMatrix3fv(location, transpose, data, srcOffset)
uniformMatrix3fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix4x3fv(location, transpose, data)
uniformMatrix4x3fv(location, transpose, data, srcOffset)
uniformMatrix4x3fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix2x4fv(location, transpose, data)
uniformMatrix2x4fv(location, transpose, data, srcOffset)
uniformMatrix2x4fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix3x4fv(location, transpose, data)
uniformMatrix3x4fv(location, transpose, data, srcOffset)
uniformMatrix3x4fv(location, transpose, data, srcOffset, srcLength)

uniformMatrix4fv(location, transpose, data)
uniformMatrix4fv(location, transpose, data, srcOffset)
uniformMatrix4fv(location, transpose, data, srcOffset, srcLength)
```

### Tham số

- `location`
  - : Một đối tượng {{domxref("WebGLUniformLocation")}} chứa vị trí của thuộc tính uniform sẽ sửa đổi.
- `transpose`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định xem có chuyển vị ma trận hay không.
- `data`
  - : Một {{jsxref("Float32Array")}} các giá trị float.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.uniformMatrix2x3fv(loc, false, [1, 2, 3, 4, 5, 6]);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.uniformMatrix()")}}