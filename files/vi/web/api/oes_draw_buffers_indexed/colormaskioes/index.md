---
title: "OES_draw_buffers_indexed: colorMaskiOES() method"
short-title: colorMaskiOES()
slug: Web/API/OES_draw_buffers_indexed/colorMaskiOES
page-type: web-api-instance-method
browser-compat: api.OES_draw_buffers_indexed.colorMaskiOES
---

{{APIRef("WebGL")}}

Phương thức `colorMaskiOES()` của phần mở rộng WebGL {{DOMxRef("OES_draw_buffers_indexed")}} đặt các thành phần màu nào được bật hoặc tắt khi vẽ hoặc kết xuất cho một bộ đệm vẽ cụ thể. Đây là phiên bản có chỉ mục của phương thức {{domxref("WebGLRenderingContext.colorMask()")}} trong WebGL 1.

## Cú pháp

```js-nolint
colorMaskiOES(buf, r, g, b, a)
```

### Tham số

- `buf`
  - : Một số nguyên `i` chỉ định bộ đệm vẽ liên kết với hằng số `gl.DRAW_BUFFERi`, xem [hằng số bộ đệm vẽ WebGL](/en-US/docs/Web/API/WebGL_API/Constants#draw_buffers).
- `r`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu đỏ có nên được ghi vào bộ đệm vẽ hay không.
- `g`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu xanh lá có nên được ghi vào bộ đệm vẽ hay không.
- `b`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần màu xanh dương có nên được ghi vào bộ đệm vẽ hay không.
- `a`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định liệu thành phần alpha (độ trong suốt) có nên được ghi vào bộ đệm vẽ hay không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `buf`, `r`, `b`, `g` hoặc `a` không phải là các giá trị hợp lệ, lỗi `gl.INVALID_VALUE` được ném ra.

## Ví dụ

### Đặt và lấy mặt nạ màu

Bạn có thể đặt mặt nạ màu cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1` như sau:

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");

ext.colorMaskiOES(0, 1, 0, 0, 0);
ext.colorMaskiOES(1, 0, 1, 0, 0);
```

Để lấy mặt nạ màu cho bộ đệm vẽ `gl.DRAW_BUFFER0` và `gl.DRAW_BUFFER1`, truy vấn hằng số `COLOR_WRITEMASK` bằng {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}:

```js
gl.getIndexedParameter(gl.COLOR_WRITEMASK, 0);
gl.getIndexedParameter(gl.COLOR_WRITEMASK, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}
- {{domxref("WebGLRenderingContext.colorMask()")}}
