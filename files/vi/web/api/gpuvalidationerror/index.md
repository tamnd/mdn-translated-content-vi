---
title: GPUValidationError
slug: Web/API/GPUValidationError
page-type: web-api-interface
browser-compat: api.GPUValidationError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUValidationError`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mô tả một lỗi ứng dụng cho biết một thao tác không vượt qua được các ràng buộc xác thực của WebGPU API.

Nó đại diện cho một trong các loại lỗi được hiển thị bởi {{domxref("GPUDevice.popErrorScope")}} và sự kiện {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}.

Lỗi xác thực xảy ra khi các đầu vào không hợp lệ được đưa vào một lệnh gọi WebGPU. Những lỗi này nhất quán, có thể dự đoán được, và không nên xảy ra nếu ứng dụng của bạn được xây dựng đúng đắn. Chúng sẽ xảy ra theo cùng một cách trên mọi thiết bị mà mã của bạn chạy, vì vậy một khi bạn đã sửa các lỗi xuất hiện trong quá trình phát triển, bạn thường không cần quan sát chúng trực tiếp. Ngoại lệ là nếu bạn đang sử dụng các tài nguyên do người dùng cung cấp, shader, v.v., trong trường hợp đó việc theo dõi lỗi xác thực khi tải có thể hữu ích.

> [!NOTE]
> Chúng tôi đã cố gắng cung cấp thông tin hữu ích để giúp bạn hiểu tại sao lỗi xác thực xảy ra trong mã WebGPU của bạn trong các phần "Validation" khi thích hợp, liệt kê các tiêu chí cần đáp ứng để tránh lỗi xác thực. Xem ví dụ phần [Validation của `GPUDevice.createBindGroup()`](/en-US/docs/Web/API/GPUDevice/createBindGroup#validation).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GPUValidationError.GPUValidationError", "GPUValidationError()")}}
  - : Tạo một đối tượng `GPUValidationError` mới.

## Thuộc tính phiên bản

Thuộc tính `message` được kế thừa từ lớp cha, {{domxref("GPUError")}}:

- {{domxref("GPUError.message", "message")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp thông báo dễ đọc giải thích lý do tại sao lỗi xảy ra.

## Ví dụ

Ví dụ sau sử dụng phạm vi lỗi để bắt lỗi xác thực được nghi ngờ và ghi nó vào bảng điều khiển.

```js
device.pushErrorScope("validation");

let sampler = device.createSampler({
  maxAnisotropy: 0, // Không hợp lệ, maxAnisotropy phải ít nhất là 1.
});

device.popErrorScope().then((error) => {
  if (error) {
    // error là một đối tượng GPUValidationError
    sampler = null;
    console.error(`An error occurred while creating sampler: ${error.message}`);
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
