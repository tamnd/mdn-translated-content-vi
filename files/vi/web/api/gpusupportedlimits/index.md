---
title: GPUSupportedLimits
slug: Web/API/GPUSupportedLimits
page-type: web-api-interface
browser-compat: api.GPUSupportedLimits
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUSupportedLimits`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} mô tả các giới hạn được hỗ trợ bởi {{domxref("GPUAdapter")}}.

Đối tượng `GPUSupportedLimits` cho bộ điều hợp hiện tại được truy cập thông qua thuộc tính {{domxref("GPUAdapter.limits")}}.

Cần lưu ý rằng thay vì báo cáo chính xác giới hạn của mỗi GPU, các trình duyệt có thể báo cáo các giá trị bậc khác nhau của các giới hạn để giảm thông tin duy nhất có sẵn cho việc lấy dấu vân tay. Ví dụ, các bậc của một giới hạn nhất định có thể là 2048, 8192 và 32768. Nếu giới hạn thực tế của GPU của bạn là 16384, trình duyệt vẫn sẽ báo cáo 8192.

Vì các trình duyệt khác nhau sẽ xử lý điều này khác nhau và các giá trị bậc có thể thay đổi theo thời gian, rất khó để cung cấp thông tin chính xác về các giá trị giới hạn cần mong đợi — nên kiểm tra kỹ lưỡng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Các giới hạn sau được biểu diễn bởi các thuộc tính trong đối tượng `GPUSupportedLimits`. Xem phần [Limits](https://gpuweb.github.io/gpuweb/#limits) của thông số kỹ thuật để biết mô tả chi tiết về ý nghĩa của các giới hạn.

| Tên giới hạn                                                                                                                                                                                                                                                   | Giá trị mặc định         |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `maxTextureDimension1D`                                                                                                                                                                                                                                        | 8192                     |
| `maxTextureDimension2D`                                                                                                                                                                                                                                        | 8192                     |
| `maxTextureDimension3D`                                                                                                                                                                                                                                        | 2048                     |
| `maxTextureArrayLayers`                                                                                                                                                                                                                                        | 256                      |
| `maxBindGroups`                                                                                                                                                                                                                                                | 4                        |
| `maxBindingsPerBindGroup`                                                                                                                                                                                                                                      | 640                      |
| `maxDynamicUniformBuffersPerPipelineLayout`                                                                                                                                                                                                                    | 8                        |
| `maxDynamicStorageBuffersPerPipelineLayout`                                                                                                                                                                                                                    | 4                        |
| `maxSampledTexturesPerShaderStage`                                                                                                                                                                                                                             | 16                       |
| `maxSamplersPerShaderStage`                                                                                                                                                                                                                                    | 16                       |
| `maxStorageBuffersPerShaderStage`                                                                                                                                                                                                                              | 8                        |
| `maxStorageTexturesPerShaderStage`                                                                                                                                                                                                                             | 4                        |
| `maxUniformBuffersPerShaderStage`                                                                                                                                                                                                                              | 12                       |
| `maxUniformBufferBindingSize`                                                                                                                                                                                                                                  | 65536 bytes              |
| `maxStorageBufferBindingSize`                                                                                                                                                                                                                                  | 134217728 bytes (128 MB) |
| `minUniformBufferOffsetAlignment`                                                                                                                                                                                                                              | 256 bytes                |
| `minStorageBufferOffsetAlignment`                                                                                                                                                                                                                              | 256 bytes                |
| `maxVertexBuffers`                                                                                                                                                                                                                                             | 8                        |
| `maxBufferSize`                                                                                                                                                                                                                                                | 268435456 bytes (256 MB) |
| `maxVertexAttributes`                                                                                                                                                                                                                                          | 16                       |
| `maxVertexBufferArrayStride`                                                                                                                                                                                                                                   | 2048 bytes               |
| `maxInterStageShaderComponents` {{deprecated_inline}} {{non-standard_inline}} (dùng `maxInterStageShaderVariables` thay thế, xem [thông báo ngừng sử dụng](https://developer.chrome.com/blog/new-in-webgpu-133#deprecate_maxinterstageshadercomponents_limit)) | 60                       |
| `maxInterStageShaderVariables`                                                                                                                                                                                                                                 | 16                       |
| `maxColorAttachments`                                                                                                                                                                                                                                          | 8                        |
| `maxColorAttachmentBytesPerSample`                                                                                                                                                                                                                             | 32                       |
| `maxComputeWorkgroupStorageSize`                                                                                                                                                                                                                               | 16384 bytes              |
| `maxComputeInvocationsPerWorkgroup`                                                                                                                                                                                                                            | 256                      |
| `maxComputeWorkgroupSizeX`                                                                                                                                                                                                                                     | 256                      |
| `maxComputeWorkgroupSizeY`                                                                                                                                                                                                                                     | 256                      |
| `maxComputeWorkgroupSizeZ`                                                                                                                                                                                                                                     | 64                       |
| `maxComputeWorkgroupsPerDimension`                                                                                                                                                                                                                             | 65535                    |

## Ví dụ

Trong đoạn mã sau, chúng ta truy vấn giá trị `maxBindGroups` từ `GPUAdapter.limits` để xem nó có bằng hoặc lớn hơn 6 hay không. Ứng dụng ví dụ lý tưởng cần 6 nhóm ràng buộc, vì vậy nếu giá trị trả về >= 6, chúng ta thêm giới hạn tối đa là 6 vào đối tượng `requiredLimits`. Sau đó chúng ta yêu cầu một thiết bị với yêu cầu giới hạn đó bằng cách sử dụng {{domxref("GPUAdapter.requestDevice()")}}:

```js
async function init() {
  if (!navigator.gpu) {
    throw Error("WebGPU not supported.");
  }

  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw Error("Couldn't request WebGPU adapter.");
  }

  const requiredLimits = {};

  // App ideally needs 6 bind groups, so we'll try to request what the app needs
  if (adapter.limits.maxBindGroups >= 6) {
    requiredLimits.maxBindGroups = 6;
  }

  const device = await adapter.requestDevice({
    requiredLimits,
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
