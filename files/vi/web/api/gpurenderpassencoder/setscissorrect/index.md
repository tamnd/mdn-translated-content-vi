---
title: "GPURenderPassEncoder: phương thức setScissorRect()"
short-title: setScissorRect()
slug: Web/API/GPURenderPassEncoder/setScissorRect
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setScissorRect
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setScissorRect()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt hình chữ nhật cắt được sử dụng trong giai đoạn rasterization. Sau khi biến đổi sang tọa độ viewport, bất kỳ mảnh nào nằm ngoài hình chữ nhật cắt sẽ bị loại bỏ.

## Cú pháp

```js-nolint
setScissorRect(x, y, width, height)
```

### Tham số

- `x`
  - : Một số biểu diễn giá trị X tối thiểu của hình chữ nhật cắt, tính bằng pixel.
- `y`
  - : Một số biểu diễn giá trị Y tối thiểu của hình chữ nhật cắt, tính bằng pixel.
- `width`
  - : Một số biểu diễn chiều rộng của hình chữ nhật cắt, tính bằng pixel.
- `height`
  - : Một số biểu diễn chiều cao của hình chữ nhật cắt, tính bằng pixel.

> [!NOTE]
> Nếu không có lệnh gọi `setScissorRect()` nào được thực hiện, các giá trị mặc định là `(0, 0, chiều rộng tệp đính kèm, chiều cao tệp đính kèm)` cho mỗi lần thực thi kết xuất.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setViewport()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- `x` + `width` nhỏ hơn hoặc bằng chiều rộng của các tệp đính kèm kết xuất của lần thực thi kết xuất (xem ghi chú bên dưới).
- `y` + `height` nhỏ hơn hoặc bằng chiều cao của các tệp đính kèm kết xuất của lần thực thi kết xuất (xem ghi chú bên dưới).

> [!NOTE]
> Xem các tệp đính kèm màu sắc và độ sâu/stencil được chỉ định trong descriptor của {{domxref("GPUCommandEncoder.beginRenderPass()")}}; chiều rộng và chiều cao dựa trên {{domxref("GPUTexture")}} mà các `view` của chúng xuất phát.

## Ví dụ

### Đoạn mã cơ bản

Trong một lần kết xuất canvas thông thường, có thể sử dụng đoạn mã sau để loại bỏ bất kỳ nội dung kết xuất nào nằm ngoài góc trên bên trái của canvas:

```js
passEncoder.setScissorRect(0, 0, canvas.width / 2, canvas.height / 2);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
