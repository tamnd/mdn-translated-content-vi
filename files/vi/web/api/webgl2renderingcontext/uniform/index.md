---
title: "WebGL2RenderingContext: phương thức uniform[1234][uif][v]()"
short-title: uniform[1234][uif][v]()
slug: Web/API/WebGL2RenderingContext/uniform
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.uniform1ui
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Các phương thức **`WebGL2RenderingContext.uniform[1234][uif][v]()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị của các biến uniform.

Tên của các phương thức này được tạo thành từ:

- Số lượng thành phần trong biến uniform (1, 2, 3 hoặc 4).
- Loại của biến uniform (`i` cho số nguyên, `f` cho số thực, `ui` cho số nguyên không dấu).
- Sự hiện diện của hậu tố vector (`v`) cho các loại vector.

Hầu hết các chữ ký này được kế thừa từ [WebGL 1 API](/en-US/docs/Web/API/WebGLRenderingContext/uniform). WebGL 2 thêm các phiên bản số nguyên không dấu và các tham số `srcOffset` và `srcLength` bổ sung cho các phương thức vector.

## Cú pháp

```js-nolint
uniform1ui(location, v0)
uniform2ui(location, v0, v1)
uniform3ui(location, v0, v1, v2)
uniform4ui(location, v0, v1, v2, v3)

uniform1fv(location, data)
uniform1fv(location, data, srcOffset)
uniform1fv(location, data, srcOffset, srcLength)

uniform2fv(location, data)
uniform2fv(location, data, srcOffset)
uniform2fv(location, data, srcOffset, srcLength)

uniform3fv(location, data)
uniform3fv(location, data, srcOffset)
uniform3fv(location, data, srcOffset, srcLength)

uniform4fv(location, data)
uniform4fv(location, data, srcOffset)
uniform4fv(location, data, srcOffset, srcLength)

uniform1iv(location, data)
uniform1iv(location, data, srcOffset)
uniform1iv(location, data, srcOffset, srcLength)

uniform2iv(location, data)
uniform2iv(location, data, srcOffset)
uniform2iv(location, data, srcOffset, srcLength)

uniform3iv(location, data)
uniform3iv(location, data, srcOffset)
uniform3iv(location, data, srcOffset, srcLength)

uniform4iv(location, data)
uniform4iv(location, data, srcOffset)
uniform4iv(location, data, srcOffset, srcLength)

uniform1uiv(location, data)
uniform1uiv(location, data, srcOffset)
uniform1uiv(location, data, srcOffset, srcLength)

uniform2uiv(location, data)
uniform2uiv(location, data, srcOffset)
uniform2uiv(location, data, srcOffset, srcLength)

uniform3uiv(location, data)
uniform3uiv(location, data, srcOffset)
uniform3uiv(location, data, srcOffset, srcLength)

uniform4uiv(location, data)
uniform4uiv(location, data, srcOffset)
uniform4uiv(location, data, srcOffset, srcLength)
```

### Tham số

- `location`
  - : Một đối tượng {{domxref("WebGLUniformLocation")}} chứa vị trí của thuộc tính uniform sẽ sửa đổi.
- `data`, `v0`, `v1`, `v2`, `v3`
  - : Một giá trị mới sẽ sử dụng cho biến uniform. Các loại có thể:
    - Một {{jsxref("Number")}} cho các giá trị số nguyên không dấu (phương thức với `ui`), cho giá trị số nguyên (phương thức với `i`) hoặc cho số thực (phương thức với `f`).
    - Một {{jsxref("Uint32Array")}} (hoặc một {{jsxref("Array")}} các số nguyên không dấu) cho các phương thức vector số nguyên không dấu (phương thức với `uiv`).
    - Một {{jsxref("Int32Array")}} (hoặc một {{jsxref("Array")}} các số nguyên) cho các phương thức vector số nguyên (phương thức với `iv`).
    - Một {{jsxref("Float32Array")}} (hoặc một {{jsxref("Array")}} các số) cho các phương thức vector số thực (phương thức với `fv`).
- `srcOffset` {{optional_inline}}
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử đầu tiên trong mảng `data` sẽ sử dụng. Mặc định là `0`.
- `srcLength` {{optional_inline}}
  - : Một số nguyên không âm chỉ định số phần tử trong mảng `data` sẽ sử dụng. Mặc định là `0`, được xử lý như `data.length - srcOffset`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.uniform[1234][fi][v]()`](/en-US/docs/Web/API/WebGLRenderingContext/uniform)