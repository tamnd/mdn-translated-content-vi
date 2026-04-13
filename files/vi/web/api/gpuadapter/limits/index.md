---
title: "GPUAdapter: limits property"
short-title: limits
slug: Web/API/GPUAdapter/limits
page-type: web-api-instance-property
browser-compat: api.GPUAdapter.limits
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`limits`** của giao diện {{domxref("GPUAdapter")}} trả về một đối tượng {{domxref("GPUSupportedLimits")}} mô tả các giới hạn được bộ điều hợp hỗ trợ.

Cần lưu ý rằng, thay vì báo cáo chính xác các giới hạn của mỗi GPU, các trình duyệt có thể báo cáo các giá trị cấp bậc khác nhau của các giới hạn để giảm thông tin nhận diện duy nhất có sẵn cho việc theo dõi. Ví dụ, các cấp bậc của một giới hạn nhất định có thể là 2048, 8192 và 32768. Nếu giới hạn thực tế của GPU của bạn là 16384, trình duyệt vẫn sẽ báo cáo 8192.

Vì các trình duyệt khác nhau xử lý điều này khác nhau và các giá trị cấp bậc có thể thay đổi theo thời gian, nên khó cung cấp mô tả chính xác về các giá trị giới hạn nào cần mong đợi, vì vậy nên kiểm tra kỹ lưỡng.

## Giá trị

Một phiên bản đối tượng {{domxref("GPUSupportedLimits")}}.

## Ví dụ

Trong đoạn mã dưới đây, chúng ta truy vấn giá trị `GPUAdapter.limits` của `maxBindGroups` để xem nó có bằng hoặc lớn hơn 6 không. Ứng dụng ví dụ lý tưởng cần 6 bind group, vì vậy nếu giá trị trả về >= 6, chúng ta thêm giới hạn tối đa 6 vào đối tượng `requiredLimits` và yêu cầu thiết bị với yêu cầu giới hạn đó bằng {{domxref("GPUAdapter.requestDevice()")}}.

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
