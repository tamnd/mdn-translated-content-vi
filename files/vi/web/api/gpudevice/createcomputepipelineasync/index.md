---
title: "GPUDevice: phương thức createComputePipelineAsync()"
short-title: createComputePipelineAsync()
slug: Web/API/GPUDevice/createComputePipelineAsync
page-type: web-api-instance-method
browser-compat: api.GPUDevice.createComputePipelineAsync
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createComputePipelineAsync()`** của giao diện {{domxref("GPUDevice")}} trả về một {{jsxref("Promise")}} sẽ được hoàn tất với một {{domxref("GPUComputePipeline")}}, có thể điều khiển giai đoạn compute shader và được dùng trong {{domxref("GPUComputePassEncoder")}} khi pipeline có thể dùng mà không gây chặn.

> [!NOTE]
> Nói chung nên dùng phương thức này thay cho {{domxref("GPUDevice.createComputePipeline()")}} khi có thể, vì nó tránh chặn việc thực thi thao tác GPU trong lúc biên dịch pipeline.

## Cú pháp

```js-nolint
createComputePipelineAsync(descriptor)
```

### Tham số

- `descriptor`
  - : Xem định nghĩa descriptor cho phương thức [`GPUDevice.createComputePipeline()`](/en-US/docs/Web/API/GPUDevice/createComputePipeline#syntax).

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ được hoàn tất với một thể hiện {{domxref("GPUComputePipeline")}} khi pipeline được tạo đã sẵn sàng để dùng mà không cần chờ thêm.

### Kiểm tra hợp lệ

Nếu việc tạo pipeline thất bại và pipeline kết quả trở nên không hợp lệ, promise trả về sẽ bị từ chối với một {{domxref("GPUPipelineError")}}:

- Nếu nguyên nhân là lỗi nội bộ, {{domxref("GPUPipelineError")}} sẽ có `reason` là `"internal"`.
- Nếu nguyên nhân là lỗi kiểm tra hợp lệ, {{domxref("GPUPipelineError")}} sẽ có `reason` là `"validation"`.

Lỗi kiểm tra hợp lệ có thể xảy ra nếu bất kỳ điều nào sau đây là sai:

- Kích thước bộ nhớ lưu trữ workgroup mà `module` được tham chiếu bên trong thuộc tính `compute` sử dụng nhỏ hơn hoặc bằng giới hạn `maxComputeWorkgroupStorageSize` của {{domxref("GPUDevice")}}.
- `module` sử dụng số lượng compute invocation trên mỗi workgroup nhỏ hơn hoặc bằng `maxComputeInvocationsPerWorkgroup` của {{domxref("GPUDevice")}}.
- Kích thước workgroup của `module` nhỏ hơn hoặc bằng `maxComputeWorkgroupSizeX`, `maxComputeWorkgroupSizeY`, hoặc `maxComputeWorkgroupSizeZ` tương ứng của {{domxref("GPUDevice")}}.
- Nếu thuộc tính `entryPoint` bị bỏ qua, mã shader phải chứa đúng một hàm entry point compute shader để trình duyệt dùng làm entry point mặc định.

## Ví dụ

> [!NOTE]
> [Các mẫu WebGPU](https://webgpu.github.io/webgpu-samples/) có thêm nhiều ví dụ khác.

### Ví dụ cơ bản

Ví dụ sau mô tả một quy trình:

- Tạo một bind group layout bằng {{domxref("GPUDevice.createBindGroupLayout()")}}.
- Đưa `bindGroupLayout` vào {{domxref("GPUDevice.createPipelineLayout()")}} để tạo một {{domxref("GPUPipelineLayout")}}.
- Dùng ngay giá trị đó trong một lời gọi `createComputePipelineAsync()` để tạo một {{domxref("GPUComputePipeline")}}.

```js
async function init() {
  // …

  const bindGroupLayout = device.createBindGroupLayout({
    entries: [
      {
        binding: 0,
        visibility: GPUShaderStage.COMPUTE,
        buffer: {
          type: "storage",
        },
      },
    ],
  });

  const computePipeline = await device.createComputePipelineAsync({
    layout: device.createPipelineLayout({
      bindGroupLayouts: [bindGroupLayout],
    }),
    compute: {
      module: shaderModule,
      entryPoint: "main",
    },
  });

  // …
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
