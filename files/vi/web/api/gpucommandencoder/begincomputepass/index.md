---
title: "GPUCommandEncoder: beginComputePass() method"
short-title: beginComputePass()
slug: Web/API/GPUCommandEncoder/beginComputePass
page-type: web-api-instance-method
browser-compat: api.GPUCommandEncoder.beginComputePass
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`beginComputePass()`** của giao diện {{domxref("GPUCommandEncoder")}} bắt đầu mã hóa một compute pass, trả về một {{domxref("GPUComputePassEncoder")}} có thể dùng để điều khiển tính toán.

## Cú pháp

```js-nolint
beginComputePass()
beginComputePass(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `label` {{optional_inline}}
      - : Một chuỗi dùng làm nhãn để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo trên console.
    - `timestampWrites` {{optional_inline}}
      - : Một mảng các đối tượng xác định nơi và thời điểm các giá trị truy vấn dấu thời gian sẽ được ghi cho pass này. Các đối tượng này có các thuộc tính sau:
        - `querySet`
          - : Một {{domxref("GPUQuerySet")}} kiểu `"timestamp"` mà kết quả truy vấn dấu thời gian sẽ được ghi vào.
        - `beginningOfPassWriteIndex`
          - : Một số chỉ định chỉ mục truy vấn trong `querySet` nơi dấu thời gian ở đầu render pass sẽ được ghi. Thuộc tính này là tùy chọn - nếu không được định nghĩa, sẽ không có dấu thời gian nào được ghi cho đầu pass.
        - `endOfPassWriteIndex`
          - : Một số chỉ định chỉ mục truy vấn trong `querySet` nơi dấu thời gian ở cuối render pass sẽ được ghi. Thuộc tính này là tùy chọn - nếu không được định nghĩa, sẽ không có dấu thời gian nào được ghi cho cuối pass.

        > [!NOTE]
        > Tính năng `timestamp-query` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) cần được bật để dùng truy vấn dấu thời gian. Giá trị truy vấn dấu thời gian được ghi bằng nanosecond, nhưng cách xác định giá trị là do phần triển khai quyết định.

### Giá trị trả về

Một thể hiện đối tượng {{domxref("GPUComputePassEncoder")}}.

### Kiểm tra hợp lệ

Các tiêu chí sau phải được đáp ứng khi gọi **`beginComputePass()`**, nếu không một {{domxref("GPUValidationError")}} sẽ được tạo và trả về một {{domxref("GPUComputePassEncoder")}} không hợp lệ:

- Tính năng `timestamp-query` {{domxref("GPUSupportedFeatures", "feature", "", "nocode")}} đã được bật trong {{domxref("GPUDevice")}}.

## Ví dụ

Trong [bản demo compute cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/) của chúng tôi, nhiều lệnh được ghi qua một {{domxref("GPUCommandEncoder")}}. Phần lớn các lệnh này đến từ {{domxref("GPUComputePassEncoder")}} được tạo bằng `beginComputePass()`.

```js
// …

// Tạo GPUCommandEncoder để mã hóa các lệnh gửi tới GPU
const commandEncoder = device.createCommandEncoder();

// Bắt đầu compute pass
const passEncoder = commandEncoder.beginComputePass();

// Thực thi lệnh
passEncoder.setPipeline(computePipeline);
passEncoder.setBindGroup(0, bindGroup);
passEncoder.dispatchWorkgroups(Math.ceil(BUFFER_SIZE / 64));

// Kết thúc render pass
passEncoder.end();

// Sao chép output buffer sang staging buffer
commandEncoder.copyBufferToBuffer(
  output,
  0, // Độ lệch nguồn
  stagingBuffer,
  0, // Độ lệch đích
  BUFFER_SIZE,
);

// Kết thúc frame bằng cách truyền mảng command buffer vào command queue để thực thi
device.queue.submit([commandEncoder.finish()]);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
