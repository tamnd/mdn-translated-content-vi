---
title: GPUCommandEncoder
slug: Web/API/GPUCommandEncoder
page-type: web-api-interface
browser-compat: api.GPUCommandEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUCommandEncoder`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một bộ mã hóa thu thập một chuỗi các lệnh GPU để gửi tới GPU.

Một thể hiện `GPUCommandEncoder` được tạo thông qua {{domxref("GPUDevice.createCommandEncoder()")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("GPUCommandEncoder.label", "label")}}
  - : Một chuỗi dùng làm nhãn để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo trên console.

## Phương thức thể hiện

- {{domxref("GPUCommandEncoder.beginComputePass", "beginComputePass()")}}
  - : Bắt đầu mã hóa một compute pass, trả về một {{domxref("GPUComputePassEncoder")}} có thể dùng để điều khiển tính toán.
- {{domxref("GPUCommandEncoder.beginRenderPass", "beginRenderPass()")}}
  - : Bắt đầu mã hóa một render pass, trả về một {{domxref("GPURenderPassEncoder")}} có thể dùng để điều khiển quá trình kết xuất.
- {{domxref("GPUCommandEncoder.clearBuffer", "clearBuffer()")}}
  - : Mã hóa một lệnh điền một vùng của {{domxref("GPUBuffer")}} bằng các số 0.
- {{domxref("GPUCommandEncoder.copyBufferToBuffer", "copyBufferToBuffer()")}}
  - : Mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUBuffer")}} sang một buffer khác.
- {{domxref("GPUCommandEncoder.copyBufferToTexture", "copyBufferToTexture()")}}
  - : Mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUBuffer")}} sang một {{domxref("GPUTexture")}}.
- {{domxref("GPUCommandEncoder.copyTextureToBuffer", "copyTextureToBuffer()")}}
  - : Mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUTexture")}} sang một {{domxref("GPUBuffer")}}.
- {{domxref("GPUCommandEncoder.copyTextureToTexture", "copyTextureToTexture()")}}
  - : Mã hóa một lệnh sao chép dữ liệu từ một {{domxref("GPUTexture")}} sang một texture khác.
- {{domxref("GPUCommandEncoder.finish", "finish()")}}
  - : Hoàn tất việc ghi chuỗi lệnh đã được mã hóa trên `GPUCommandEncoder` này, trả về một {{domxref("GPUCommandBuffer")}} tương ứng.

- {{domxref("GPUCommandEncoder.insertDebugMarker", "insertDebugMarker()")}}
  - : Đánh dấu một điểm cụ thể trong chuỗi lệnh đã mã hóa bằng một nhãn.
- {{domxref("GPUCommandEncoder.popDebugGroup", "popDebugGroup()")}}
  - : Kết thúc một debug group, được bắt đầu bằng lệnh gọi {{domxref("GPUCommandEncoder.pushDebugGroup", "pushDebugGroup()")}}.
- {{domxref("GPUCommandEncoder.pushDebugGroup", "pushDebugGroup()")}}
  - : Bắt đầu một debug group, được gắn bằng một nhãn chỉ định và sẽ chứa tất cả các lệnh đã mã hóa tiếp theo cho đến khi phương thức {{domxref("GPUCommandEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.

- {{domxref("GPUCommandEncoder.resolveQuerySet", "resolveQuerySet()")}}
  - : Mã hóa một lệnh phân giải một {{domxref("GPUQuerySet")}}, sao chép kết quả vào một {{domxref("GPUBuffer")}} được chỉ định.
- {{domxref("GPUCommandEncoder.writeTimestamp", "writeTimestamp()")}} {{non-standard_inline}} {{deprecated_inline}}
  - : Mã hóa một lệnh ghi dấu thời gian vào một {{domxref("GPUQuerySet")}} sau khi các lệnh trước đó đã được ghi vào cùng {{domxref("GPUCommandBuffer")}} đang xếp hàng được GPU thực thi.

## Ví dụ

Trong [bản demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, nhiều lệnh được ghi qua một `GPUCommandEncoder`:

```js
// …

// Tạo GPUCommandEncoder
const commandEncoder = device.createCommandEncoder();

// Tạo GPURenderPassDescriptor để báo cho WebGPU biết texture nào sẽ được vẽ vào, rồi khởi tạo render pass

const renderPassDescriptor = {
  colorAttachments: [
    {
      clearValue: clearColor,
      loadOp: "clear",
      storeOp: "store",
      view: context.getCurrentTexture().createView(),
    },
  ],
};

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// Vẽ một tam giác

passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.draw(3);

// Kết thúc render pass

passEncoder.end();

// …
```

Các lệnh được mã hóa bởi `GPUCommandEncoder` được ghi vào một {{domxref("GPUCommandBuffer")}} bằng phương thức {{domxref("GPUCommandEncoder.finish()")}}. Sau đó, command buffer được truyền vào hàng đợi qua lệnh gọi {{domxref("GPUQueue.submit", "submit()")}}, sẵn sàng để GPU xử lý.

```js
device.queue.submit([commandEncoder.finish()]);
```

> [!NOTE]
> Hãy xem các [WebGPU samples](https://webgpu.github.io/webgpu-samples/) để tìm thêm ví dụ về mã hóa lệnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
