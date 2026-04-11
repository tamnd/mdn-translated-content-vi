---
title: GPURenderPassEncoder
slug: Web/API/GPURenderPassEncoder
page-type: web-api-interface
browser-compat: api.GPURenderPassEncoder
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPURenderPassEncoder`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mã hóa các lệnh liên quan đến điều khiển các giai đoạn đổ bóng đỉnh và đổ bóng mảnh, do {{domxref("GPURenderPipeline")}} phát ra. Nó là một phần của hoạt động mã hóa tổng thể của {{domxref("GPUCommandEncoder")}}.

Một đường ống kết xuất kết xuất đồ họa tới các tệp đính kèm {{domxref("GPUTexture")}}, thường được dùng để hiển thị trong phần tử {{htmlelement("canvas")}}, nhưng nó cũng có thể kết xuất tới các texture được dùng cho các mục đích khác mà không bao giờ hiển thị trên màn hình. Nó có hai giai đoạn chính:

- Giai đoạn đỉnh, trong đó một đổ bóng đỉnh nhận dữ liệu vị trí được đưa vào GPU và sử dụng nó để định vị một loạt các đỉnh trong không gian 3D bằng cách áp dụng các hiệu ứng được chỉ định như xoay, tịnh tiến hoặc phối cảnh. Các đỉnh sau đó được tập hợp thành các nguyên thủy như tam giác (khối xây dựng cơ bản của đồ họa được kết xuất) và được GPU quét khắp để tìm ra những pixel nào mỗi nguyên thủy cần phủ lên vùng vẽ.

- Giai đoạn mảnh, trong đó một đổ bóng mảnh tính toán màu sắc cho mỗi pixel được bao phủ bởi các nguyên thủy do đổ bóng đỉnh tạo ra. Các tính toán này thường sử dụng các đầu vào như hình ảnh (dưới dạng texture) cung cấp chi tiết bề mặt và vị trí cũng như màu sắc của các nguồn sáng ảo.

Một đối tượng `GPURenderPassEncoder` được tạo thông qua thuộc tính {{domxref("GPUCommandEncoder.beginRenderPass()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPURenderPassEncoder.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPURenderPassEncoder.beginOcclusionQuery", "beginOcclusionQuery()")}}
  - : Bắt đầu một truy vấn occlusion tại chỉ mục được chỉ định của {{domxref("GPUQuerySet")}} liên quan (được cung cấp làm giá trị của thuộc tính descriptor `occlusionQuerySet` khi gọi {{domxref("GPUCommandEncoder.beginRenderPass()")}} để chạy lần thực thi kết xuất).
- {{domxref("GPURenderPassEncoder.draw", "draw()")}}
  - : Vẽ các nguyên thủy dựa trên các bộ đệm đỉnh được cung cấp bởi {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}}.
- {{domxref("GPURenderPassEncoder.drawIndexed", "drawIndexed()")}}
  - : Vẽ các nguyên thủy có chỉ mục dựa trên các bộ đệm đỉnh và chỉ mục được cung cấp bởi {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}} và {{domxref("GPURenderPassEncoder.setIndexBuffer", "setIndexBuffer()")}}.
- {{domxref("GPURenderPassEncoder.drawIndirect", "drawIndirect()")}}
  - : Vẽ các nguyên thủy sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.
- {{domxref("GPURenderPassEncoder.drawIndexedIndirect", "drawIndexedIndirect()")}}
  - : Vẽ các nguyên thủy có chỉ mục sử dụng các tham số được đọc từ {{domxref("GPUBuffer")}}.
- {{domxref("GPURenderPassEncoder.end", "end()")}}
  - : Hoàn thành việc ghi lại chuỗi lệnh của lần thực thi kết xuất hiện tại.
- {{domxref("GPURenderPassEncoder.endOcclusionQuery", "endOcclusionQuery()")}}
  - : Kết thúc một truy vấn occlusion đang hoạt động đã được bắt đầu trước đó bằng {{domxref("GPURenderPassEncoder.beginOcclusionQuery", "beginOcclusionQuery()")}}.
- {{domxref("GPURenderPassEncoder.executeBundles", "executeBundles()")}}
  - : Thực thi các lệnh đã được ghi lại trước đó vào {{domxref("GPURenderBundle")}} được tham chiếu, như một phần của lần thực thi kết xuất này.
- {{domxref("GPURenderPassEncoder.insertDebugMarker", "insertDebugMarker()")}}
  - : Đánh dấu một điểm cụ thể trong một loạt các lệnh đã được mã hóa bằng một nhãn.
- {{domxref("GPURenderPassEncoder.popDebugGroup", "popDebugGroup()")}}
  - : Kết thúc một nhóm gỡ lỗi, được bắt đầu bằng lệnh gọi {{domxref("GPURenderPassEncoder.pushDebugGroup", "pushDebugGroup()")}}.
- {{domxref("GPURenderPassEncoder.pushDebugGroup", "pushDebugGroup()")}}
  - : Bắt đầu một nhóm gỡ lỗi được đánh dấu bằng nhãn được chỉ định và sẽ chứa tất cả các lệnh được mã hóa tiếp theo cho đến khi phương thức {{domxref("GPURenderPassEncoder.popDebugGroup", "popDebugGroup()")}} được gọi.
- {{domxref("GPURenderPassEncoder.setBindGroup", "setBindGroup()")}}
  - : Đặt {{domxref("GPUBindGroup")}} để sử dụng cho các lệnh kết xuất tiếp theo, cho một chỉ mục nhất định.
- {{domxref("GPURenderPassEncoder.setBlendConstant", "setBlendConstant()")}}
  - : Đặt giá trị màu sắc và alpha pha trộn hằng số được dùng với các hệ số pha trộn `"constant"` và `"one-minus-constant"` (như được đặt trong descriptor của phương thức {{domxref("GPUDevice.createRenderPipeline()")}}, trong thuộc tính `blend`).
- {{domxref("GPURenderPassEncoder.setIndexBuffer", "setIndexBuffer()")}}
  - : Đặt {{domxref("GPUBuffer")}} hiện tại sẽ cung cấp dữ liệu chỉ mục cho các lệnh vẽ tiếp theo.
- {{domxref("GPURenderPassEncoder.setPipeline", "setPipeline()")}}
  - : Đặt {{domxref("GPURenderPipeline")}} để sử dụng cho lần thực thi kết xuất này.
- {{domxref("GPURenderPassEncoder.setScissorRect", "setScissorRect()")}}
  - : Đặt hình chữ nhật cắt được sử dụng trong giai đoạn rasterization. Sau khi biến đổi sang tọa độ viewport, bất kỳ mảnh nào nằm ngoài hình chữ nhật cắt sẽ bị loại bỏ.
- {{domxref("GPURenderPassEncoder.setStencilReference", "setStencilReference()")}}
  - : Đặt giá trị tham chiếu stencil được sử dụng trong các bài kiểm tra stencil với thao tác stencil `"replace"` (như được đặt trong descriptor của phương thức {{domxref("GPUDevice.createRenderPipeline()")}}, trong các thuộc tính định nghĩa các thao tác stencil khác nhau).
- {{domxref("GPURenderPassEncoder.setVertexBuffer", "setVertexBuffer()")}}
  - : Đặt hoặc bỏ đặt {{domxref("GPUBuffer")}} hiện tại sẽ cung cấp dữ liệu đỉnh cho các lệnh vẽ tiếp theo.
- {{domxref("GPURenderPassEncoder.setViewport", "setViewport()")}}
  - : Đặt viewport được sử dụng trong giai đoạn rasterization để ánh xạ tuyến tính từ tọa độ thiết bị chuẩn hóa sang tọa độ viewport.

## Ví dụ

Trong [demo kết xuất cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng tôi, một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}. Hầu hết các lệnh này xuất phát từ `GPURenderPassEncoder` được tạo thông qua {{domxref("GPUCommandEncoder.beginRenderPass()")}}.

```js
// …

const renderPipeline = device.createRenderPipeline(pipelineDescriptor);

// Create GPUCommandEncoder to issue commands to the GPU
// Note: render pass descriptor, command encoder, etc. are destroyed after use, fresh one needed for each frame.
const commandEncoder = device.createCommandEncoder();

// Create GPURenderPassDescriptor to tell WebGPU which texture to draw into, then initiate render pass
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

// Draw the triangle
passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.draw(3);

// End the render pass
passEncoder.end();

// End frame by passing array of command buffers to command queue for execution
device.queue.submit([commandEncoder.finish()]);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
