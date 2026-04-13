---
title: "WebGLRenderingContext: vertexAttrib[1234]f[v]() method"
short-title: vertexAttrib[1234]f[v]()
slug: Web/API/WebGLRenderingContext/vertexAttrib
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.vertexAttrib1f
---

{{APIRef("WebGL")}}_TOK1__

Các phương thức **`WebGLRenderingContext.vertexAttrib[1234]f[v]()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các giá trị không đổi cho các thuộc tính đỉnh chung.

## Cú pháp

```js-nolint
vertexAttrib1f(index, v0)
vertexAttrib2f(index, v0, v1)
vertexAttrib3f(index, v0, v1, v2)
vertexAttrib4f(index, v0, v1, v2, v3)

vertexAttrib1fv(index, value)
vertexAttrib2fv(index, value)
vertexAttrib3fv(index, value)
vertexAttrib4fv(index, value)
```

### Thông số

- `index`
  - : A {{domxref("WebGL_API/Types", "GLuint")}} chỉ định vị trí của thuộc tính đỉnh cần
đã sửa đổi.
- `v0`, `v1`, `v2`, `v3`
  - : Một dấu phẩy động {{jsxref("Number")}} cho giá trị thuộc tính đỉnh.
- `value`
  - : A {{jsxref("Float32Array")}} cho các giá trị thuộc tính đỉnh vectơ dấu phẩy động.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Sự miêu tả

Mặc dù các thuộc tính đỉnh thường được sử dụng để chỉ định các giá trị khác nhau cho mỗi đỉnh (sử dụng {{domxref("WebGLRenderingContext.vertexAttribPointer()", "vertexAttribPointer")}}), nhưng việc chỉ định một giá trị không đổi có thể hữu ích. Ví dụ: nếu bạn có một trình đổ bóng có thuộc tính đỉnh `color`, nhưng bạn muốn vẽ mọi thứ bằng một màu duy nhất, bạn có thể sử dụng `vertexAttrib` để đạt được điều đó mà không cần tạo bộ đệm chỉ chứa một giá trị hoặc phải tạo một trình đổ bóng riêng biệt sử dụng đồng nhất cho màu.

Giá trị này sẽ được sử dụng nếu bộ đệm mảng giới hạn chưa được bật bằng {{domxref("WebGLRenderingContext.enableVertexAttribArray()", "enableVertexAttribArray")}}.

Các thuộc tính có thể là ma trận, trong trường hợp đó các cột của ma trận phải được tải vào các ô thuộc tính đỉnh liên tiếp.

Các giá trị được đặt bằng `vertexAttrib` là toàn cục; nghĩa là, chúng không phải là một phần của trạng thái đổ bóng (như các chỉ mục thuộc tính đỉnh chung cho các liên kết biến đổ bóng) và không phải là một phần của trạng thái đối tượng mảng đỉnh (như mảng thuộc tính đỉnh được bật). Cách duy nhất để thay đổi các giá trị là gọi lại hàm này.

## Ví dụ

```js
const index = gl.getAttribLocation(shaderProgram, "foobar");
// Either set each component individually:
gl.vertexAttrib3f(index, 10.0, 5.0, 2.0);
// Or provide a Float32Array:
const floatArray = new Float32Array([10.0, 5.0, 2.0]);
gl.vertexAttrib3fv(index, floatArray);
```

```js
// We want to load the following 3x3 matrix into attribute named "matrix3x3"
// 0 1 2
// 3 4 5
// 6 7 8
const matrix3x3Location = gl.getAttribLocation(shaderProgram, "matrix3x3");
gl.vertexAttrib3f(matrix3x3Location, 0, 3, 6);
gl.vertexAttrib3f(matrix3x3Location + 1, 1, 4, 7);
gl.vertexAttrib3f(matrix3x3Location + 2, 2, 5, 8);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getVertexAttrib()")}}
