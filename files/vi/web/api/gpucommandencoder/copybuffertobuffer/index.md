---
title: "GPUCommandEncoder: copyBufferToBuffer() method"
short-title: copyBufferToBuffer()
slug: Web/API/GPUCommandEncoder/copyBufferToBuffer
page-type: web-api-instance-method
browser-compat: api.GPUCommandEncoder.copyBufferToBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}

Phương thức **`copyBufferToBuffer()`** của giao diện {{domxref("GPUCommandEncoder")}} mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUBuffer")}} sang buffer khác.

## Cú pháp

```js-nolint
copyBufferToBuffer(source, destination)
copyBufferToBuffer(source, destination, size)
copyBufferToBuffer(source, sourceOffset, destination, destinationOffset, size)
```

### Tham số

- `source`
  - : {{domxref("GPUBuffer")}} nguồn để sao chép từ đó.
- `sourceOffset` {{optional_inline}}
  - : Độ lệch, tính bằng byte, trong `source` nơi bắt đầu sao chép.
- `destination`
  - : {{domxref("GPUBuffer")}} đích để sao chép tới.
- `destinationOffset` {{optional_inline}}
  - : Độ lệch, tính bằng byte, trong `destination` nơi bắt đầu sao chép.
- `size` {{optional_inline}}
  - : Số byte cần sao chép.

> [!NOTE]
> `sourceOffset` và `destinationOffset` có thể được bỏ qua nếu bạn đang sao chép một phần của source buffer với độ lệch `0` ở cả source và destination. `sourceOffset`, `destinationOffset`, và `size` có thể được bỏ qua nếu bạn đang sao chép toàn bộ source buffer sang destination buffer.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`copyBufferToBuffer()`**, nếu không một {{domxref("GPUValidationError")}} sẽ được tạo và {{domxref("GPUCommandEncoder")}} trở nên không hợp lệ:

- `usage` của `source` bao gồm cờ {{domxref("GPUBufferUsage.COPY_SRC")}}.
- `usage` của `destination` bao gồm cờ {{domxref("GPUBufferUsage.COPY_DST")}}.
- `size`, `sourceOffset`, và `destinationOffset` đều là bội số của 4.
- {{domxref("GPUBuffer.size")}} của `source` lớn hơn hoặc bằng `sourceOffset` + `size`.
- {{domxref("GPUBuffer.size")}} của `destination` lớn hơn hoặc bằng `destinationOffset` + `size`.
- `source` và `destination` là hai {{domxref("GPUBuffer")}} khác nhau (bạn không thể sao chép từ và sang cùng một buffer).

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/) của chúng tôi, `copyBufferToBuffer()` được dùng để sao chép nội dung của `outputBuffer` sang `stagingBuffer`.

```js
// …

// Tạo một output buffer để đọc các phép tính GPU, và một staging buffer để map cho JavaScript truy cập

const outputBuffer = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

const stagingBuffer = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});

// …

// Tạo GPUCommandEncoder để mã hóa các lệnh gửi tới GPU
const commandEncoder = device.createCommandEncoder();

// …

// Sao chép output buffer sang staging buffer
commandEncoder.copyBufferToBuffer(
  outputBuffer,
  0, // Độ lệch nguồn
  stagingBuffer,
  0, // Độ lệch đích
  BUFFER_SIZE,
);

// Vì đang sao chép toàn bộ buffer, có thể rút gọn thành
// commandEncoder.copyBufferToBuffer(outputBuffer, stagingBuffer);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
