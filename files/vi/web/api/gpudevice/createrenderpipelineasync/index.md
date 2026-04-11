---
title: "GPUDevice: phương thức createRenderPipelineAsync()"
short-title: createRenderPipelineAsync()
slug: Web/API/GPUDevice/createRenderPipelineAsync
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createRenderPipelineAsync
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createRenderPipelineAsync()`** của giao diện {{domxref("GPUDevice")}} trả về một {{jsxref("Promise")}} sẽ được hoàn tất với một {{domxref("GPURenderPipeline")}}, có thể điều khiển các giai đoạn vertex và fragment shader và được dùng trong {{domxref("GPURenderPassEncoder")}} hoặc {{domxref("GPURenderBundleEncoder")}} khi pipeline có thể dùng mà không gây chặn.

> [!NOTE]
> Nói chung nên dùng phương thức này thay cho {{domxref("GPUDevice.createRenderPipeline()")}} khi có thể, vì nó tránh chặn việc thực thi thao tác GPU trong lúc biên dịch pipeline.

## Cú pháp

```js-nolint
createRenderPipelineAsync(descriptor)
```

### Tham số

- `descriptor`
  - : Xem định nghĩa descriptor cho phương thức [`GPUDevice.createRenderPipeline()`](/en-US/docs/Web/API/GPUDevice/createRenderPipeline#syntax).

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ được hoàn tất với một thể hiện {{domxref("GPURenderPipeline")}} khi pipeline được tạo đã sẵn sàng để dùng mà không cần chờ thêm.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
