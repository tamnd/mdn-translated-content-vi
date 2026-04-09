---
title: ANGLE_instanced_arrays
slug: Web/API/ANGLE_instanced_arrays
page-type: web-api-interface
browser-compat: api.ANGLE_instanced_arrays
---

{{APIRef("WebGL")}}

Tiện ích mở rộng **`ANGLE_instanced_arrays`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép vẽ cùng một đối tượng, hoặc các nhóm đối tượng tương tự, nhiều lần nếu chúng chia sẻ cùng dữ liệu đỉnh, số lượng nguyên thủy và kiểu nguyên thủy.

Các tiện ích mở rộng WebGL có thể dùng thông qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem thêm [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [WebGL tutorial](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích mở rộng này chỉ khả dụng cho ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của tiện ích mở rộng này mặc định đã có trên ngữ cảnh WebGL2 và các hằng số cùng phương thức có sẵn mà không cần hậu tố `ANGLE_`.
>
> Mặc dù có tên là "ANGLE", tiện ích mở rộng này hoạt động trên mọi thiết bị nếu phần cứng hỗ trợ, chứ không chỉ trên Windows khi dùng thư viện ANGLE. "ANGLE" chỉ cho biết tiện ích mở rộng này được viết bởi các tác giả của thư viện ANGLE.

## Hằng số

Tiện ích mở rộng này cung cấp một hằng số mới, có thể dùng trong phương thức {{domxref("WebGLRenderingContext.getVertexAttrib()", "gl.getVertexAttrib()")}}:

- `ext.VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE`
  - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} mô tả số chia tần suất được dùng cho kết xuất theo thể hiện khi dùng {{domxref("WebGLRenderingContext.getVertexAttrib()", "gl.getVertexAttrib()")}} với tham số `pname`.

## Phương thức thể hiện

Tiện ích mở rộng này cung cấp ba phương thức mới.

- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}}
  - : Hoạt động giống hệt {{domxref("WebGLRenderingContext.drawArrays()", "gl.drawArrays()")}} nhưng cho phép thực thi nhiều thể hiện của dải phần tử, và thể hiện được tiến lên sau mỗi lần lặp.
- {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}
  - : Hoạt động giống hệt {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}} nhưng cho phép thực thi nhiều thể hiện của một tập phần tử, và thể hiện được tiến lên giữa mỗi tập.
- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()", "ext.vertexAttribDivisorANGLE()")}}
  - : Thay đổi tốc độ mà các thuộc tính đỉnh tổng quát tiến lên khi kết xuất nhiều thể hiện của các nguyên thủy với {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}} và {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}.

## Ví dụ

Ví dụ sau cho thấy cách vẽ một hình học nhất định nhiều lần chỉ với một lần gọi vẽ.

> [!WARNING]
> Phần sau mang tính minh họa, không phải mã sản xuất. Nói chung nên tránh tạo dữ liệu / buffer trong vòng lặp kết xuất hoặc ngay trước khi dùng.

```js
// enable the extension
const ext = gl.getExtension("ANGLE_instanced_arrays");

// binding the geometry buffer as usual
gl.bindBuffer(gl.ARRAY_BUFFER, geometryVertexBuffer);
gl.enableVertexAttribArray(vertexPositionAttributeLocation);
gl.vertexAttribPointer(
  vertexPositionAttributeLocation,
  3,
  gl.FLOAT,
  false,
  0,
  0,
);

// build position buffer
const instancePositions = [];
for (const instance of instances) {
  instancePositions.push(
    instance.position.x,
    instance.position.y,
    instance.position.z,
  );
}
const instancePositionBuffer = createWebGLBufferFromData(instancePositions);

// binding the instance position buffer as you would with any attribute
gl.bindBuffer(gl.ARRAY_BUFFER, instancePositionBuffer);
gl.enableVertexAttribArray(instancePositionAttributeLocation);
gl.vertexAttribPointer(
  instancePositionAttributeLocation,
  3,
  gl.FLOAT,
  false,
  0,
  0,
);

// mark the attribute as instanced and advance it every single(1) instance rather than every vertex
ext.vertexAttribDivisorANGLE(instancePositionAttributeLocation, 1);

// draw geometry for each instance
ext.drawArraysInstancedANGLE(
  gl.TRIANGLES,
  0,
  numGeometryVertices,
  instances.length,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
