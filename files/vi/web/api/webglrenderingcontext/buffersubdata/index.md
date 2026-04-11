---
title: "WebGLRenderingContext: bufferSubData() method"
short-title: bufferSubData()
slug: Web/API/WebGLRenderingContext/bufferSubData
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bufferSubData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bufferSubData()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) cập nhật một tập hợp con kho dữ liệu của đối tượng đệm.

## Cú pháp

```js-nolint
bufferSubData(target, offset)
bufferSubData(target, offset, srcData)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.ARRAY_BUFFER`
      - : Bộ đệm chứa các thuộc tính đỉnh, chẳng hạn như tọa độ đỉnh, dữ liệu tọa độ kết cấu hoặc dữ liệu màu đỉnh.
    - `gl.ELEMENT_ARRAY_BUFFER`
      - : Bộ đệm được sử dụng cho các chỉ số phần tử.

- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định độ lệch tính theo byte nơi việc thay thế dữ liệu sẽ bắt đầu.
- `srcData` {{optional_inline}}
  - : Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} xem một {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} sẽ được sao chép vào kho dữ liệu.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Một lỗi `gl.INVALID_VALUE` sẽ được đưa ra nếu dữ liệu được ghi vào cuối bộ đệm hoặc nếu `data` là `null`.
- Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `target` không phải là một trong các enum được phép.

## Ví dụ

### Sử dụng `bufferSubData`

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();
const data = new Float32Array([1, 2, 3, 4]);
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
gl.bufferSubData(gl.ARRAY_BUFFER, 512, data);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.bufferSubData()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.bufferData()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
