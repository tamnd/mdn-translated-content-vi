---
title: "WebGLRenderingContext: polygonOffset() method"
short-title: polygonOffset()
slug: Web/API/WebGLRenderingContext/polygonOffset
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.polygonOffset
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.polygonOffset()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các hệ số và đơn vị tỷ lệ để tính toán các giá trị độ sâu.

Phần bù được thêm vào trước khi thực hiện kiểm tra độ sâu và trước khi giá trị được ghi vào bộ đệm độ sâu.

## Cú pháp

```js-nolint
polygonOffset(factor, units)
```

### Thông số

- `factor`
  - : A {{domxref("WebGL_API/Types", "GLfloat")}} thiết lập hệ số tỷ lệ cho độ lệch độ sâu thay đổi
cho mỗi đa giác. Giá trị mặc định là 0.
- `units`
  - : Một {{domxref("WebGL_API/Types", "GLfloat")}} thiết lập hệ số nhân mà theo đó một
giá trị cụ thể của việc triển khai được nhân với để tạo ra độ lệch độ sâu không đổi. Giá trị mặc định là 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Tính năng tô bù đa giác bị tắt theo mặc định. Để bật hoặc tắt tính năng tô bù đa giác, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.POLYGON_OFFSET_FILL`.

```js
gl.enable(gl.POLYGON_OFFSET_FILL);
gl.polygonOffset(2, 3);
```

Để kiểm tra hệ số hoặc đơn vị bù của đa giác hiện tại, hãy truy vấn các hằng số `POLYGON_OFFSET_FACTOR` và `POLYGON_OFFSET_UNITS`.

```js
gl.getParameter(gl.POLYGON_OFFSET_FACTOR); // 2
gl.getParameter(gl.POLYGON_OFFSET_UNITS); // 3
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.depthFunc()")}}
