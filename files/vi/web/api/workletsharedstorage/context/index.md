---
title: "WorkletSharedStorage: context property"
short-title: context
slug: Web/API/WorkletSharedStorage/context
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.WorkletSharedStorage.context
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`context`** của giao diện {{domxref("WorkletSharedStorage")}} chứa dữ liệu ngữ cảnh được truyền vào worklet bộ nhớ chia sẻ từ bối cảnh duyệt web liên kết qua phương thức {{domxref("FencedFrameConfig.setSharedStorageContext()")}}.

## Giá trị

Chuỗi đại diện cho dữ liệu. Giá trị sẽ khớp với giá trị mới nhất được truyền vào phương thức {{domxref("FencedFrameConfig.setSharedStorageContext()")}} trước khi điều hướng đến {{domxref("FencedFrameConfig")}}. Nếu không có giá trị nào được đặt bởi `setSharedStorageContext()` trước khi điều hướng, thì `context` sẽ trả về `undefined`.

## Ví dụ

Xem trang {{domxref("WorkletSharedStorage")}} chính để biết ví dụ.

## Thông số kỹ thuật

Thuộc tính `context` hiện không được định nghĩa trong bất kỳ thông số kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
