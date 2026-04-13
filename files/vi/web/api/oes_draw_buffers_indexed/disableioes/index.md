---
title: "OES_draw_buffers_indexed: disableiOES() method"
short-title: disableiOES()
slug: Web/API/OES_draw_buffers_indexed/disableiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.disableiOES
---

{{APIRef("WebGL")}}

Phương thức `disableiOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} vô hiệu hóa pha trộn cho một bộ đệm vẽ cụ thể.

## Cú pháp

```js-nolint
disableiOES(target, index)
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

### Vô hiệu hóa pha trộn cho bộ đệm vẽ

Hai lời gọi sau vô hiệu hóa pha trộn cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`.

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.disableiOES(gl.BLEND, 0);
ext.disableiOES(gl.BLEND, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("OES_draw_buffers_indexed.enableiOES()")}}
- [WebGL draw buffer constants](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers)
