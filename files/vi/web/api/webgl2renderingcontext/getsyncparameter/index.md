---
title: "WebGL2RenderingContext: phương thức getSyncParameter()"
short-title: getSyncParameter()
slug: Web/API/WebGL2RenderingContext/getSyncParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getSyncParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getSyncParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin tham số của một đối tượng {{domxref("WebGLSync")}}.

## Cú pháp

```js-nolint
getSyncParameter(sync, pname)
```

### Tham số

- `sync`
  - : Một đối tượng {{domxref("WebGLSync")}}.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin nào sẽ trả về. Các giá trị có thể:
    - `gl.OBJECT_TYPE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết loại của đối tượng đồng bộ (luôn là `gl.SYNC_FENCE`).
    - `gl.SYNC_STATUS`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết trạng thái của đối tượng đồng bộ (`gl.SIGNALED` hoặc `gl.UNSIGNALED`).
    - `gl.SYNC_CONDITION`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết điều kiện của đối tượng đồng bộ (luôn là `gl.SYNC_GPU_COMMANDS_COMPLETE`).
    - `gl.SYNC_FLAGS`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết các cờ mà đối tượng đồng bộ được tạo (luôn là 0 vì không có cờ nào được hỗ trợ).

### Giá trị trả về

Phụ thuộc vào tham số `pname`, là một {{domxref("WebGL_API/Types", "GLenum")}} hoặc một {{domxref("WebGL_API/Types", "GLbitfield")}}.

## Ví dụ

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
gl.getSyncParameter(sync, gl.SYNC_STATUS);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}