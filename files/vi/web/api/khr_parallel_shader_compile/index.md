---
title: KHR_parallel_shader_compile extension
short-title: KHR_parallel_shader_compile
slug: Web/API/KHR_parallel_shader_compile
page-type: webgl-extension
browser-compat: api.KHR_parallel_shader_compile
---

{{APIRef("WebGL")}}

Phần mở rộng **`KHR_parallel_shader_compile`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép thao tác poll không chặn, để trạng thái khả dụng biên dịch/liên kết (`COMPLETION_STATUS_KHR`) có thể được truy vấn mà không có khả năng gây ra các khoảng trễ. Nói cách khác, bạn có thể kiểm tra trạng thái biên dịch shader mà không chặn runtime.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

## Hằng số

- `ext.COMPLETION_STATUS_KHR`
  - : Một GLenum.

## Ví dụ

Bật phần mở rộng:

```js
const ext = gl.getExtension("KHR_parallel_shader_compile");
```

Thực hành tốt nhất với hoặc không có phần mở rộng là:

```js
// Assuming lists of `shaders` and `programs`:
for (const x of shaders) gl.compileShader(x); // Never check compile status unless subsequent linking fails.
for (const x of programs) gl.linkProgram(x);
```

Với phần mở rộng, các ứng dụng có thể poll xem chương trình có được liên kết chưa mà không gây ra jank:

```js
// Generator yielding a progress ratio [0.0, 1.0].
// Without the extension, this will jank and only check one program per generation.
function* linkingProgress(programs) {
  const ext = gl.getExtension("KHR_parallel_shader_compile");
  let todo = programs.slice();
  while (todo.length) {
    if (ext) {
      todo = todo.filter(
        (x) => !gl.getProgramParameter(x, ext.COMPLETION_STATUS_KHR),
      );
    } else {
      const x = todo.pop();
      gl.getProgramParameter(x, gl.LINK_STATUS);
    }
    if (!todo.length) return;
    yield 1.0 - todo.length / programs.length;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
