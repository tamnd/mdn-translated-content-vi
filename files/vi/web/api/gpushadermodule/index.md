---
title: GPUShaderModule
slug: Web/API/GPUShaderModule
page-type: web-api-interface
browser-compat: api.GPUShaderModule
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUShaderModule`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một đối tượng shader module nội bộ, là container chứa code shader [WGSL](https://gpuweb.github.io/gpuweb/wgsl/) có thể được gửi đến GPU để thực thi bởi một pipeline.

Một phiên bản đối tượng `GPUShaderModule` được tạo bằng {{domxref("GPUDevice.createShaderModule()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUShaderModule.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể được dùng để nhận dạng đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.

## Phương thức phiên bản

- {{domxref("GPUShaderModule.getCompilationInfo", "getCompilationInfo()")}}
  - : Trả về một {{jsxref("Promise")}} thực hiện với một đối tượng {{domxref("GPUCompilationInfo")}} chứa các thông báo được tạo ra trong quá trình biên dịch `GPUShaderModule`.

## Ví dụ

Trong [basic render demo](https://mdn.github.io/dom-examples/webgpu-render-demo/) của chúng ta, shader module được tạo bằng code sau:

```js
const shaders = `
struct VertexOut {
  @builtin(position) position : vec4f,
  @location(0) color : vec4f
}

@vertex
fn vertex_main(@location(0) position: vec4f,
               @location(1) color: vec4f) -> VertexOut
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

async function init() {
  if (!navigator.gpu) {
    throw Error("WebGPU not supported.");
  }

  const adapter = await navigator.gpu.requestAdapter();

  if (!adapter) {
    throw Error("Couldn't request WebGPU adapter.");
  }

  const device = await adapter.requestDevice();

  // …
  // later on

  const shaderModule = device.createShaderModule({
    code: shaders,
  });

  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
