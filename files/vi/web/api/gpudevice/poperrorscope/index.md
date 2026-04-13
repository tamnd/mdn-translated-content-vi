---
title: "GPUDevice: phương thức popErrorScope()"
short-title: popErrorScope()
slug: Web/API/GPUDevice/popErrorScope
page-type: web-api-instance-method
browser-compat: api.GPUDevice.popErrorScope
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`popErrorScope()`** của giao diện {{domxref("GPUDevice")}} lấy một GPU error scope hiện có ra khỏi ngăn xếp error scope và trả về một {{jsxref("Promise")}} được giải quyết thành một đối tượng ({{domxref("GPUInternalError")}}, {{domxref("GPUOutOfMemoryError")}}, hoặc {{domxref("GPUValidationError")}}) mô tả lỗi đầu tiên được bắt trong phạm vi đó, hoặc `null` nếu không có lỗi.

## Cú pháp

```js-nolint
popErrorScope()
```

### Giá trị trả về

Một {{jsxref("Promise")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
