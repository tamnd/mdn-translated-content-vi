---
title: "WebGLRenderingContext: activeTexture() method"
short-title: activeTexture()
slug: Web/API/WebGLRenderingContext/activeTexture
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.activeTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.activeTexture()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định đơn vị kết cấu nào sẽ được kích hoạt.

## Cú pháp

```js-nolint
activeTexture(texture)
```

### Thông số

- `texture`
  - : Đơn vị kết cấu để kích hoạt. Giá trị là `gl.TEXTUREI`
trong đó _I_ nằm trong khoảng từ 0 tới `gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS - 1`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Nếu _texture_ không phải là một trong `gl.TEXTUREI`, trong đó _I_ nằm trong phạm vi từ 0 đến `gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS - 1`, lỗi `gl.INVALID_ENUM` sẽ được đưa ra.

## Ví dụ

Lệnh gọi sau đây chọn `gl.TEXTURE1` làm kết cấu hiện tại. Các lệnh gọi tiếp theo sửa đổi trạng thái kết cấu sẽ ảnh hưởng đến kết cấu này.

```js
gl.activeTexture(gl.TEXTURE1);
```

Số lượng đơn vị kết cấu phụ thuộc vào việc triển khai, bạn có thể lấy con số này với sự trợ giúp của hằng số `MAX_COMBINED_TEXTURE_IMAGE_UNITS`. Theo đặc điểm kỹ thuật, ít nhất là 8.

```js
gl.getParameter(gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS);
```

Để có được kết cấu hoạt động, hãy truy vấn hằng số `ACTIVE_TEXTURE`.

```js
gl.activeTexture(gl.TEXTURE0);
gl.getParameter(gl.ACTIVE_TEXTURE);
// returns "33984" (0x84C0, gl.TEXTURE0 enum value)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getParameter()")}}
