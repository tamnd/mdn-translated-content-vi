---
title: GPUBuffer
slug: Web/API/GPUBuffer
page-type: web-api-interface
browser-compat: api.GPUBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUBuffer`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một khối bộ nhớ có thể được sử dụng để lưu trữ dữ liệu thô để sử dụng trong các thao tác GPU.

Phiên bản đối tượng `GPUBuffer` được tạo bằng phương thức {{domxref("GPUDevice.createBuffer()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUBuffer.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được sử dụng để xác định đối tượng, ví dụ trong các thông báo {{domxref("GPUError")}} hoặc cảnh báo console.
- {{domxref("GPUBuffer.mapState", "mapState")}} {{ReadOnlyInline}}
  - : Giá trị được liệt kê đại diện cho trạng thái được ánh xạ của `GPUBuffer`.
- {{domxref("GPUBuffer.size", "size")}} {{ReadOnlyInline}}
  - : Số đại diện cho độ dài của phân bổ bộ nhớ của `GPUBuffer`, tính bằng byte.
- {{domxref("GPUBuffer.usage", "usage")}} {{ReadOnlyInline}}
  - : {{glossary("bitwise flags")}} đại diện cho các cách sử dụng cho phép của `GPUBuffer`.

## Phương thức phiên bản

- {{domxref("GPUBuffer.destroy", "destroy()")}}
  - : Hủy `GPUBuffer`.
- {{domxref("GPUBuffer.getMappedRange", "getMappedRange()")}}
  - : Trả về {{jsxref("ArrayBuffer")}} chứa nội dung được ánh xạ của `GPUBuffer` trong phạm vi được chỉ định.
- {{domxref("GPUBuffer.mapAsync", "mapAsync()")}}
  - : Ánh xạ phạm vi được chỉ định của `GPUBuffer`. Trả về {{jsxref("Promise")}} được giải quyết khi nội dung của `GPUBuffer` sẵn sàng để truy cập bằng {{domxref("GPUBuffer.getMappedRange()")}}.
- {{domxref("GPUBuffer.unmap", "unmap()")}}
  - : Hủy ánh xạ phạm vi được ánh xạ của `GPUBuffer`, làm cho nội dung của nó có sẵn cho GPU sử dụng lại.

## Ví dụ

Trong [demo tính toán cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/), chúng ta tạo buffer đầu ra để đọc kết quả tính toán GPU và buffer dàn dựng để được ánh xạ cho quyền truy cập JavaScript.

```js
const output = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC,
});

const stagingBuffer = device.createBuffer({
  size: BUFFER_SIZE,
  usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST,
});
```

Sau đó, khi `stagingBuffer` chứa kết quả tính toán GPU, một tổ hợp các phương thức `GPUBuffer` được sử dụng để đọc dữ liệu trở lại JavaScript để có thể ghi vào console:

- {{domxref("GPUBuffer.mapAsync()")}} được sử dụng để ánh xạ `GPUBuffer` để đọc.
- {{domxref("GPUBuffer.getMappedRange()")}} được sử dụng để trả về {{jsxref("ArrayBuffer")}} chứa nội dung của `GPUBuffer`.
- {{domxref("GPUBuffer.unmap()")}} được sử dụng để hủy ánh xạ `GPUBuffer`, sau khi chúng ta đã đọc nội dung vào JavaScript theo yêu cầu.

```js
// map staging buffer to read results back to JS
await stagingBuffer.mapAsync(
  GPUMapMode.READ,
  0, // Offset
  BUFFER_SIZE, // Length
);

const copyArrayBuffer = stagingBuffer.getMappedRange(0, BUFFER_SIZE);
const data = copyArrayBuffer.slice(0);
stagingBuffer.unmap();
console.log(new Float32Array(data));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
