---
title: "GPUQueue: writeBuffer() method"
short-title: writeBuffer()
slug: Web/API/GPUQueue/writeBuffer
page-type: web-api-instance-method
browser-compat: api.GPUQueue.writeBuffer
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`writeBuffer()`** của giao diện {{domxref("GPUQueue")}} ghi một nguồn dữ liệu được cung cấp vào một {{domxref("GPUBuffer")}} được chỉ định.

Đây là hàm tiện ích, cung cấp một giải pháp thay thế cho việc thiết lập dữ liệu buffer thông qua ánh xạ buffer và sao chép buffer sang buffer. Nó cho phép tác nhân người dùng xác định cách sao chép dữ liệu hiệu quả nhất.

## Cú pháp

```js-nolint
writeBuffer(buffer, bufferOffset, data, dataOffset, size)
```

### Tham số

- `buffer`
  - : Một đối tượng {{domxref("GPUBuffer")}} đại diện cho buffer cần ghi dữ liệu vào.
- `bufferOffset`
  - : Một số đại diện cho độ lệch tính bằng byte để bắt đầu ghi dữ liệu vào bên trong {{domxref("GPUBuffer")}}.
- `data`
  - : Một đối tượng đại diện cho nguồn dữ liệu cần ghi vào {{domxref("GPUBuffer")}}. Có thể là {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.
- `dataOffset` {{optional_inline}}
  - : Một số đại diện cho độ lệch để bắt đầu ghi dữ liệu từ bên trong nguồn dữ liệu. Giá trị này là số phần tử nếu `data` là {{jsxref("TypedArray")}}, và là số byte trong các trường hợp khác. Nếu bỏ qua, `dataOffset` mặc định là 0.
- `size` {{optional_inline}}
  - : Một số đại diện cho kích thước nội dung cần ghi từ `data` vào `buffer`. Giá trị này là số phần tử nếu `data` là {{jsxref("TypedArray")}}, và là số byte trong các trường hợp khác. Nếu bỏ qua, `size` sẽ bằng kích thước tổng thể của `data`, trừ đi `dataOffset`.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Ngoại lệ

- `OperationError` {{domxref("DOMException")}}
  - : Phương thức ném ra `OperationError` nếu các tiêu chí sau không được đáp ứng:
    - Kích thước của `data` bằng hoặc lớn hơn 0.
    - `dataOffset` bằng hoặc nhỏ hơn kích thước của `data`.
    - Kích thước của `data` (khi chuyển đổi sang byte, trong trường hợp `TypedArray`) là bội số của 4.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`writeBuffer()`**, nếu không sẽ tạo ra {{domxref("GPUValidationError")}} và {{domxref("GPUQueue")}} trở nên không hợp lệ:

- `buffer` sẵn sàng để sử dụng, tức là không bị không khả dụng hoặc bị hủy.
- `usage` của `buffer` bao gồm cờ `GPUBufferUsage.COPY_DST`.
- `bufferOffset`, khi chuyển đổi sang byte, là bội số của 4.
- Kích thước của `data` - `dataOffset` + `bufferOffset`, khi chuyển đổi sang byte, bằng hoặc nhỏ hơn {{domxref("GPUBuffer.size")}} của `buffer`.

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

Để đưa dữ liệu vào buffer ta có thể dùng `writeBuffer()`:

```js
device.queue.writeBuffer(vertexBuffer, 0, vertices, 0, vertices.length);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
