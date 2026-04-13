---
title: GPUQueue
slug: Web/API/GPUQueue
page-type: web-api-interface
browser-compat: api.GPUQueue
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUQueue`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} kiểm soát việc thực thi các lệnh đã mã hóa trên GPU.

Hàng đợi chính của thiết bị được truy cập thông qua thuộc tính {{domxref("GPUDevice.queue")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUQueue.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể dùng để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPUQueue.copyExternalImageToTexture", "copyExternalImageToTexture()")}}
  - : Sao chép một ảnh chụp từ ảnh nguồn, video, hoặc canvas vào một {{domxref("GPUTexture")}} được chỉ định.
- {{domxref("GPUQueue.onSubmittedWorkDone", "onSubmittedWorkDone()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải khi tất cả công việc được gửi lên GPU thông qua `GPUQueue` này tại thời điểm phương thức được gọi đã được xử lý xong.
- {{domxref("GPUQueue.submit", "submit()")}}
  - : Lên lịch thực thi các command buffer được đại diện bởi một hoặc nhiều đối tượng {{domxref("GPUCommandBuffer")}} trên GPU.
- {{domxref("GPUQueue.writeBuffer", "writeBuffer()")}}
  - : Ghi một nguồn dữ liệu được cung cấp vào một {{domxref("GPUBuffer")}} được chỉ định.
- {{domxref("GPUQueue.writeTexture", "writeTexture()")}}
  - : Ghi một nguồn dữ liệu được cung cấp vào một {{domxref("GPUTexture")}} được chỉ định.

## Ví dụ

Trong [basic render demo](https://mdn.github.io/dom-examples/webgpu-render-demo/), chúng ta định nghĩa dữ liệu đỉnh trong một {{jsxref("Float32Array")}} để dùng vẽ một tam giác:

```js
const vertices = new Float32Array([
  0.0, 0.6, 0, 1, 1, 0, 0, 1, -0.5, -0.6, 0, 1, 0, 1, 0, 1, 0.5, -0.6, 0, 1, 0,
  0, 1, 1,
]);
```

Để sử dụng dữ liệu này trong render pipeline, ta cần đưa nó vào {{domxref("GPUBuffer")}}. Đầu tiên tạo buffer:

```js
const vertexBuffer = device.createBuffer({
  size: vertices.byteLength, // make it big enough to store vertices in
  usage: GPUBufferUsage.VERTEX | GPUBufferUsage.COPY_DST,
});
```

Để đưa dữ liệu vào buffer, ta có thể dùng hàm {{domxref("GPUQueue.writeBuffer", "writeBuffer()")}}, cho phép tác nhân người dùng xác định cách sao chép dữ liệu hiệu quả nhất:

```js
device.queue.writeBuffer(vertexBuffer, 0, vertices, 0, vertices.length);
```

Sau đó, một tập hợp lệnh được mã hóa vào {{domxref("GPUCommandBuffer")}} bằng phương thức {{domxref("GPUCommandEncoder.finish()")}}. Command buffer được truyền vào hàng đợi thông qua lệnh gọi {{domxref("GPUQueue.submit", "submit()")}}, sẵn sàng để GPU xử lý.

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
