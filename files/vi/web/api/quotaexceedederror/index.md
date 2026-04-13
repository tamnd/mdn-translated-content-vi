---
title: QuotaExceededError
slug: Web/API/QuotaExceededError
page-type: web-api-interface
status:
  - experimental
browser-compat: api.QuotaExceededError
---

{{APIRef("DOM")}}{{SeeCompatTable}}

Giao diện **`QuotaExceededError`** đại diện cho lỗi khi một thao tác được yêu cầu vượt quá hạn mức lưu trữ do hệ thống áp đặt.

> [!NOTE]
> Trong các phiên bản trình duyệt trước khi giao diện này được triển khai, đây là một `DOMException` thông thường. Việc phân lớp cho phép đưa thêm thông tin như `quota` và `requested` vào.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("QuotaExceededError/QuotaExceededError", "QuotaExceededError()")}} {{experimental_inline}}
  - : Tạo một đối tượng `QuotaExceededError`.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ tổ tiên {{domxref("DOMException")}}._

- {{domxref("QuotaExceededError.quota")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về giới hạn lưu trữ do hệ thống định nghĩa (tính bằng byte) đã bị vượt quá.
- {{domxref("QuotaExceededError.requested", "requested")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về lượng lưu trữ (tính bằng byte) đã được yêu cầu trong thao tác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMException")}}
- {{domxref("StorageManager.estimate()")}}
- [Hạn mức lưu trữ và tiêu chí xóa](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria)
