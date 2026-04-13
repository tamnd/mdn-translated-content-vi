---
title: "WebGL2RenderingContext: phương thức vertexAttribIPointer()"
short-title: vertexAttribIPointer()
slug: Web/API/WebGL2RenderingContext/vertexAttribIPointer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.vertexAttribIPointer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.vertexAttribIPointer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chỉ định định dạng dữ liệu số nguyên và vị trí của các thuộc tính đỉnh trong một mảng thuộc tính đỉnh.

## Cú pháp

```js-nolint
vertexAttribIPointer(index, size, type, stride, offset)
```

### Tham số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính đỉnh sẽ được sửa đổi.
- `size`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định số lượng thành phần trên mỗi thuộc tính đỉnh. Phải là 1, 2, 3 hoặc 4.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại dữ liệu của mỗi thành phần trong mảng. Phải là một trong: `gl.BYTE`, `gl.UNSIGNED_BYTE`, `gl.SHORT`, `gl.UNSIGNED_SHORT`, `gl.INT` hoặc `gl.UNSIGNED_INT`.
- `stride`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định offset tính bằng byte giữa phần bắt đầu của các thuộc tính đỉnh liên tiếp.
- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định offset tính bằng byte của thành phần đầu tiên trong mảng thuộc tính đỉnh. Phải là bội số của `type`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Mô tả

Rất giống với {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}. Sự khác biệt chính là trong khi các giá trị được chỉ định bởi `vertexAttribPointer` luôn được hiểu là giá trị float trong shader (ngay cả khi chúng ban đầu được chỉ định là số nguyên trong bộ đệm), phương thức này cho phép chỉ định các giá trị được hiểu là số nguyên trong shader.

## Ví dụ

### Linear Blend Skinning

```js
// Mô tả bố cục của bộ đệm:
// 1. position
gl.vertexAttribPointer(0, 3, gl.FLOAT, false, 20, 0);
gl.enableVertexAttribArray(0);
// 2. bone weights, normalized to [0, 1]
gl.vertexAttribPointer(1, 4, gl.UNSIGNED_BYTE, true, 20, 12);
gl.enableVertexAttribArray(1);
// 3. bone indices, interpreted as integer
gl.vertexAttribIPointer(2, 4, gl.UNSIGNED_BYTE, 20, 16);
gl.enableVertexAttribArray(2);

// Kết nối với các thuộc tính từ vertex shader
gl.bindAttribLocation(shaderProgram, 0, "position");
gl.bindAttribLocation(shaderProgram, 1, "boneWeights");
gl.bindAttribLocation(shaderProgram, 2, "boneIndices");
```

```html
<script id="shader-vs" type="x-shader/x-vertex">
  #version 300 es

  uniform mat4 mvMatrix;
  uniform mat4 bones[120];

  in vec3 position;
  in vec4 boneWeights;
  in uvec4 boneIndices;//read as 4-component unsigned integer

  void main() {
      vec4 skinnedPosition =
          bones[boneIndices.s] * vec4(position, 1.0) * boneWeights.s +
          bones[boneIndices.t] * vec4(position, 1.0) * boneWeights.t +
          bones[boneIndices.p] * vec4(position, 1.0) * boneWeights.p +
          bones[boneIndices.q] * vec4(position, 1.0) * boneWeights.q;
      gl_Position = mvMatrix * skinnedPosition;
  }
</script>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}