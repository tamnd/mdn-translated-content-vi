---
title: "WebGLRenderingContext: uniform[1234][fi][v]() method"
short-title: uniform[1234][fi][v]()
slug: Web/API/WebGLRenderingContext/uniform
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.uniform1f
---

{{APIRef("WebGL")}}_TOK1__

Các phương thức **`WebGLRenderingContext.uniform[1234][fi][v]()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị của các biến thống nhất. Tất cả các biến thống nhất hoạt động được xác định trong đối tượng chương trình được khởi tạo về 0 khi đối tượng chương trình được liên kết thành công. Chúng giữ lại các giá trị được gán cho chúng bằng lệnh gọi phương thức này cho đến khi hoạt động liên kết thành công tiếp theo xảy ra trên đối tượng chương trình, khi chúng một lần nữa được khởi tạo về 0.

> [!GHI CHÚ]
> Nhiều chức năng được mô tả ở đây có giao diện WebGL 2 mở rộng, có thể
> được tìm thấy dưới
> [`WebGL2RenderingContext.uniform[1234][uif][v]()`](/en-US/docs/Web/API/WebGL2RenderingContext/đồng phục).

## Cú pháp

```js-nolint
uniform1f(location, v0)
uniform1fv(location, value)
uniform1i(location, v0)
uniform1iv(location, value)

uniform2f(location, v0, v1)
uniform2fv(location, value)
uniform2i(location, v0, v1)
uniform2iv(location, value)

uniform3f(location, v0, v1, v2)
uniform3fv(location, value)
uniform3i(location, v0, v1, v2)
uniform3iv(location, value)

uniform4f(location, v0, v1, v2, v3)
uniform4fv(location, value)
uniform4i(location, v0, v1, v2, v3)
uniform4iv(location, value)
```

### Thông số

- `location`
  - : Một đối tượng {{domxref("WebGLUniformLocation")}} chứa vị trí của đồng phục
thuộc tính cần sửa đổi.
- `value`, `v0`, `v1`, `v2`, `v3`
  - : Một giá trị mới được sử dụng cho biến thống nhất. Các loại có thể:
    - Một dấu phẩy động {{jsxref("Number")}} cho các giá trị dấu phẩy động (các phương thức có
"f").
    - Một chuỗi các số dấu phẩy động (ví dụ {{jsxref("Float32Array")}}
hoặc {{jsxref("Array")}} số) cho các phương thức vectơ dấu phẩy động (các phương thức có "fv").
    - Một số nguyên {{jsxref("Number")}} cho các giá trị số nguyên (các phương thức có "i").
    - {{jsxref("Int32Array")}} cho các phương thức vectơ số nguyên (các phương thức có "iv").

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.uniform1f(u_alpha, 0.8);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.uniformMatrix()")}}
