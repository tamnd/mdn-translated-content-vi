---
title: "GPURenderBundleEncoder: phương thức pushDebugGroup()"
short-title: pushDebugGroup()
slug: Web/API/GPURenderBundleEncoder/pushDebugGroup
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.pushDebugGroup
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`pushDebugGroup()`** của giao diện {{domxref("GPURenderBundleEncoder")}} bắt đầu một nhóm gỡ lỗi gói kết xuất, được đánh dấu bằng nhãn được chỉ định, và sẽ chứa tất cả các lệnh được mã hóa tiếp theo cho đến khi phương thức {{domxref("GPURenderBundleEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.

Phương thức này có thể được dùng cho mục đích thu thập dữ liệu telemetry, hoặc có thể được sử dụng trong các thông báo {{domxref("GPUError")}}, công cụ phát triển trình duyệt, hoặc các dịch vụ khác trong tương lai để hỗ trợ gỡ lỗi.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.pushDebugGroup", "pushDebugGroup()")}}.

## Cú pháp

```js-nolint
pushDebugGroup(groupLabel)
```

### Tham số

- `groupLabel`
  - : Một chuỗi biểu diễn nhãn cho nhóm gỡ lỗi.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

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
