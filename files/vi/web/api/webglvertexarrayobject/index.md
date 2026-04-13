---
title: WebGLVertexArrayObject
slug: Web/API/WebGLVertexArrayObject
page-type: web-api-interface
browser-compat: api.WebGLVertexArrayObject
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLVertexArrayObject`** là một phần của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API), đại diện cho các đối tượng mảng vertex (VAO) trỏ đến dữ liệu mảng vertex và cung cấp tên cho các tập dữ liệu vertex khác nhau.

{{InheritanceDiagram}}

Khi làm việc với các đối tượng `WebGLVertexArrayObject`, các phương thức sau đây hữu ích:

- {{domxref("WebGL2RenderingContext.createVertexArray()")}}
- {{domxref("WebGL2RenderingContext.deleteVertexArray()")}}
- {{domxref("WebGL2RenderingContext.isVertexArray()")}}
- {{domxref("WebGL2RenderingContext.bindVertexArray()")}}

> [!NOTE]
> Phần mở rộng {{domxref("OES_vertex_array_object")}} cho phép bạn sử dụng các đối tượng mảng vertex trong ngữ cảnh WebGL 1.

## Ví dụ

```js
const vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// …

// calls to bindBuffer or vertexAttribPointer
// which will be "recorded" in the VAO

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("OES_vertex_array_object")}}
