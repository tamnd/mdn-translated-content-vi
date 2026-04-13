---
title: "WebGLRenderingContext: getActiveAttrib() method"
short-title: getActiveAttrib()
slug: Web/API/WebGLRenderingContext/getActiveAttrib
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getActiveAttrib
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getActiveAttrib()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về một đối tượng {{domxref("WebGLActiveInfo")}} chứa kích thước, loại và tên của thuộc tính đỉnh. Nó thường được sử dụng khi truy vấn các thuộc tính không xác định để gỡ lỗi hoặc tạo thư viện chung.

## Cú pháp

```js-nolint
getActiveAttrib(program, index)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa thuộc tính đỉnh.
- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính đỉnh cần lấy. Cái này
giá trị là chỉ số từ 0 đến N - 1 được trả về bởi {{domxref("WebGLRenderingContext.getProgramParameter", "gl.getProgramParameter(program, gl.ACTIVE_ATTRIBUTES)")}}.

### Giá trị trả về

Một đối tượng {{domxref("WebGLActiveInfo")}}.

## Ví dụ

```js
const numAttribs = gl.getProgramParameter(program, gl.ACTIVE_ATTRIBUTES);
for (let i = 0; i < numAttribs; ++i) {
  const info = gl.getActiveAttrib(program, i);
  console.log("name:", info.name, "type:", info.type, "size:", info.size);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLActiveInfo")}}
