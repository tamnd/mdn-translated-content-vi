---
title: "GPUComputePassEncoder: pushDebugGroup() method"
short-title: pushDebugGroup()
slug: Web/API/GPUComputePassEncoder/pushDebugGroup
page-type: web-api-instance-method
browser-compat: api.GPUComputePassEncoder.pushDebugGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`pushDebugGroup()`** của giao diện {{domxref("GPUComputePassEncoder")}} bắt đầu một compute pass debug group, được đánh dấu bằng nhãn chỉ định, và sẽ chứa tất cả các lệnh mã hóa tiếp theo cho đến khi phương thức {{domxref("GPUComputePassEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.

Phương thức này có thể được dùng cho telemetry, hoặc trong tương lai có thể được sử dụng trong thông báo {{domxref("GPUError")}}, dev tools của trình duyệt hoặc các dịch vụ khác để hỗ trợ gỡ lỗi.

## Cú pháp

```js-nolint
pushDebugGroup(groupLabel)
```

### Tham số

- `groupLabel`
  - : Một chuỗi đại diện cho nhãn của debug group.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

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
