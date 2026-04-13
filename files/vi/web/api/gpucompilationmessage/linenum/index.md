---
title: "GPUCompilationMessage: lineNum property"
short-title: lineNum
slug: Web/API/GPUCompilationMessage/lineNum
page-type: web-api-instance-property
browser-compat: api.GPUCompilationMessage.lineNum
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lineNum`** của giao diện {{domxref("GPUCompilationMessage")}} là một số đại diện cho số dòng trong mã shader mà thông báo tương ứng.

## Giá trị

Một số.

Lưu ý:

- Nếu thông báo tương ứng với một chuỗi con, `lineNum` tham chiếu đến số dòng mà chuỗi con bắt đầu.
- Nếu thông báo không tương ứng với một dòng mã cụ thể, `lineNum` sẽ là 0.
- Các giá trị bắt đầu từ 1, tức là giá trị 1 tham chiếu đến dòng mã đầu tiên.
- Các dòng được phân cách bởi ký tự xuống dòng. Trong WGSL, một [danh sách cụ thể các ký tự](https://gpuweb.github.io/gpuweb/wgsl/#line-break) được định nghĩa là ký tự xuống dòng.

## Ví dụ

```js
const shaderModule = device.createShaderModule({
  code: shaders,
});

const shaderInfo = await shaderModule.getCompilationInfo();
const firstMessage = shaderInfo.messages[0];
console.log(firstMessage.lineNum);
```

Xem trang chính [`GPUCompilationInfo`](/en-US/docs/Web/API/GPUCompilationInfo#examples) để biết ví dụ chi tiết hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
