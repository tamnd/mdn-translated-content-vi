---
title: GPUCompilationInfo
slug: Web/API/GPUCompilationInfo
page-type: web-api-interface
browser-compat: api.GPUCompilationInfo
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUCompilationInfo`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một mảng các đối tượng {{domxref("GPUCompilationMessage")}} được tạo ra bởi trình biên dịch shader GPU để giúp chẩn đoán các vấn đề với mã shader.

`GPUCompilationInfo` được truy cập thông qua {{domxref("GPUShaderModule.getCompilationInfo()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUCompilationInfo.messages", "messages")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("GPUCompilationMessage")}}, mỗi đối tượng chứa chi tiết của một thông báo biên dịch shader riêng lẻ. Các thông báo có thể mang tính thông tin, cảnh báo hoặc lỗi.

## Ví dụ

Trong ví dụ bên dưới, chúng ta đã cố ý bỏ sót một dấu ngoặc đơn trong khai báo hàm của mã shader:

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

Khi biên dịch module shader, chúng ta sử dụng `getCompilationInfo()` để lấy thông tin về lỗi kết quả:

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
