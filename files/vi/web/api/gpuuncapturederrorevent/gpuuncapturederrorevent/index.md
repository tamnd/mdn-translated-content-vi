---
title: "GPUUncapturedErrorEvent: GPUUncapturedErrorEvent() constructor"
short-title: GPUUncapturedErrorEvent()
slug: Web/API/GPUUncapturedErrorEvent/GPUUncapturedErrorEvent
page-type: web-api-constructor
browser-compat: api.GPUUncapturedErrorEvent.GPUUncapturedErrorEvent
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Hàm khởi tạo **`GPUUncapturedErrorEvent()`** tạo một phiên bản đối tượng {{domxref("GPUUncapturedErrorEvent")}} mới.

## Cú pháp

```js-nolint
new GPUUncapturedErrorEvent(type, options)
```

### Tham số

- `type`
  - : Một giá trị liệt kê chỉ định loại lỗi. Các giá trị có thể là:
    - `"internal"`
      - : Lỗi là {{domxref("GPUInternalError")}}.
    - `"out-of-memory"`
      - : Lỗi là {{domxref("GPUOutOfMemoryError")}}.
    - `"validation"`
      - : Lỗi là {{domxref("GPUValidationError")}}.
- `options`
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `error`
      - : Một phiên bản đối tượng {{domxref("GPUError")}} cung cấp quyền truy cập vào thông tin chi tiết của lỗi.

## Ví dụ

Nhà phát triển sẽ không sử dụng hàm khởi tạo này theo cách thủ công để tạo đối tượng `GPUUncapturedErrorEvent`. User agent sử dụng hàm khởi tạo này để tạo đối tượng thích hợp khi sự kiện {{domxref("GPUDevice")}} {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}} kích hoạt để cho phép ghi lại lỗi không mong đợi.

Xem trang [`GPUUncapturedErrorEvent`](/en-US/docs/Web/API/GPUUncapturedErrorEvent#examples) chính để xem ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [WebGPU Error Handling best practices](https://toji.dev/webgpu-best-practices/error-handling)
