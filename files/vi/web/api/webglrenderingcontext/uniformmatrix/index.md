---
title: "WebGLRenderingContext: uniformMatrix[234]fv() method"
short-title: uniformMatrix[234]fv()
slug: Web/API/WebGLRenderingContext/uniformMatrix
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.uniformMatrix2fv
---

{{APIRef("WebGL")}}_TOK1__

Các phương thức **`WebGLRenderingContext.uniformMatrix[234]fv()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các giá trị ma trận cho các biến thống nhất.

Ba phiên bản của phương pháp này (`uniformMatrix2fv()`, `uniformMatrix3fv()` và `uniformMatrix4fv()`) lần lượt lấy giá trị đầu vào là ma trận vuông 2 thành phần, 3 thành phần và 4 thành phần. Họ dự kiến ​​​​sẽ có 4, 9 hoặc 16 phao.

## Cú pháp

```js-nolint
uniformMatrix2fv(location, transpose, value)
uniformMatrix3fv(location, transpose, value)
uniformMatrix4fv(location, transpose, value)
```

### Thông số

- `location`
  - : Một đối tượng {{domxref("WebGLUniformLocation")}} chứa vị trí của đồng phục
thuộc tính cần sửa đổi. Vị trí được lấy bằng {{domxref("WebGLRenderingContext.getUniformLocation", "getUniformLocation()")}}.
- `transpose`
  - : A {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định có chuyển vị ma trận hay không. Phải là
`false`.
- `value`
  - : Một {{jsxref("Float32Array")}} hoặc chuỗi các giá trị `GLfloat`. Các giá trị
được giả định là được cung cấp theo thứ tự cột chính.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.uniformMatrix2fv(loc, false, [2, 1, 2, 2]);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.uniform()")}}
- {{domxref("WebGL2RenderingContext.uniformMatrix()")}} – WebGL 2 phiên bản này
phương pháp.
