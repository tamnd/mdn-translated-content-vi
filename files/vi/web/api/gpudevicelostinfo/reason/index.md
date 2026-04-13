---
title: "GPUDeviceLostInfo: reason property"
short-title: reason
slug: Web/API/GPUDeviceLostInfo/reason
page-type: web-api-instance-property
browser-compat: api.GPUDeviceLostInfo.reason
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`reason`** của giao diện {{domxref("GPUDeviceLostInfo")}} xác định lý do thiết bị bị mất theo cách máy có thể đọc được.

## Giá trị

Giá trị được liệt kê. Hiện tại giá trị duy nhất được xác định trong đặc tả là `"destroyed"`, cho biết thiết bị đã bị hủy bởi lệnh gọi {{domxref("GPUDevice.destroy()")}}.

Nếu thiết bị bị mất vì lý do không xác định không được bao phủ trong các giá trị được liệt kê có sẵn, `reason` trả về `undefined`.

## Ví dụ

Xem [trang `GPUDevice.lost` chính](/en-US/docs/Web/API/GPUDevice/lost#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
