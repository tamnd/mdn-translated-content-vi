---
title: "GPUCommandEncoder: clearBuffer() method"
short-title: clearBuffer()
slug: Web/API/GPUCommandEncoder/clearBuffer
page-type: web-api-instance-method
browser-compat: api.GPUCommandEncoder.clearBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`clearBuffer()`** của giao diện {{domxref("GPUCommandEncoder")}} mã hóa một lệnh điền một vùng của {{domxref("GPUBuffer")}} bằng số 0.

## Cú pháp

```js-nolint
clearBuffer(buffer)
clearBuffer(buffer, offset)
clearBuffer(buffer, offset, size)
```

### Tham số

- `buffer`
  - : Một đối tượng {{domxref("GPUBuffer")}} đại diện cho buffer cần xóa.
- `offset` {{optional_inline}}
  - : Một số biểu diễn độ lệch, tính bằng byte, từ đầu `buffer` đến vùng con cần xóa. Nếu bỏ qua, `offset` mặc định là 0.
- `size` {{optional_inline}}
  - : Một số biểu diễn kích thước, tính bằng byte, của vùng con cần xóa. Nếu bỏ qua, `size` mặc định là kích thước `buffer` trừ `offset`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`clearBuffer()`**, nếu không một {{domxref("GPUValidationError")}} sẽ được tạo và {{domxref("GPUCommandEncoder")}} trở nên không hợp lệ:

- `usage` của `buffer` bao gồm cờ {{domxref("GPUBufferUsage.COPY_DST")}}.
- `offset` và `size` đều là bội số của 4.
- {{domxref("GPUBuffer.size")}} của `buffer` lớn hơn hoặc bằng `offset` + `size`.

## Ví dụ

```js
// …

const buffer = device.createBuffer({
  size: 1000,
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});

// Sau đó

const commandBuffer = device.createCommandEncoder();
commandEncoder.clearBuffer(buffer);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
