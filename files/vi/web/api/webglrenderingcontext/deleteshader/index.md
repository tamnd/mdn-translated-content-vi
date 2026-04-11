---
title: "WebGLRenderingContext: deleteShader() method"
short-title: deleteShader()
slug: Web/API/WebGLRenderingContext/deleteShader
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteShader()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) đánh dấu một đối tượng {{domxref("WebGLShader")}} nhất định để xóa. Sau đó nó sẽ bị xóa bất cứ khi nào shader không còn được sử dụng. Phương pháp này không có tác dụng nếu shader đã bị xóa, và {{domxref("WebGLShader")}} được tự động đánh dấu để xóa khi nó bị bộ thu gom rác phá hủy.

## Cú pháp

```js-nolint
deleteShader(shader)
```

### Thông số

- `shader`
  - : Một đối tượng {{domxref("WebGLShader")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa trình đổ bóng

```js
gl.deleteShader(shader);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.isShader()")}}
- {{domxref("WebGLRenderingContext.getAttachedShaders()")}}
