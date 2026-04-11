---
title: "GPURenderPassEncoder: phương thức setViewport()"
short-title: setViewport()
slug: Web/API/GPURenderPassEncoder/setViewport
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setViewport
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setViewport()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt viewport được sử dụng trong giai đoạn rasterization để ánh xạ tuyến tính từ tọa độ thiết bị chuẩn hóa sang tọa độ viewport.

## Cú pháp

```js-nolint
setViewport(x, y, width, height, minDepth, maxDepth)
```

### Tham số

- `x`
  - : Một số biểu diễn giá trị X tối thiểu của viewport, tính bằng pixel.
- `y`
  - : Một số biểu diễn giá trị Y tối thiểu của viewport, tính bằng pixel.
- `width`
  - : Một số biểu diễn chiều rộng của viewport, tính bằng pixel.
- `height`
  - : Một số biểu diễn chiều cao của viewport, tính bằng pixel.
- `minDepth`
  - : Một số biểu diễn giá trị độ sâu tối thiểu của viewport.
- `maxDepth`
  - : Một số biểu diễn giá trị độ sâu tối đa của viewport.

> [!NOTE]
> Nếu không có lệnh gọi `setViewport()` nào được thực hiện, các giá trị mặc định là `(0, 0, chiều rộng tệp đính kèm, chiều cao tệp đính kèm, 0, 1)` cho mỗi lần thực thi kết xuất.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setViewport()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ:

- `x`, `y`, `width` và `height` đều lớn hơn hoặc bằng 0.
- `x` + `width` nhỏ hơn hoặc bằng chiều rộng của các tệp đính kèm kết xuất của lần thực thi kết xuất (xem ghi chú bên dưới).
- `y` + `height` nhỏ hơn hoặc bằng chiều cao của các tệp đính kèm kết xuất của lần thực thi kết xuất (xem ghi chú bên dưới).
- `minDepth` và `maxDepth` đều nằm trong khoảng 0.0 đến 1.0 (bao gồm).
- `minDepth` nhỏ hơn `maxDepth`.

> [!NOTE]
> Xem các tệp đính kèm màu sắc và độ sâu/stencil được chỉ định trong descriptor của {{domxref("GPUCommandEncoder.beginRenderPass()")}}; chiều rộng và chiều cao dựa trên {{domxref("GPUTexture")}} mà các `view` của chúng xuất phát.

## Ví dụ

### Đoạn mã cơ bản

Trong một lần kết xuất canvas thông thường, có thể sử dụng đoạn mã sau để giảm một nửa chiều rộng và chiều cao của đồ họa được kết xuất:

```js
passEncoder.setViewport(0, 0, canvas.width / 2, canvas.height / 2, 0, 1);
```

### Trong ngữ cảnh

Trong ví dụ WebGPU Samples [reversedZ example](https://webgpu.github.io/webgpu-samples/samples/reversedZ/), `setViewport` được sử dụng nhiều lần để đặt viewport cho các lần thực thi kết xuất khác nhau. Nghiên cứu danh sách mã ví dụ để có đầy đủ ngữ cảnh.

Ví dụ:

```js
// …

colorPass.setViewport(
  (canvas.width * m) / 2,
  0,
  canvas.width / 2,
  canvas.height,
  0,
  1,
);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
