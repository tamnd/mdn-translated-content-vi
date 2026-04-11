---
title: GPU
slug: Web/API/GPU
page-type: web-api-interface
browser-compat: api.GPU
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPU`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} là điểm khởi đầu để sử dụng WebGPU. Giao diện này có thể dùng để trả về một {{domxref("GPUAdapter")}}, từ đó bạn có thể yêu cầu device, cấu hình các tính năng và giới hạn, cùng nhiều thứ khác.

Đối tượng `GPU` cho ngữ cảnh hiện tại được truy cập qua các thuộc tính {{domxref("Navigator.gpu")}} hoặc {{domxref("WorkerNavigator.gpu")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("GPU.wgslLanguageFeatures", "wgslLanguageFeatures")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("WGSLLanguageFeatures")}} báo cáo [các tiện ích ngôn ngữ WGSL](https://gpuweb.github.io/gpuweb/wgsl/#language-extension) được triển khai WebGPU hỗ trợ.

## Phương thức thể hiện

- {{domxref("GPU.requestAdapter", "requestAdapter()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ được hoàn tất với một thể hiện đối tượng {{domxref("GPUAdapter")}}. Từ đó bạn có thể yêu cầu một {{domxref("GPUDevice")}}, là giao diện chính để sử dụng chức năng WebGPU.
- {{domxref("GPU.getPreferredCanvasFormat", "getPreferredCanvasFormat()")}}
  - : Trả về định dạng texture canvas tối ưu để hiển thị nội dung có độ sâu 8 bit, dải động tiêu chuẩn trên hệ thống hiện tại.

## Ví dụ

### Yêu cầu adapter và device

```js
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
}
```

### Cấu hình GPUCanvasContext với định dạng texture tối ưu

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
