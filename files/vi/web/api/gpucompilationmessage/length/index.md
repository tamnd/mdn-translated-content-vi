---
title: "GPUCompilationMessage: length property"
short-title: length
slug: Web/API/GPUCompilationMessage/length
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.length
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("GPUCompilationMessage")}} là một số đại diện cho độ dài của chuỗi con mà thông báo tương ứng.

## Giá trị

Một số.

Cụ thể hơn, `length` là số {{glossary("UTF-16", "đơn vị mã UTF-16")}} trong chuỗi con mã shader mà thông báo tương ứng. Nếu thông báo tương ứng với một điểm đơn thay vì một chuỗi con, `length` sẽ là 0.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.length);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
