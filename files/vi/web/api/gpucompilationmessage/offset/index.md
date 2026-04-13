---
title: "GPUCompilationMessage: offset property"
short-title: offset
slug: Web/API/GPUCompilationMessage/offset
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.offset
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`offset`** của giao diện {{domxref("GPUCompilationMessage")}} là một số đại diện cho độ lệch từ đầu mã shader đến điểm chính xác, hoặc bắt đầu của chuỗi con liên quan, mà thông báo tương ứng.

## Giá trị

Một số.

Cụ thể hơn, `offset` là số {{glossary("UTF-16", "đơn vị mã UTF-16")}} từ đầu mã shader đến điểm chính xác hoặc bắt đầu của chuỗi con liên quan mà thông báo tương ứng.

Nếu thông báo không tương ứng với một vị trí mã cụ thể, `offset` sẽ là 0.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.offset);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
