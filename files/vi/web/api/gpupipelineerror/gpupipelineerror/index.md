---
title: "GPUPipelineError: GPUPipelineError() constructor"
short-title: GPUPipelineError()
slug: Web/API/GPUPipelineError/GPUPipelineError
page-type: web-api-constructor
browser-compat: api.GPUPipelineError.GPUPipelineError
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`GPUPipelineError()`** tạo phiên bản đối tượng {{domxref("GPUPipelineError")}} mới.

## Cú pháp

```js-nolint
new GPUPipelineError(message, options)
```

### Tham số

- `message` {{optional_inline}}
  - : Một chuỗi cung cấp thông báo có thể đọc được bởi con người giải thích lý do lỗi xảy ra. Nếu không được chỉ định, `message` mặc định là chuỗi rỗng (`""`).
- `options`
  - : Đối tượng có thể chứa các thuộc tính sau:
    - `reason`
      - : Giá trị được liệt kê xác định lý do tạo pipeline thất bại theo cách máy có thể đọc được. Giá trị có thể là một trong:
        - `"internal"`: Tạo pipeline thất bại vì lỗi nội bộ (xem {{domxref("GPUInternalError")}} để biết thêm thông tin về các loại lỗi này).
        - `"validation"`: Tạo pipeline thất bại vì lỗi xác thực (xem {{domxref("GPUValidationError")}} để biết thêm thông tin về các loại lỗi này).

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này để tạo đối tượng `GPUPipelineError`. Tác nhân người dùng sử dụng hàm khởi tạo này để tạo đối tượng phù hợp khi {{jsxref("Promise")}} được trả về bởi lệnh gọi {{domxref("GPUDevice.createComputePipelineAsync()")}} hoặc {{domxref("GPUDevice.createRenderPipelineAsync()")}} bị từ chối, báo hiệu lỗi pipeline.

Xem trang [`GPUPipelineError` chính](/en-US/docs/Web/API/GPUPipelineError#examples) để biết ví dụ liên quan đến phiên bản đối tượng `GPUPipelineError`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [Thực tiễn xử lý lỗi WebGPU tốt nhất](https://toji.dev/webgpu-best-practices/error-handling)
