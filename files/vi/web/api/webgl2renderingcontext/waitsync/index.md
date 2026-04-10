---
title: "WebGL2RenderingContext: phương thức waitSync()"
short-title: waitSync()
slug: Web/API/WebGL2RenderingContext/waitSync
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.waitSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.waitSync()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về ngay lập tức, nhưng chờ trên máy chủ GL cho đến khi đối tượng {{domxref("WebGLSync")}} đã cho được signaled.

Phương thức này là no-op khi không có khả năng đồng bộ hóa giữa nhiều ngữ cảnh GL.

## Cú pháp

```js-nolint
waitSync(sync, flags, timeout)
```

### Tham số

- `sync`
  - : Một đối tượng {{domxref("WebGLSync")}} để chờ.
- `flags`
  - : Một {{domxref("WebGL_API/Types", "GLbitfield")}} chỉ định tổ hợp bitwise của các cờ điều khiển hành vi flush. Phải là `0` (tồn tại chỉ cho các phần mở rộng).
- `timeout`
  - : Một {{domxref("WebGL_API/Types", "GLint64")}} chỉ định thời gian chờ máy chủ nên đợi trước khi tiếp tục. Phải là `gl.TIMEOUT_IGNORED`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
gl.waitSync(sync, 0, gl.TIMEOUT_IGNORED);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}