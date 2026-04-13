---
title: "GPUComputePassEncoder: popDebugGroup() method"
short-title: popDebugGroup()
slug: Web/API/GPUComputePassEncoder/popDebugGroup
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.popDebugGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`popDebugGroup()`** của giao diện {{domxref("GPUComputePassEncoder")}} kết thúc một compute pass debug group, được bắt đầu bởi lời gọi {{domxref("GPUComputePassEncoder.pushDebugGroup", "pushDebugGroup()")}}.

Phương thức này có thể được dùng cho telemetry, hoặc trong tương lai có thể được sử dụng trong thông báo {{domxref("GPUError")}}, dev tools của trình duyệt hoặc các dịch vụ khác để hỗ trợ gỡ lỗi.

## Cú pháp

```js-nolint
popDebugGroup()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`popDebugGroup()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPUComputePassEncoder")}} sẽ trở nên không hợp lệ:

- Debug stack của compute pass encoder không rỗng (tức là có ít nhất một compute pass debug group đã được bắt đầu trước đó bằng {{domxref("GPUComputePassEncoder.pushDebugGroup", "pushDebugGroup()")}}).

## Ví dụ

```js
// …

const passEncoder = commandEncoder.beginComputePass();

passEncoder.pushDebugGroup("my_group_marker"); // Start labeled debug group

passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);
passEncoder.dispatchWorkgroups(Math.ceil(BUFFER_SIZE / 64));

passEncoder.popDebugGroup();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
