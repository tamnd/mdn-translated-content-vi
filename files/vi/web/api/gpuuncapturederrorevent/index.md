---
title: GPUUncapturedErrorEvent
slug: Web/API/GPUUncapturedErrorEvent
page-type: web-api-interface
browser-compat: api.GPUUncapturedErrorEvent
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUUncapturedErrorEvent`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} là loại đối tượng sự kiện cho sự kiện {{domxref("GPUDevice")}} {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}, được sử dụng để đo lường và báo cáo các lỗi không mong đợi.

Các trường hợp lỗi đã biết nên được xử lý bằng {{domxref("GPUDevice.pushErrorScope", "pushErrorScope()")}} và {{domxref("GPUDevice.popErrorScope", "popErrorScope()")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GPUUncapturedErrorEvent.GPUUncapturedErrorEvent", "GPUUncapturedErrorEvent()")}}
  - : Tạo một phiên bản đối tượng `GPUUncapturedErrorEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ thực thể cha, {{domxref("Event")}}._

- {{domxref("GPUUncapturedErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Một phiên bản đối tượng {{domxref("GPUError")}} cung cấp quyền truy cập vào thông tin chi tiết của lỗi.

## Ví dụ

Bạn có thể sử dụng thứ như sau như một cơ chế toàn cục để phát hiện các lỗi không được xử lý bởi error scopes và ghi lại chúng.

```js
// …

device.addEventListener("uncapturederror", (event) => {
  // Re-surface the error
  console.error("A WebGPU error was not captured:", event.error.message);
  reportErrorToServer({
    type: event.error.constructor.name,
    message: event.error.message,
  });
});

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
- [WebGPU Error Handling best practices](https://toji.dev/webgpu-best-practices/error-handling)
