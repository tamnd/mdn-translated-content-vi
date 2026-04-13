---
title: "GPUAdapter: requestAdapterInfo() method"
short-title: requestAdapterInfo()
slug: Web/API/GPUAdapter/requestAdapterInfo
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.GPUAdapter.requestAdapterInfo
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{deprecated_header}}{{non-standard_header}}{{AvailableInWorkers}}

Phương thức **`requestAdapterInfo()`** của giao diện {{domxref("GPUAdapter")}} trả về một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("GPUAdapterInfo")}} chứa thông tin nhận diện về bộ điều hợp.

`requestAdapterInfo()` đã bị xóa khỏi đặc tả WebGPU. Hãy dùng {{domxref("GPUAdapter.info")}} để truy cập thông tin bộ điều hợp thay thế.

## Cú pháp

```js-nolint
requestAdapterInfo()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một phiên bản đối tượng {{domxref("GPUAdapterInfo")}}.

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

  const adapterInfo = await adapter.requestAdapterInfo();
  console.log(adapterInfo.vendor);
  console.log(adapterInfo.architecture);

  // …
}
```

## Thông số kỹ thuật

Không còn là một phần của [đặc tả WebGPU](https://gpuweb.github.io/gpuweb/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
