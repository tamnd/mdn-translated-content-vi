---
title: "GPUCompilationMessage: linePos property"
short-title: linePos
slug: Web/API/GPUCompilationMessage/linePos
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.linePos
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`linePos`** của giao diện {{domxref("GPUCompilationMessage")}} là một số đại diện cho vị trí trong dòng mã mà thông báo tương ứng. Có thể là một điểm chính xác, hoặc bắt đầu của chuỗi con liên quan.

## Giá trị

Một số.

Cụ thể hơn, `linePos` là số {{glossary("UTF-16", "đơn vị mã UTF-16")}} từ đầu dòng đến điểm chính xác hoặc bắt đầu của chuỗi con liên quan mà thông báo tương ứng.

Lưu ý:

- Nếu thông báo tương ứng với một chuỗi con, `linePos` tham chiếu đến đơn vị mã UTF-16 đầu tiên của chuỗi con.
- Nếu thông báo không tương ứng với một vị trí mã cụ thể, `linePos` sẽ là 0.
- Các giá trị bắt đầu từ 1, tức là giá trị 1 tham chiếu đến đơn vị mã đầu tiên của dòng.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.linePos);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
