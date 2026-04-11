---
title: GPURenderBundleEncoder
slug: Web/API/GPURenderBundleEncoder
page-type: web-api-interface
browser-compat: api.GPURenderBundleEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPURenderBundleEncoder`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} được dùng để ghi lại trước các gói lệnh.

Các gói lệnh được mã hóa bằng cách gọi các phương thức của `GPURenderBundleEncoder`; sau khi các lệnh mong muốn đã được mã hóa, chúng được ghi lại vào một đối tượng {{domxref("GPURenderBundle")}} sử dụng phương thức {{domxref("GPURenderBundleEncoder.finish()")}}. Các gói kết xuất này sau đó có thể được tái sử dụng trên nhiều lần thực thi kết xuất bằng cách truyền các đối tượng `GPURenderBundle` vào các lệnh gọi {{domxref("GPURenderPassEncoder.executeBundles()")}}.

Về hiệu quả, điều này giống như một lần thực thi kết xuất một phần — `GPURenderBundleEncoder` có tất cả các chức năng giống như {{domxref("GPURenderPassEncoder")}}, ngoại trừ việc chúng không thể bắt đầu và kết thúc các truy vấn occlusion, và không thể đặt hình chữ nhật cắt, viewport, hằng số pha trộn và tham chiếu stencil. `GPURenderBundle` sẽ kế thừa tất cả các giá trị này từ {{domxref("GPURenderPassEncoder")}} thực thi nó.

> [!NOTE]
> Các bộ đệm đỉnh, bộ đệm chỉ mục, nhóm bind và pipeline hiện đang được đặt đều bị xóa trước khi thực thi một gói kết xuất, và sau khi gói kết xuất đã hoàn thành việc thực thi.

Việc tái sử dụng các lệnh đã được ghi lại trước có thể cải thiện đáng kể hiệu suất ứng dụng trong các tình huống mà chi phí gọi vẽ JavaScript là điểm nghẽn. Các gói kết xuất hiệu quả nhất trong các tình huống mà một nhóm đối tượng sẽ được vẽ theo cùng một cách trên nhiều khung nhìn hoặc khung hình, với sự khác biệt duy nhất là nội dung bộ đệm đang được sử dụng (chẳng hạn như các đồng phục ma trận đã cập nhật). Một ví dụ điển hình là kết xuất VR. Ghi lại việc kết xuất dưới dạng gói kết xuất rồi điều chỉnh ma trận khung nhìn và phát lại cho mỗi mắt là một cách hiệu quả hơn để thực hiện các lệnh gọi vẽ cho cả hai lần kết xuất cảnh.

Một đối tượng `GPURenderBundleEncoder` được tạo thông qua thuộc tính {{domxref("GPUDevice.createRenderBundleEncoder()")}}.

> [!NOTE]
> Các phương thức của `GPURenderBundleEncoder` về mặt chức năng giống hệt với các phương thức tương đương có sẵn trên {{domxref("GPURenderPassEncoder")}}, ngoại trừ {{domxref("GPURenderBundleEncoder.finish()")}}, có mục đích tương tự như {{domxref("GPUCommandEncoder.finish()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPURenderBundleEncoder.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPURenderBundleEncoder.draw", "draw()")}}
  - : Vẽ các nguyên thủy dựa trên các bộ đệm đỉnh được cung cấp bởi {{domxref("GPURenderBundleEncoder.setVertexBuffer", "setVertexBuffer()")}}.
- {{domxref("GPURenderBundleEncoder.drawIndexed", "drawIndexed()")}}
  - : Vẽ các nguyên thủy có chỉ mục dựa trên các bộ đệm đỉnh và chỉ mục được cung cấp bởi {{domxref("GPURenderBundleEncoder.setVertexBuffer", "setVertexBuffer()")}} và {{domxref("GPURenderBundleEncoder.setIndexBuffer", "setIndexBuffer()")}}.
- {{domxref("GPURenderBundleEncoder.drawIndirect", "drawIndirect()")}}
  - : Vẽ các nguyên thủy sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.
- {{domxref("GPURenderBundleEncoder.drawIndexedIndirect", "drawIndexedIndirect()")}}
  - : Vẽ các nguyên thủy có chỉ mục sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.
- {{domxref("GPURenderBundleEncoder.finish", "finish()")}}
  - : Hoàn thành việc ghi lại chuỗi lệnh của lần thực thi kết xuất hiện tại.
- {{domxref("GPURenderBundleEncoder.insertDebugMarker", "insertDebugMarker()")}}
  - : Đánh dấu một điểm cụ thể trong một loạt các lệnh đã được mã hóa bằng một nhãn.
- {{domxref("GPURenderBundleEncoder.popDebugGroup", "popDebugGroup()")}}
  - : Kết thúc một nhóm gỡ lỗi, được bắt đầu bằng lệnh gọi {{domxref("GPURenderBundleEncoder.pushDebugGroup", "pushDebugGroup()")}}.
- {{domxref("GPURenderBundleEncoder.pushDebugGroup", "pushDebugGroup()")}}
  - : Bắt đầu một nhóm gỡ lỗi được đánh dấu bằng nhãn được chỉ định, và sẽ chứa tất cả các lệnh được mã hóa tiếp theo cho đến khi phương thức {{domxref("GPURenderBundleEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.
- {{domxref("GPURenderBundleEncoder.setBindGroup", "setBindGroup()")}}
  - : Đặt {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh gói kết xuất tiếp theo, cho một chỉ mục nhất định.
- {{domxref("GPURenderBundleEncoder.setIndexBuffer", "setIndexBuffer()")}}
  - : Đặt {{domxref("GPUBuffer")}} hiện tại sẽ cung cấp dữ liệu chỉ mục cho các lệnh vẽ tiếp theo.
- {{domxref("GPURenderBundleEncoder.setPipeline", "setPipeline()")}}
  - : Đặt {{domxref("GPURenderPipeline")}} để sử dụng cho gói kết xuất này.
- {{domxref("GPURenderBundleEncoder.setVertexBuffer", "setVertexBuffer()")}}
  - : Đặt hoặc bỏ đặt {{domxref("GPUBuffer")}} hiện tại sẽ cung cấp dữ liệu đỉnh cho các lệnh vẽ tiếp theo.

## Ví dụ

Trong ví dụ WebGPU Samples [Animometer example](https://webgpu.github.io/webgpu-samples/samples/animometer/), nhiều thao tác giống nhau được thực hiện trên nhiều đối tượng khác nhau đồng thời. Một gói lệnh được mã hóa sử dụng hàm sau:

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

Sau đó, một `GPURenderBundleEncoder` được tạo, hàm được gọi, và gói lệnh được ghi lại vào {{domxref("GPURenderBundle")}} sử dụng {{domxref("GPURenderBundleEncoder.finish()")}}:

```js
const renderBundleEncoder = device.createRenderBundleEncoder({
  colorFormats: [presentationFormat],
});
recordRenderPass(renderBundleEncoder);
const renderBundle = renderBundleEncoder.finish();
```

{{domxref("GPURenderPassEncoder.executeBundles()")}} sau đó được sử dụng để tái sử dụng công việc trên nhiều lần thực thi kết xuất nhằm cải thiện hiệu suất. Nghiên cứu danh sách mã ví dụ để có đầy đủ ngữ cảnh.

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
