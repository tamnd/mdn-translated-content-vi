---
title: "GPUAdapter: features property"
short-title: features
slug: Web/API/GPUAdapter/features
page-type: web-api-instance-property
browser-compat: api.GPUAdapter.features
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`features`** của giao diện {{domxref("GPUAdapter")}} trả về một đối tượng {{domxref("GPUSupportedFeatures")}} mô tả các chức năng bổ sung được bộ điều hợp hỗ trợ.

Cần lưu ý rằng không phải tất cả các tính năng đều có sẵn cho WebGPU trong tất cả các trình duyệt hỗ trợ nó, ngay cả khi các tính năng đó được phần cứng cơ bản hỗ trợ. Điều này có thể do các ràng buộc trong hệ thống cơ bản, trình duyệt hoặc bộ điều hợp. Ví dụ:

- Hệ thống cơ bản có thể không đảm bảo được việc hiển thị tính năng theo cách tương thích với một trình duyệt nhất định.
- Nhà cung cấp trình duyệt có thể chưa tìm ra cách triển khai hỗ trợ cho tính năng đó một cách an toàn, hoặc chưa kịp thực hiện.

Nếu bạn muốn tận dụng một tính năng bổ sung cụ thể trong ứng dụng WebGPU, nên thực hiện kiểm tra kỹ lưỡng.

## Giá trị

Một phiên bản đối tượng {{domxref("GPUSupportedFeatures")}}. Đây là đối tượng dạng [setlike](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set).

## Ví dụ

Trong đoạn mã dưới đây, chúng ta kiểm tra xem {{domxref("GPUAdapter")}} có tính năng `texture-compression-astc` hay không. Nếu có, chúng ta thêm nó vào mảng `requiredFeatures` và yêu cầu thiết bị với yêu cầu tính năng đó bằng {{domxref("GPUAdapter.requestDevice()")}}.

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

  const device = await adapter.requestDevice({
    requiredFeatures,
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
