---
title: "GPUAdapter: requestDevice() method"
short-title: requestDevice()
slug: Web/API/GPUAdapter/requestDevice
page-type: web-api-instance-method
browser-compat: api.GPUAdapter.requestDevice
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`requestDevice()`** của giao diện {{domxref("GPUAdapter")}} trả về một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("GPUDevice")}}, là giao diện chính để giao tiếp với GPU.

## Cú pháp

```js-nolint
requestDevice()
requestDevice(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `defaultQueue` {{optional_inline}}
      - : Một đối tượng cung cấp thông tin cho {{domxref("GPUQueue")}} mặc định của thiết bị. Đối tượng này có một thuộc tính duy nhất là `label`, cung cấp nhãn cho hàng đợi mặc định. Nếu không cung cấp, mặc định là đối tượng rỗng và nhãn hàng đợi mặc định sẽ là chuỗi rỗng.
    - `label` {{optional_inline}}
      - : Một chuỗi cung cấp nhãn có thể dùng để nhận diện {{domxref("GPUDevice")}}.
    - `requiredFeatures` {{optional_inline}}
      - : Một mảng chuỗi đại diện cho các chức năng bổ sung mà {{domxref("GPUDevice")}} trả về cần hỗ trợ. Lệnh gọi `requestDevice()` sẽ thất bại nếu `GPUAdapter` không thể cung cấp các tính năng này. Mặc định là mảng rỗng.
    - `requiredLimits` {{optional_inline}}
      - : Một đối tượng chứa các thuộc tính đại diện cho các giới hạn mà {{domxref("GPUDevice")}} trả về cần hỗ trợ. Lệnh gọi `requestDevice()` sẽ thất bại nếu `GPUAdapter` không thể cung cấp các giới hạn này.
        > [!NOTE]
        > Bạn có thể yêu cầu các giới hạn không xác định khi yêu cầu thiết bị GPU mà không gây ra lỗi. Các giới hạn như vậy sẽ là `undefined`.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một phiên bản đối tượng {{domxref("GPUDevice")}}.

Nếu bạn thực hiện lệnh gọi trùng lặp, tức là gọi `requestDevice()` trên {{domxref("GPUAdapter")}} mà `requestDevice()` đã được gọi trước đó, promise sẽ từ chối với `OperationError`.

### Ngoại lệ

- `OperationError` {{domxref("DOMException")}}
  - : Promise từ chối với `OperationError` nếu:
    - Các giới hạn trong thuộc tính `requiredLimits` không được {{domxref("GPUAdapter")}} hỗ trợ.
    - `GPUAdapter` đã được sử dụng bằng cách gọi `requestDevice()` trên nó trước đó.
- `TypeError` {{domxref("DOMException")}}
  - : Promise từ chối với `TypeError` nếu các tính năng trong thuộc tính `requiredFeatures` không được {{domxref("GPUAdapter")}} hỗ trợ.

## Ví dụ

### Ví dụ cơ bản

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

### Yêu cầu các tính năng và giới hạn cụ thể

Trong đoạn mã dưới đây:

1. Kiểm tra xem {{domxref("GPUAdapter")}} có tính năng `texture-compression-astc` hay không. Nếu có, thêm vào mảng `requiredFeatures`.
2. Truy vấn giá trị `GPUAdapter.limits` của `maxBindGroups` để xem nó có bằng hoặc lớn hơn 6 không.
3. Yêu cầu thiết bị với các yêu cầu tính năng và giới hạn đó, cùng với nhãn `defaultQueue`.

```js
async function init() {
  if (!navigator.gpu) {
    throw Error("WebGPU not supported.");
  }

  const adapter = await navigator.gpu.requestAdapter();
  if (!adapter) {
    throw Error("Couldn't request WebGPU adapter.");
  }

  const requiredFeatures = [];

  if (adapter.features.has("texture-compression-astc")) {
    requiredFeatures.push("texture-compression-astc");
  }

  const requiredLimits = {};

  // App ideally needs 6 bind groups, so we'll try to request what the app needs
  if (adapter.limits.maxBindGroups >= 6) {
    requiredLimits.maxBindGroups = 6;
  }

  const device = await adapter.requestDevice({
    defaultQueue: {
      label: "my_queue",
    },
    requiredFeatures,
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
