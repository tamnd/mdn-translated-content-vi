---
title: "GPUDevice: thuộc tính lost"
short-title: lost
slug: Web/API/GPUDevice/lost
page-type: web-api-instance-property
browser-compat: api.GPUDevice.lost
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lost`** của giao diện {{domxref("GPUDevice")}} chứa một {{jsxref("Promise")}} luôn ở trạng thái chờ trong suốt vòng đời của thiết bị và được giải quyết bằng một đối tượng {{domxref("GPUDeviceLostInfo")}} khi thiết bị bị mất.

## Giá trị

Một {{jsxref("Promise")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
