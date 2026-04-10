---
title: "WebGL2RenderingContext: phương thức createVertexArray()"
short-title: createVertexArray()
slug: Web/API/WebGL2RenderingContext/createVertexArray
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.createVertexArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.createVertexArray()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một đối tượng {{domxref("WebGLVertexArrayObject")}} đại diện cho một đối tượng mảng đỉnh (VAO) trỏ đến dữ liệu mảng đỉnh và cung cấp tên cho các tập dữ liệu đỉnh khác nhau.

## Cú pháp

```js-nolint
createVertexArray()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("WebGLVertexArrayObject")}} đại diện cho một đối tượng mảng đỉnh (VAO) trỏ đến dữ liệu mảng đỉnh.

## Ví dụ

```js
const vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// …

// các lệnh gọi bindBuffer hoặc vertexAttribPointer
// sẽ được "ghi lại" trong VAO

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLVertexArrayObject")}}