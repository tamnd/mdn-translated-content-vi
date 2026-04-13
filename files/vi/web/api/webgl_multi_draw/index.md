---
title: WEBGL_multi_draw extension
short-title: WEBGL_multi_draw
slug: Web/API/WEBGL_multi_draw
page-type: webgl-extension
browser-compat: api.WEBGL_multi_draw
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_multi_draw`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép kết xuất nhiều hình nguyên thủy chỉ với một lần gọi hàm. Điều này có thể cải thiện hiệu suất của ứng dụng WebGL vì nó giảm chi phí ràng buộc trong bộ kết xuất và tăng tốc thời gian luồng GPU với dữ liệu đồng nhất.

Khi tiện ích này được bật:

- Các phương thức mới xử lý nhiều danh sách đối số trong một lần gọi được thêm vào (xem danh sách phương thức bên dưới).
- Biến tích hợp `gl_DrawID` được thêm vào ngôn ngữ tô bóng.

> [!NOTE]
> Tiện ích này có sẵn cho cả hai ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}}.
>
> Trong mã shader, cần gọi lệnh `#extension GL_ANGLE_multi_draw` để bật tiện ích.
>
> Tiện ích này bật ngầm tiện ích {{domxref("ANGLE_instanced_arrays")}}.

## Phương thức phiên bản

- [`ext.multiDrawArraysWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawArraysWEBGL)
  - : Kết xuất nhiều hình nguyên thủy từ dữ liệu mảng (giống như nhiều lần gọi [`drawArrays`](/en-US/docs/Web/API/WebGLRenderingContext/drawArrays)).
- [`ext.multiDrawElementsWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawElementsWEBGL)
  - : Kết xuất nhiều hình nguyên thủy từ dữ liệu mảng phần tử (giống như nhiều lần gọi [`drawElements`](/en-US/docs/Web/API/WebGLRenderingContext/drawElements)).
- [`ext.multiDrawArraysInstancedWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawArraysInstancedWEBGL)
  - : Kết xuất nhiều hình nguyên thủy từ dữ liệu mảng (giống như nhiều lần gọi [`drawArraysInstanced`](/en-US/docs/Web/API/WebGL2RenderingContext/drawArraysInstanced)).
- [`ext.multiDrawElementsInstancedWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawElementsInstancedWEBGL)
  - : Kết xuất nhiều hình nguyên thủy từ dữ liệu mảng phần tử (giống như nhiều lần gọi [`drawElementsInstanced`](/en-US/docs/Web/API/WebGL2RenderingContext/drawElementsInstanced)).

## Tiện ích shader

Lưu ý: Mặc dù tên tiện ích là `WEBGL_multi_draw`, tiện ích phải được bật với lệnh `#extension GL_ANGLE_multi_draw` để sử dụng trong shader.

Khi tiện ích này được bật, biến tích hợp `gl_DrawID` có thể được sử dụng trong mã shader. Đối với bất kỳ biến thể lệnh vẽ `multi*` nào, chỉ số của lần vẽ `i` có thể được đọc bởi vertex shader như `gl_DrawID`. Đối với các lệnh gọi không phải `multi*`, giá trị của `gl_DrawID` là `0`.

```html
<script type="x-shader/x-vertex">
  #extension GL_ANGLE_multi_draw : require
  void main() {
    gl_Position = vec4(gl_DrawID, 0, 0, 1);
  }
</script>
```

## Ví dụ

### Bật tiện ích

Tiện ích WebGL có sẵn bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem thêm [Sử dụng tiện ích](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

```js
let ext = gl.getExtension("WEBGL_multi_draw");
```

### Vẽ nhiều mảng

Ví dụ gọi [`ext.multiDrawArraysWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawArraysWEBGL) và [`ext.multiDrawArraysInstancedWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawArraysInstancedWEBGL):

```js
// multiDrawArrays variant
const firsts = new Int32Array(/* … */);
const counts = new Int32Array(/* … */);
ext.multiDrawArraysWEBGL(gl.TRIANGLES, firsts, 0, counts, 0, firsts.length);
```

```js
// multiDrawArraysInstanced variant
const firsts = new Int32Array(/* … */);
const counts = new Int32Array(/* … */);
const instanceCounts = new Int32Array(/* … */);
ext.multiDrawArraysInstancedWEBGL(
  gl.TRIANGLES,
  firsts,
  0,
  counts,
  0,
  instanceCounts,
  0,
  firsts.length,
);
```

### Vẽ nhiều phần tử

Ví dụ gọi [`ext.multiDrawElementsWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawElementsWEBGL) và [`ext.multiDrawElementsInstancedWEBGL()`](/en-US/docs/Web/API/WEBGL_multi_draw/multiDrawElementsInstancedWEBGL).

Giả sử rằng các chỉ số đã được tải lên trước đó vào `ELEMENT_ARRAY_BUFFER` cần được xử lý như `UNSIGNED_SHORT`.

```js
// multiDrawElements variant
const counts = new Int32Array(/* … */);
const offsets = new Int32Array(/* … */);
ext.multiDrawElementsWEBGL(
  gl.TRIANGLES,
  counts,
  0,
  gl.UNSIGNED_SHORT,
  offsets,
  0,
  counts.length,
);
```

```js
// multiDrawElementsInstanced variant
const counts = new Int32Array(/* … */);
const offsets = new Int32Array(/* … */);
const instanceCounts = new Int32Array(/* … */);
ext.multiDrawElementsInstancedWEBGL(
  gl.TRIANGLES,
  counts,
  0,
  gl.UNSIGNED_SHORT,
  offsets,
  0,
  instanceCounts,
  0,
  counts.length,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()")}} hoặc trong WebGL 2: {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()")}} hoặc trong WebGL 2: {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
