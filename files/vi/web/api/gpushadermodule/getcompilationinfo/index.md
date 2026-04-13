---
title: "GPUShaderModule: getCompilationInfo() method"
short-title: getCompilationInfo()
slug: Web/API/GPUShaderModule/getCompilationInfo
page-type: web-api-instance-method
browser-compat: api.GPUShaderModule.getCompilationInfo
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getCompilationInfo()`** của giao diện {{domxref("GPUShaderModule")}} trả về một {{jsxref("Promise")}} thực hiện với một đối tượng {{domxref("GPUCompilationInfo")}} chứa các thông báo được tạo ra trong quá trình biên dịch `GPUShaderModule`.

## Cú pháp

```js-nolint
getCompilationInfo()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với một đối tượng {{domxref("GPUCompilationInfo")}}.

{{domxref("GPUCompilationInfo")}} chứa thuộc tính `messages`, là một mảng các đối tượng {{domxref("GPUCompilationMessage")}}, mỗi đối tượng chứa thông tin chi tiết của một thông báo biên dịch riêng lẻ.

## Ví dụ

Trong ví dụ dưới đây, chúng ta cố ý bỏ dấu ngoặc trong khai báo hàm trong code shader:

```js
const shaders = `
struct VertexOut {
  @builtin(position) position : vec4f,
  @location(0) color : vec4f
}

@vertex
fn vertex_main(@location(0) position: vec4f,
               @location(1) color: vec4f -> VertexOut
{
  var output : VertexOut;
  output.position = position;
  output.color = color;
  return output;
}

@fragment
fn fragment_main(fragData: VertexOut) -> @location(0) vec4f
{
  return fragData.color;
}
`;
```

Khi biên dịch shader module, chúng ta dùng `getCompilationInfo()` để lấy thông tin về lỗi kết quả:

```js
async function init() {
  // …

  const shaderModule = device.createShaderModule({
    code: shaders,
  });

  const shaderInfo = await shaderModule.getCompilationInfo();
  const firstMessage = shaderInfo.messages[0];

  console.log(firstMessage.lineNum); // 9
  console.log(firstMessage.message); // "expected ')' for function declaration"
  console.log(firstMessage.type); // "error"

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
