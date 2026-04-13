---
title: "SharedStorage: clear() method"
short-title: clear()
slug: Web/API/SharedStorage/clear
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorage.clear
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`clear()`** của giao diện {{domxref("SharedStorage")}} xóa bộ lưu trữ chia sẻ của nguồn gốc hiện tại, xóa toàn bộ dữ liệu.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `Promise` từ chối với {{jsxref("TypeError")}} nếu:
  - Cơ sở dữ liệu không được xóa thành công do bộ lưu trữ chia sẻ không khả dụng (ví dụ: bị tắt bởi cài đặt trình duyệt).
  - Trang gọi không có Shared Storage API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.
- Trong trường hợp {{domxref("WorkletSharedStorage")}}, `Promise` từ chối với {{jsxref("TypeError")}} nếu module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]
> Trong trường hợp {{domxref("WindowSharedStorage")}}, nếu thao tác `clear()` không ghi thành công vào cơ sở dữ liệu vì lý do khác ngoài bộ lưu trữ chia sẻ không khả dụng, không có lỗi nào được ném ra, thao tác vẫn thực hiện với `undefined`.

## Ví dụ

```js
window.sharedStorage.clear().then(() => console.log("Shared storage cleared"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
