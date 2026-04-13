---
title: "GPUCompilationMessage: type property"
short-title: type
slug: Web/API/GPUCompilationMessage/type
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.type
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("GPUCompilationMessage")}} là một giá trị liệt kê đại diện cho loại thông báo. Mỗi loại đại diện cho một mức độ nghiêm trọng khác nhau.

## Giá trị

Một giá trị liệt kê. Các giá trị có thể:

- `"error"`
  - : Lỗi tạo shader, ngăn quá trình biên dịch thành công.
- `"info"`
  - : Thông báo thuần túy mang tính thông tin, có mức độ nghiêm trọng thấp.
- `"warning"`
  - : Cảnh báo về sự cố sẽ không ngăn biên dịch thành công, nhưng đáng để nhà phát triển chú ý. Ví dụ như việc sử dụng các hàm hoặc cú pháp đã lỗi thời.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.type);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
