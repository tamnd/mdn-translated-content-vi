---
title: GPURenderBundle
slug: Web/API/GPURenderBundle
page-type: web-api-interface
browser-compat: api.GPURenderBundle
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPURenderBundle`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một vùng chứa các gói lệnh được ghi trước.

Các gói lệnh được mã hóa bằng {{domxref("GPURenderBundleEncoder")}}; sau khi các lệnh mong muốn được mã hóa, chúng được ghi vào đối tượng `GPURenderBundle` bằng phương thức {{domxref("GPURenderBundleEncoder.finish()")}}.

Các gói lệnh này có thể được tái sử dụng trên nhiều lần render pass bằng cách truyền đối tượng `GPURenderBundle` vào lệnh gọi {{domxref("GPURenderPassEncoder.executeBundles()")}}. Tái sử dụng các lệnh được ghi trước có thể cải thiện đáng kể hiệu suất ứng dụng trong các tình huống mà chi phí gọi JavaScript để vẽ là nút thắt cổ chai. Gói render hiệu quả nhất trong các tình huống khi một loạt đối tượng sẽ được vẽ theo cùng một cách trên nhiều khung nhìn hoặc khung, với sự khác biệt duy nhất là nội dung bộ đệm đang được sử dụng (chẳng hạn như các uniform ma trận đã cập nhật).

Một ví dụ điển hình là kết xuất VR. Việc ghi kết xuất dưới dạng gói render rồi điều chỉnh ma trận khung nhìn và phát lại cho mỗi mắt là cách hiệu quả hơn để phát lệnh vẽ cho cả hai lần kết xuất của cảnh.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPURenderBundle.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo bảng điều khiển.

## Ví dụ

Trong ví dụ [Animometer](https://webgpu.github.io/webgpu-samples/samples/animometer/) của WebGPU Samples, nhiều thao tác tương tự được thực hiện trên nhiều đối tượng khác nhau đồng thời. Gói render được mã hóa bằng hàm sau:

```js
function recordRenderPass(
  passEncoder: GPURenderBundleEncoder | GPURenderPassEncoder
) {
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

Sau đó, một {{domxref("GPURenderBundleEncoder")}} được tạo, hàm được gọi, và gói render được ghi bằng {{domxref("GPURenderBundleEncoder.finish()")}}:

```js
const renderBundleEncoder = device.createRenderBundleEncoder({
  colorFormats: [presentationFormat],
});
recordRenderPass(renderBundleEncoder);
const renderBundle = renderBundleEncoder.finish();
```

{{domxref("GPURenderPassEncoder.executeBundles()")}} sau đó được sử dụng để tái sử dụng công việc trên nhiều render pass để cải thiện hiệu suất. Nghiên cứu danh sách mã ví dụ để biết toàn bộ ngữ cảnh.

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
