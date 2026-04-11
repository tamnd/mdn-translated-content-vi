---
title: "GPURenderBundleEncoder: phương thức setPipeline()"
short-title: setPipeline()
slug: Web/API/GPURenderBundleEncoder/setPipeline
page-type: web-api-instance-method
browser-compat: api.GPURenderBundleEncoder.setPipeline
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setPipeline()`** của giao diện {{domxref("GPURenderBundleEncoder")}} đặt {{domxref("GPURenderPipeline")}} để sử dụng cho các lệnh gói kết xuất tiếp theo.

> [!NOTE]
> Phương thức này về mặt chức năng giống hệt với phương thức tương đương trên {{domxref("GPURenderPassEncoder")}} — {{domxref("GPURenderPassEncoder.setPipeline", "setPipeline()")}}.

## Cú pháp

```js-nolint
setPipeline(pipeline)
```

### Tham số

- `pipeline`
  - : {{domxref("GPURenderPipeline")}} để sử dụng cho các lệnh gói kết xuất tiếp theo.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`setPipeline()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderBundleEncoder")}} sẽ không hợp lệ:

- Nếu {{domxref("GPURenderPipeline")}} ghi vào thành phần độ sâu của tệp đính kèm độ sâu/stencil, `depthReadOnly` (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`.
- Nếu {{domxref("GPURenderPipeline")}} ghi vào thành phần stencil của tệp đính kèm độ sâu/stencil, `stencilReadOnly` (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`.

## Ví dụ

```js
function recordRenderPass(passEncoder) {
  if (settings.dynamicOffsets) {
    passEncoder.setPipeline(dynamicPipeline);
  } else {
    passEncoder.setPipeline(pipeline);
  }
  passEncoder.setVertexBuffer(0, vertexBuffer);
  passEncoder.setBindGroup(0, timeBindGroup);
  const dynamicOffsets = [0];
  for (let i = 0; i < numTriangles; ++i) {
    if (settings.dynamicOffsets) {
      dynamicOffsets[0] = i * alignedUniformBytes;
      passEncoder.setBindGroup(1, dynamicBindGroup, dynamicOffsets);
    } else {
      passEncoder.setBindGroup(1, bindGroups[i]);
    }
    passEncoder.draw(3, 1, 0, 0);
  }
}
```

Đoạn mã trên được lấy từ ví dụ WebGPU Samples [Animometer example](https://webgpu.github.io/webgpu-samples/samples/animometer/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
