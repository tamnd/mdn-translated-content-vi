---
title: "OES_draw_buffers_indexed: enableiOES() method"
short-title: enableiOES()
slug: Web/API/OES_draw_buffers_indexed/enableiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.enableiOES
---

{{APIRef("WebGL")}}

Phương thức `enableiOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} bật pha trộn cho một bộ đệm vẽ cụ thể.

## Cú pháp

```js-nolint
enableiOES(target, index)
```

### Tham số

- `target`
  - : Phải là `gl.BLEND`.
- `index`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `target` không phải là `gl.BLEND`, lỗi `gl.INVALID_ENUM` được ném ra.
- Nếu `index` không phải là giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.

## Ví dụ

### Bật pha trộn cho bộ đệm vẽ

Hai lời gọi sau bật pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`.

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.enableiOES(gl.BLEND, 0);
ext.enableiOES(gl.BLEND, 1);
```

Bạn có thể dùng {{domxref("WebGLRenderingContext.getParameter()")}} để xem có bao nhiêu bộ đệm vẽ khả dụng.

```js
const maxDrawBuffers = gl.getParameter(gl.MAX_DRAW_BUFFERS);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("OES_draw_buffers_indexed.disableiOES()")}}
- [WebGL draw buffer constants](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers)
