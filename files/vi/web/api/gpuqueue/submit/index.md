---
title: "GPUQueue: submit() method"
short-title: submit()
slug: Web/API/GPUQueue/submit
page-type: web-api-instance-method
browser-compat: api.GPUQueue.submit
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`submit()`** của giao diện {{domxref("GPUQueue")}} lên lịch thực thi các command buffer được đại diện bởi một hoặc nhiều đối tượng {{domxref("GPUCommandBuffer")}} trên GPU.

## Cú pháp

```js-nolint
submit(commandBuffers)
```

### Tham số

- `commandBuffers`
  - : Một mảng các đối tượng {{domxref("GPUCommandBuffer")}} chứa các lệnh cần xếp vào hàng đợi để GPU xử lý. Mảng không được chứa các đối tượng `GPUCommandBuffer` trùng lặp, mỗi đối tượng chỉ có thể được gửi một lần trong mỗi lần gọi `submit()`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`submit()`**, nếu không sẽ tạo ra {{domxref("GPUValidationError")}} và {{domxref("GPUQueue")}} trở nên không hợp lệ:

- Mảng các đối tượng {{domxref("GPUCommandBuffer")}} được tham chiếu trong lệnh gọi `submit()` không chứa trùng lặp.
- Mọi đối tượng {{domxref("GPUBuffer")}}, {{domxref("GPUTexture")}}, và {{domxref("GPUQuerySet")}} được dùng trong các lệnh đã mã hóa phải sẵn sàng để sử dụng, tức là không bị không khả dụng (các `GPUBuffer` không khả dụng nếu đang được {{domxref("GPUBuffer.mapAsync", "mapped", "", "nocode")}}) hoặc bị hủy (bằng phương thức `destroy()`).
- Mọi đối tượng {{domxref("GPUExternalTexture")}} được dùng trong các lệnh đã mã hóa không bị hết hạn (chúng hết hạn tự động ngay sau khi được nhập qua {{domxref("GPUDevice.importExternalTexture", "importExternalTexture()")}}).
- Nếu đối tượng {{domxref("GPUQuerySet")}} được dùng trong lệnh đã mã hóa thuộc loại truy vấn `"occlusion"`, nó chưa được sử dụng, ngoại trừ bởi {{domxref("GPURenderPassEncoder.beginOcclusionQuery()")}}.

## Ví dụ

Trong [basic render demo](https://mdn.github.io/dom-examples/webgpu-render-demo/), một số lệnh được ghi lại thông qua {{domxref("GPUCommandEncoder")}}:

```js
// …

// Create GPUCommandEncoder
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

// Draw a triangle

passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.draw(3);

// End the render pass

passEncoder.end();

// …
```

Các lệnh được mã hóa bởi {{domxref("GPUCommandEncoder")}} được ghi vào {{domxref("GPUCommandBuffer")}} bằng phương thức {{domxref("GPUCommandEncoder.finish()")}}. Command buffer sau đó được truyền vào hàng đợi thông qua lệnh gọi `submit()`, sẵn sàng để GPU xử lý.

```js
device.queue.submit([commandEncoder.finish()]);
```

> [!NOTE]
> Hãy nghiên cứu [WebGPU samples](https://webgpu.github.io/webgpu-samples/) để tìm thêm các ví dụ về hàng đợi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
