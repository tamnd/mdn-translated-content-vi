---
title: "GPUBuffer: unmap() method"
short-title: unmap()
slug: Web/API/GPUBuffer/unmap
page-type: web-api-instance-method
browser-compat: api.GPUBuffer.unmap
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`unmap()`** của giao diện {{domxref("GPUBuffer")}} hủy ánh xạ phạm vi được ánh xạ của `GPUBuffer`, làm cho nội dung của nó có sẵn cho GPU sử dụng lại sau khi trước đây đã được ánh xạ bằng {{domxref("GPUBuffer.mapAsync()")}} (GPU không thể truy cập `GPUBuffer` đang được ánh xạ).

Khi `unmap()` được gọi, bất kỳ {{jsxref("ArrayBuffer")}} nào được tạo qua {{domxref("GPUBuffer.getMappedRange()")}} đều bị tách ra.

## Cú pháp

```js-nolint
unmap()
```

### Tham số

Không có.

### Giá trị trả về

None ({{jsxref("Undefined")}}).

## Ví dụ

Xem [trang `GPUBuffer` chính](/en-US/docs/Web/API/GPUBuffer#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
