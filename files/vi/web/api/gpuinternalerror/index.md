---
title: GPUInternalError
slug: Web/API/GPUInternalError
page-type: web-api-interface
browser-compat: api.GPUInternalError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUInternalError`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mô tả một lỗi ứng dụng cho biết một thao tác không thành công vì lý do hệ thống hoặc cụ thể của triển khai, ngay cả khi tất cả các yêu cầu xác thực đều được đáp ứng.

Nó đại diện cho một trong các loại lỗi được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} và sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

Lỗi nội bộ xảy ra khi điều gì đó xảy ra trong quá trình triển khai WebGPU không bị xác thực bắt và không thể rõ ràng xác định là lỗi hết bộ nhớ. Điều này thường có nghĩa là một thao tác mà mã của bạn thực hiện đã chạm đến giới hạn hệ thống theo cách khó thể hiện với [giới hạn hỗ trợ](/en-US/docs/Web/API/GPUSupportedLimits) của WebGPU. Thao tác tương tự có thể thành công trên một thiết bị khác. Những lỗi này chỉ có thể được tạo ra bởi quá trình tạo pipeline, thường là khi shader quá phức tạp cho thiết bị.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GPUInternalError.GPUInternalError", "GPUInternalError()")}}
  - : Tạo một đối tượng `GPUInternalError` mới.

## Thuộc tính phiên bản

Thuộc tính `message` được kế thừa từ lớp cha, {{domxref("GPUError")}}:

- {{domxref("GPUError.message", "message")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Ví dụ

Ví dụ sau sử dụng phạm vi lỗi để bắt lỗi xác thực được nghi ngờ và ghi nó vào bảng điều khiển.

```js
device.pushErrorScope("internal");

let module = device.createShaderModule({
  code: shader, // Shader RẤT phức tạp
});

device.popErrorScope().then((error) => {
  if (error) {
    // error là một đối tượng GPUInternalError
    module = null;
    console.error(`An error occurred while creating shader: ${error.message}`);
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
