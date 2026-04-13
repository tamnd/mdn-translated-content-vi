---
title: GPUOutOfMemoryError
slug: Web/API/GPUOutOfMemoryError
page-type: web-api-interface
browser-compat: api.GPUOutOfMemoryError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUOutOfMemoryError`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mô tả lỗi hết bộ nhớ (oom) cho biết không đủ bộ nhớ trống để hoàn thành thao tác được yêu cầu.

Nó đại diện cho một trong các loại lỗi được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} và sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

Lỗi hết bộ nhớ nên tương đối hiếm trong một ứng dụng hoạt động tốt nhưng khó dự đoán hơn so với {{domxref("GPUValidationError")}}. Điều này là do chúng phụ thuộc vào thiết bị mà ứng dụng đang chạy cũng như các ứng dụng khác đang sử dụng tài nguyên GPU tại thời điểm đó.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GPUOutOfMemoryError.GPUOutOfMemoryError", "GPUOutOfMemoryError()")}}
  - : Tạo một đối tượng `GPUOutOfMemoryError` mới.

## Thuộc tính phiên bản

Thuộc tính `message` được kế thừa từ lớp cha, {{domxref("GPUError")}}:

- {{domxref("GPUError.message", "message")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Ví dụ

Ví dụ sau sử dụng phạm vi lỗi để bắt lỗi hết bộ nhớ và ghi nó vào bảng điều khiển.

```js
device.pushErrorScope("out-of-memory");

let buffer = device.createBuffer({
  size: 100_000_000_000, // 100GB; quá lớn
  usage: GPUBufferUsage.COPY_SRC | GPUBufferUsage.MAP_WRITE,
});

device.popErrorScope().then((error) => {
  if (error) {
    // error là một đối tượng GPUOutOfMemoryError
    buffer = null;
    console.error(`Out of memory, buffer too large. Error: ${error.message}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Các phương pháp hay nhất về xử lý lỗi WebGPU](https://toji.dev/webgpu-best-practices/error-handling)
