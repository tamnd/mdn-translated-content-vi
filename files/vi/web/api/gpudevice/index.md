---
title: GPUDevice
slug: Web/API/GPUDevice
page-type: web-api-interface
browser-compat: api.GPUDevice
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUDevice`** của {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một thiết bị GPU logic. Đây là giao diện chính mà qua đó phần lớn chức năng WebGPU được truy cập.

Đối tượng `GPUDevice` được yêu cầu bằng phương thức {{domxref("GPUAdapter.requestDevice()")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("GPUDevice.adapterInfo", "adapterInfo")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUAdapterInfo")}} chứa thông tin nhận dạng về adapter gốc của thiết bị.

- {{domxref("GPUDevice.features", "features")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUSupportedFeatures")}} mô tả các chức năng bổ sung được thiết bị hỗ trợ.

- {{domxref("GPUDevice.label", "label")}}
  - : Một chuỗi dùng làm nhãn để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo trên console.

- {{domxref("GPUDevice.limits", "limits")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("GPUSupportedLimits")}} mô tả các giới hạn mà thiết bị hỗ trợ.

- {{domxref("GPUDevice.lost", "lost")}} {{ReadOnlyInline}}
  - : Chứa một {{jsxref("Promise")}} luôn ở trạng thái chờ trong suốt vòng đời của thiết bị và được giải quyết bằng một đối tượng {{domxref("GPUDeviceLostInfo")}} khi thiết bị bị mất.

- {{domxref("GPUDevice.queue", "queue")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("GPUQueue")}} chính của thiết bị.

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("GPUDevice.createBindGroup", "createBindGroup()")}}
  - : Tạo một {{domxref("GPUBindGroup")}} dựa trên một {{domxref("GPUBindGroupLayout")}}, mô tả tập hợp tài nguyên được ràng buộc cùng nhau trong một nhóm và cách các tài nguyên đó được dùng trong các giai đoạn shader.

- {{domxref("GPUDevice.createBindGroupLayout", "createBindGroupLayout()")}}
  - : Tạo một {{domxref("GPUBindGroupLayout")}} xác định cấu trúc và mục đích của các tài nguyên GPU liên quan như buffer sẽ được dùng trong pipeline, và được dùng làm khuôn mẫu khi tạo {{domxref("GPUBindGroup")}}.

- {{domxref("GPUDevice.createBuffer", "createBuffer()")}}
  - : Tạo một {{domxref("GPUBuffer")}} để lưu dữ liệu thô dùng trong các thao tác GPU.

- {{domxref("GPUDevice.createCommandEncoder", "createCommandEncoder()")}}
  - : Tạo một {{domxref("GPUCommandEncoder")}}, được dùng để mã hóa các lệnh sẽ được gửi tới GPU.

- {{domxref("GPUDevice.createComputePipeline", "createComputePipeline()")}}
  - : Tạo một {{domxref("GPUComputePipeline")}} có thể điều khiển giai đoạn compute shader và được dùng trong {{domxref("GPUComputePassEncoder")}}.

- {{domxref("GPUDevice.createComputePipelineAsync", "createComputePipelineAsync()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ được hoàn tất với {{domxref("GPUComputePipeline")}}, có thể điều khiển giai đoạn compute shader và được dùng trong {{domxref("GPUComputePassEncoder")}} khi pipeline có thể dùng mà không gây chặn.

- {{domxref("GPUDevice.createPipelineLayout", "createPipelineLayout()")}}
  - : Tạo một {{domxref("GPUPipelineLayout")}} xác định các {{domxref("GPUBindGroupLayout")}} được pipeline sử dụng. Các {{domxref("GPUBindGroup")}} dùng cùng pipeline trong quá trình mã hóa lệnh phải có {{domxref("GPUBindGroupLayout")}} tương thích.

- {{domxref("GPUDevice.createQuerySet", "createQuerySet()")}}
  - : Tạo một {{domxref("GPUQuerySet")}} có thể dùng để ghi lại kết quả của các truy vấn trên các pass, chẳng hạn truy vấn occlusion hoặc timestamp.

- {{domxref("GPUDevice.createRenderBundleEncoder", "createRenderBundleEncoder()")}}
  - : Tạo một {{domxref("GPURenderBundleEncoder")}} có thể dùng để ghi sẵn các gói lệnh. Chúng có thể được tái sử dụng trong {{domxref("GPURenderPassEncoder")}} thông qua phương thức {{domxref("GPURenderPassEncoder.executeBundles", "executeBundles()")}} nhiều lần tùy cần.

- {{domxref("GPUDevice.createRenderPipeline", "createRenderPipeline()")}}
  - : Tạo một {{domxref("GPURenderPipeline")}} có thể điều khiển các giai đoạn vertex và fragment shader và được dùng trong {{domxref("GPURenderPassEncoder")}} hoặc {{domxref("GPURenderBundleEncoder")}}.

- {{domxref("GPUDevice.createRenderPipelineAsync", "createRenderPipelineAsync()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ được hoàn tất với {{domxref("GPURenderPipeline")}}, có thể điều khiển các giai đoạn vertex và fragment shader và được dùng trong {{domxref("GPURenderPassEncoder")}} hoặc {{domxref("GPURenderBundleEncoder")}} khi pipeline có thể dùng mà không gây chặn.

- {{domxref("GPUDevice.createSampler", "createSampler()")}}
  - : Tạo một {{domxref("GPUSampler")}}, điều khiển cách shader biến đổi và lọc dữ liệu tài nguyên texture.

- {{domxref("GPUDevice.createShaderModule", "createShaderModule()")}}
  - : Tạo một {{domxref("GPUShaderModule")}} từ một chuỗi mã nguồn WGSL.

- {{domxref("GPUDevice.createTexture", "createTexture()")}}
  - : Tạo một {{domxref("GPUTexture")}} để lưu dữ liệu texture dùng trong các thao tác dựng hình GPU.

- {{domxref("GPUDevice.destroy", "destroy()")}}
  - : Hủy thiết bị, ngăn không cho thực hiện thêm thao tác nào trên nó.

- {{domxref("GPUDevice.importExternalTexture", "importExternalTexture()")}}
  - : Lấy một {{domxref("HTMLVideoElement")}} làm đầu vào và trả về một đối tượng bao bọc {{domxref("GPUExternalTexture")}} chứa ảnh chụp của video có thể dùng trong các thao tác dựng hình GPU.

- {{domxref("GPUDevice.popErrorScope", "popErrorScope()")}}
  - : Lấy một GPU error scope hiện có ra khỏi ngăn xếp error scope và trả về một {{jsxref("Promise")}} được giải quyết thành một đối tượng ({{domxref("GPUInternalError")}}, {{domxref("GPUOutOfMemoryError")}}, hoặc {{domxref("GPUValidationError")}}) mô tả lỗi đầu tiên được bắt trong phạm vi đó, hoặc `null` nếu không có lỗi.

- {{domxref("GPUDevice.pushErrorScope", "pushErrorScope()")}}
  - : Đẩy một GPU error scope mới lên ngăn xếp error scope của thiết bị, cho phép bạn bắt các lỗi thuộc một kiểu nhất định.

## Sự kiện

- {{domxref("GPUDevice.uncapturederror_event", "uncapturederror")}}
  - : Kích hoạt khi có lỗi được ném ra nhưng không bị một GPU error scope nào quan sát, nhằm cung cấp cách báo cáo các lỗi bất ngờ. Các trường hợp lỗi đã biết nên được xử lý bằng {{domxref("GPUDevice.pushErrorScope", "pushErrorScope()")}} và {{domxref("GPUDevice.popErrorScope", "popErrorScope()")}}.

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

  const shaderModule = device.createShaderModule({
    code: shaders,
  });

  // …
}
```

Xem các trang thành viên riêng lẻ được liệt kê ở trên và các trang demo sau để có thêm nhiều ví dụ hơn về việc sử dụng `GPUDevice`:

- [Bản demo tính toán cơ bản](https://mdn.github.io/dom-examples/webgpu-compute-demo/)
- [Bản demo dựng hình cơ bản](https://mdn.github.io/dom-examples/webgpu-render-demo/)
- [Các mẫu WebGPU](https://webgpu.github.io/webgpu-samples/)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
