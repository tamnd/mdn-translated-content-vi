---
title: GPUAdapter
slug: Web/API/GPUAdapter
page-type: web-api-interface
browser-compat: api.GPUAdapter
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUAdapter`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một bộ điều hợp GPU. Từ đây bạn có thể yêu cầu {{domxref("GPUDevice")}}, thông tin bộ điều hợp, tính năng và giới hạn.

Một đối tượng `GPUAdapter` được yêu cầu bằng phương thức {{domxref("GPU.requestAdapter()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUAdapter.features", "features")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUSupportedFeatures")}} mô tả các chức năng bổ sung được bộ điều hợp hỗ trợ.
- {{domxref("GPUAdapter.info", "info")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUAdapterInfo")}} chứa thông tin nhận diện về bộ điều hợp.
- {{domxref("GPUAdapter.limits", "limits")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUSupportedLimits")}} mô tả các giới hạn được bộ điều hợp hỗ trợ.

### Thuộc tính đã lỗi thời

- {{domxref("GPUAdapter.isFallbackAdapter", "isFallbackAdapter")}} {{ReadOnlyInline}} {{deprecated_inline}} {{non-standard_inline}}
  - : Giá trị boolean. Trả về `true` nếu bộ điều hợp là [fallback adapter](/en-US/docs/Web/API/GPU/requestAdapter#fallback_adapters), và `false` nếu không. Thuộc tính này đã bị xóa khỏi nền tảng web. Hãy dùng {{domxref("GPUAdapterInfo.isFallbackAdapter")}} thay thế.

## Phương thức phiên bản

- {{domxref("GPUAdapter.requestAdapterInfo", "requestAdapterInfo()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("GPUAdapterInfo")}} chứa thông tin nhận diện về bộ điều hợp.
- {{domxref("GPUAdapter.requestDevice", "requestDevice()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("GPUDevice")}}, là giao diện chính để giao tiếp với GPU.

## Ví dụ

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
