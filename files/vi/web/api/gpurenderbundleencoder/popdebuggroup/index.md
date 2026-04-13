---
title: "GPURenderBundleEncoder: phương thức popDebugGroup()"
short-title: popDebugGroup()
slug: Web/API/GPURenderBundleEncoder/popDebugGroup
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.popDebugGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`popDebugGroup()`** của giao diện {{domxref("GPURenderBundleEncoder")}} kết thúc một nhóm gỡ lỗi gói kết xuất, nhóm này được bắt đầu bằng lệnh gọi {{domxref("GPURenderBundleEncoder.pushDebugGroup", "pushDebugGroup()")}}.

Phương thức này có thể được dùng cho mục đích thu thập dữ liệu telemetry, hoặc có thể được sử dụng trong các thông báo {{domxref("GPUError")}}, công cụ phát triển trình duyệt, hoặc các dịch vụ khác trong tương lai để hỗ trợ gỡ lỗi.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.popDebugGroup", "popDebugGroup()")}}.

## Cú pháp

```js-nolint
popDebugGroup()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`popDebugGroup()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderBundleEncoder")}} sẽ không hợp lệ:

- Ngăn xếp gỡ lỗi của bộ mã hóa gói kết xuất không trống (tức là ít nhất một nhóm gỡ lỗi gói kết xuất đã được bắt đầu trước đó bằng {{domxref("GPURenderBundleEncoder.pushDebugGroup", "pushDebugGroup()")}}).

## Ví dụ

```js
// …

const bundleEncoder = device.createRenderBundleEncoder(renderBundleDescriptor);

bundleEncoder.pushDebugGroup("my_group_marker"); // Start labeled debug group

bundleEncoder.setPipeline(renderPipeline);
bundleEncoder.setVertexBuffer(0, vertexBuffer);
bundleEncoder.draw(3);

bundleEncoder.popDebugGroup();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
