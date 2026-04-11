---
title: "WebGLRenderingContext: getActiveUniform() method"
short-title: getActiveUniform()
slug: Web/API/WebGLRenderingContext/getActiveUniform
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getActiveUniform
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getActiveUniform()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về một đối tượng {{domxref("WebGLActiveInfo")}} chứa kích thước, loại và tên của một thuộc tính đồng nhất. Nó thường được sử dụng khi truy vấn các đồng phục không xác định để gỡ lỗi hoặc tạo thư viện chung.

## Cú pháp

```js-nolint
getActiveUniform(program, index)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} chỉ định chương trình đổ bóng WebGL để từ đó
lấy thông tin của biến thống nhất.
- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính thống nhất cần lấy. Cái này
giá trị là chỉ số từ 0 đến N - 1 được trả về bởi {{domxref("WebGLRenderingContext.getProgramParameter", "gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS)")}}.

### Giá trị trả về

Một đối tượng {{domxref("WebGLActiveInfo")}} mô tả đồng phục.

Thuộc tính `type` của giá trị trả về sẽ là một trong những thuộc tính sau:

- `gl.FLOAT`
- `gl.FLOAT_VEC2`
- `gl.FLOAT_VEC3`
- `gl.FLOAT_VEC4`
- `gl.INT`
- `gl.INT_VEC2`
- `gl.INT_VEC3`
- `gl.INT_VEC4`
- `gl.BOOL`
- `gl.BOOL_VEC2`
- `gl.BOOL_VEC3`
- `gl.BOOL_VEC4`
- `gl.FLOAT_MAT2`
- `gl.FLOAT_MAT3`
- `gl.FLOAT_MAT4`
- `gl.SAMPLER_2D`
- `gl.SAMPLER_CUBE`
- Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}},
có thể bổ sung thêm các giá trị sau:
  - `gl.UNSIGNED_INT`
  - `gl.UNSIGNED_INT_VEC2`
  - `gl.UNSIGNED_INT_VEC3`
  - `gl.UNSIGNED_INT_VEC4`
  - `gl.FLOAT_MAT2x3`
  - `gl.FLOAT_MAT2x4`
  - `gl.FLOAT_MAT3x2`
  - `gl.FLOAT_MAT3x4`
  - `gl.FLOAT_MAT4x2`
  - `gl.FLOAT_MAT4x3`
  - `gl.SAMPLER_3D`
  - `gl.SAMPLER_2D_SHADOW`
  - `gl.SAMPLER_2D_ARRAY`
  - `gl.SAMPLER_2D_ARRAY_SHADOW`
  - `gl.SAMPLER_CUBE_SHADOW`
  - `gl.INT_SAMPLER_2D`
  - `gl.INT_SAMPLER_3D`
  - `gl.INT_SAMPLER_CUBE`
  - `gl.INT_SAMPLER_2D_ARRAY`
  - `gl.UNSIGNED_INT_SAMPLER_2D`
  - `gl.UNSIGNED_INT_SAMPLER_3D`
  - `gl.UNSIGNED_INT_SAMPLER_CUBE`
  - `gl.UNSIGNED_INT_SAMPLER_2D_ARRAY`

Khi `gl.linkProgram` được gọi, WebGL tạo ra một danh sách các đồng phục đang hoạt động. Đây là các giá trị có thể có của thuộc tính `name` của các giá trị trả về của `getActiveUniform`. WebGL tạo ra một hoặc nhiều mục trong danh sách tùy thuộc vào loại đồng phục được khai báo trong shader:

- Loại cơ bản duy nhất: một mục có tên của đồng phục. Ví dụ.
`uniform vec4 a;` sẽ dẫn đến `a`.
- Mảng kiểu cơ bản: một mục có tên của đồng phục kèm theo
`[0]`. Ví dụ. `uniform vec4 b[];` sẽ dẫn đến `b[0]`.
- Kiểu cấu trúc: một mục nhập cho mỗi thành viên của cấu trúc. Ví dụ.
`uniform struct { float foo; vec4 bar; } c;` sẽ tạo ra `c.foo` và `c.bar`.
- Mảng cấu trúc hoặc mảng: mỗi mục của mảng sẽ tạo ra các mục riêng.
Ví dụ. `uniform struct { float foo; vec4 bar; } d[2];` sẽ dẫn đến:
  - `d[0].foo`
  - `d[0].bar`
  - `d[1].foo`
  - `d[1].bar`

- Khối thống nhất: một mục cho mỗi thành viên. Nếu khối thống nhất có một thể hiện
tên, tên khối được đặt trước. Ví dụ. `uniform Block { float foo; };` sẽ tạo ra `foo`, và `uniform Block { float bar; } e;` sẽ tạo ra `e.bar`.

Thuộc tính `size` của giá trị trả về tương ứng với độ dài của mảng dành cho đồng phục được khai báo dưới dạng mảng. Ngược lại, nó là 1 (bao gồm các khối giao diện được thể hiện bằng mảng).

### Ngoại lệ

- `gl.INVALID_VALUE` được tạo ra nếu chương trình
{{domxref("WebGLProgram")}} không hợp lệ (không được liên kết, bị xóa, v.v.).
- `gl.INVALID_VALUE` được tạo nếu chỉ mục không nằm trong phạm vi \[0,
`gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS)` - 1].

## Ví dụ

```js
const numUniforms = gl.getProgramParameter(program, gl.ACTIVE_UNIFORMS);
for (let i = 0; i < numUniforms; ++i) {
  const info = gl.getActiveUniform(program, i);
  console.log("name:", info.name, "type:", info.type, "size:", info.size);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLActiveInfo")}}
- {{domxref("WebGLRenderingContext.getUniformLocation()")}}
