---
title: "GPURenderPassEncoder: phương thức executeBundles()"
short-title: executeBundles()
slug: Web/API/GPURenderPassEncoder/executeBundles
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.executeBundles
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`executeBundles()`** của giao diện {{domxref("GPURenderPassEncoder")}} thực thi các lệnh đã được ghi lại trước đó vào {{domxref("GPURenderBundle")}} được tham chiếu, như một phần của lần thực thi kết xuất này.

> [!NOTE]
> Sau khi gọi `executeBundles()`, các bộ đệm đỉnh, bộ đệm chỉ mục, nhóm bind và pipeline hiện đang được đặt đều bị xóa, ngay cả khi không có gói nào thực sự được thực thi.

## Cú pháp

```js-nolint
executeBundles(bundles)
```

### Tham số

- `bundles`
  - : Một mảng các đối tượng {{domxref("GPURenderBundle")}} chứa các lệnh đã được ghi lại trước để thực thi.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`executeBundles()`**, nếu không {{domxref("GPUValidationError")}} sẽ được tạo ra và {{domxref("GPURenderPassEncoder")}} sẽ không hợp lệ.

Đối với mỗi {{domxref("GPURenderBundle")}}:

- Nếu thuộc tính `depthReadOnly` của lần thực thi kết xuất (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`, thì thuộc tính `depthReadOnly` của gói (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUDevice.createRenderBundleEncoder()")}} đã tạo ra {{domxref("GPURenderBundleEncoder")}} nguồn gốc) cũng phải là `true`.
- Nếu thuộc tính `stencilReadOnly` của lần thực thi kết xuất (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} nguồn gốc) là `true`, thì thuộc tính `stencilReadOnly` của gói (như được chỉ định trong descriptor của lệnh gọi {{domxref("GPUDevice.createRenderBundleEncoder()")}} đã tạo ra {{domxref("GPURenderBundleEncoder")}} nguồn gốc) cũng phải là `true`.
- Bố cục của đường ống kết xuất được chỉ định trong {{domxref("GPURenderPassEncoder.setPipeline()")}} (như được định nghĩa trong descriptor của lệnh gọi {{domxref("GPUDevice.createRenderPipeline()")}} nguồn gốc) phải bằng với bố cục của đường ống kết xuất gói được chỉ định trong {{domxref("GPURenderBundleEncoder.setPipeline()")}}.

## Ví dụ

Trong ví dụ WebGPU Samples [Animometer example](https://webgpu.github.io/webgpu-samples/samples/animometer/), nhiều thao tác giống nhau được thực hiện trên nhiều đối tượng khác nhau đồng thời. `executeBundles()` được sử dụng để tái sử dụng công việc trên nhiều lần thực thi kết xuất nhằm cải thiện hiệu suất. Nghiên cứu danh sách mã ví dụ để có đầy đủ ngữ cảnh.

```js
// …

return function doDraw(timestamp) {
  if (startTime === undefined) {
    startTime = timestamp;
  }
  uniformTime[0] = (timestamp - startTime) / 1000;
  device.queue.writeBuffer(uniformBuffer, timeOffset, uniformTime.buffer);

  renderPassDescriptor.colorAttachments[0].view = context
    .getCurrentTexture()
    .createView();

  const commandEncoder = device.createCommandEncoder();
  const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

  if (settings.renderBundles) {
    passEncoder.executeBundles([renderBundle]);
  } else {
    recordRenderPass(passEncoder);
  }

  passEncoder.end();
  device.queue.submit([commandEncoder.finish()]);
};

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
