---
title: "GPUQuerySet: type property"
short-title: type
slug: Web/API/GPUQuerySet/type
page-type: web-api-instance-property
browser-compat: api.GPUQuerySet.type
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("GPUQuerySet")}} là một giá trị liệt kê chỉ định loại truy vấn được quản lý bởi `GPUQuerySet`.

## Giá trị

Một giá trị liệt kê. Các giá trị có thể là:

- `"occlusion"`
  - : `GPUQuerySet` quản lý các truy vấn che khuất.
- `"timestamp"` {{experimental_inline}}
  - : `GPUQuerySet` quản lý các truy vấn dấu thời gian.

> [!NOTE]
> Tính năng `timestamp-query` cần được bật để sử dụng truy vấn dấu thời gian.

## Ví dụ

Xem trang chính [`GPUQuerySet`](/en-US/docs/Web/API/GPUQuerySet#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
