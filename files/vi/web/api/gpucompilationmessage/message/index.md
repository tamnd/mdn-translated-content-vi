---
title: "GPUCompilationMessage: message property"
short-title: message
slug: Web/API/GPUCompilationMessage/message
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.message
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`message`** của giao diện {{domxref("GPUCompilationMessage")}} là một chuỗi đại diện cho văn bản thông báo có thể đọc được.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.message);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
