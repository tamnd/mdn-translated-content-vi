---
title: GPUAdapterInfo
slug: Web/API/GPUAdapterInfo
page-type: web-api-interface
browser-compat: api.GPUAdapterInfo
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUAdapterInfo`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} chứa thông tin nhận dạng về một {{domxref("GPUAdapter")}}.

`GPUAdapterInfo` của một adapter có thể được truy xuất thông qua thuộc tính {{domxref("GPUAdapter.info")}} của chính adapter đó, hoặc thuộc tính {{domxref("GPUDevice.adapterInfo")}} của một thiết bị bắt nguồn từ adapter.

Đối tượng này cho phép các nhà phát triển truy cập thông tin cụ thể về GPU của người dùng để họ có thể chủ động áp dụng các biện pháp khắc phục lỗi dành riêng cho GPU, hoặc cung cấp các đường dẫn code khác nhau phù hợp hơn với các kiến trúc GPU khác nhau. Việc cung cấp thông tin như vậy tạo ra rủi ro bảo mật vì có thể được dùng để lấy dấu vân tay (fingerprinting), vì vậy thông tin được chia sẻ được giữ ở mức tối thiểu, và các nhà cung cấp trình duyệt khác nhau có thể chia sẻ các loại thông tin và mức độ chi tiết khác nhau.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUAdapterInfo.architecture", "architecture")}} {{ReadOnlyInline}}
  - : Tên của họ hoặc lớp GPU mà adapter thuộc về. Trả về chuỗi rỗng nếu không có sẵn.
- {{domxref("GPUAdapterInfo.description", "description")}} {{ReadOnlyInline}}
  - : Một chuỗi mô tả adapter có thể đọc được bởi con người. Trả về chuỗi rỗng nếu không có sẵn.
- {{domxref("GPUAdapterInfo.device", "device")}} {{ReadOnlyInline}}
  - : Mã định danh dành riêng cho nhà cung cấp của adapter. Trả về chuỗi rỗng nếu không có sẵn.
- {{domxref("GPUAdapterInfo.isFallbackAdapter", "isFallbackAdapter")}} {{ReadOnlyInline}}
  - : Một giá trị boolean. Trả về `true` nếu adapter là [fallback adapter](/en-US/docs/Web/API/GPU/requestAdapter#fallback_adapters), và `false` nếu không phải.
- {{domxref("GPUAdapterInfo.subgroupMaxSize", "subgroupMaxSize")}} {{ReadOnlyInline}}
  - : Kích thước [subgroup](https://gpuweb.github.io/gpuweb/wgsl/#subgroup-size) tối đa được hỗ trợ cho {{domxref("GPUAdapter")}}.
- {{domxref("GPUAdapterInfo.subgroupMinSize", "subgroupMinSize")}} {{ReadOnlyInline}}
  - : Kích thước [subgroup](https://gpuweb.github.io/gpuweb/wgsl/#subgroup-size) tối thiểu được hỗ trợ cho {{domxref("GPUAdapter")}}.
- {{domxref("GPUAdapterInfo.vendor", "vendor")}} {{ReadOnlyInline}}
  - : Tên của nhà cung cấp adapter. Trả về chuỗi rỗng nếu không có sẵn.

## Ví dụ

### Truy cập GPUAdapterInfo qua GPUAdapter.info

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const adapterInfo = adapter.info;
console.log(adapterInfo.vendor);
console.log(adapterInfo.architecture);
```

### Truy cập GPUAdapterInfo qua GPUDevice.adapterInfo

```js
const adapter = await navigator.gpu.requestAdapter();
if (!adapter) {
  throw Error("Couldn't request WebGPU adapter.");
}

const myDevice = await adapter.requestDevice();

function optimizeForGpuDevice(device) {
  if (device.adapterInfo.vendor === "amd") {
    // Use AMD-specific optimizations
  } else if (device.adapterInfo.architecture.includes("turing")) {
    // Optimize for NVIDIA Turing architecture
  }
}

optimizeForGpuDevice(myDevice);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("GPUAdapter.info")}}
- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
