---
title: "WebGL2RenderingContext: phương thức fenceSync()"
short-title: fenceSync()
slug: Web/API/WebGL2RenderingContext/fenceSync
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.fenceSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.fenceSync()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo một đối tượng {{domxref("WebGLSync")}} mới và chèn nó vào luồng lệnh GL.

## Cú pháp

```js-nolint
fenceSync(condition, flags)
```

### Tham số

- `condition`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điều kiện phải được đáp ứng để đặt trạng thái của đối tượng đồng bộ thành signaled. Phải là `gl.SYNC_GPU_COMMANDS_COMPLETE`.
- `flags`
  - : Một {{domxref("WebGL_API/Types", "GLbitfield")}} chỉ định tổ hợp bitwise của các cờ điều khiển hành vi của đối tượng đồng bộ. Phải là `0` (tồn tại chỉ cho các phần mở rộng).

### Giá trị trả về

Một đối tượng {{domxref("WebGLSync")}}.

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}. Đối tượng `WebGLSync` không có sẵn trong WebGL 1.

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}