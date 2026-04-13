---
title: "SharedStorage: delete() method"
short-title: delete()
slug: Web/API/SharedStorage/delete
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorage.delete
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`delete()`** của giao diện {{domxref("SharedStorage")}} xóa một cặp key-value hiện có khỏi bộ lưu trữ chia sẻ của nguồn gốc hiện tại.

## Cú pháp

```js-nolint
delete(key)
```

### Tham số

- `key`
  - : Một chuỗi đại diện cho key của cặp key-value bạn muốn xóa.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `Promise` từ chối với {{jsxref("TypeError")}} nếu:
  - Cơ sở dữ liệu không được xóa thành công do bộ lưu trữ chia sẻ không khả dụng (ví dụ: bị tắt bởi cài đặt trình duyệt).
  - `key` vượt quá độ dài tối đa do trình duyệt xác định.
  - Trang gọi không có Shared Storage API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.
- Trong trường hợp {{domxref("WorkletSharedStorage")}}, `Promise` từ chối với {{jsxref("TypeError")}} nếu:
  - Module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]
> Nếu cặp key-value không tồn tại trong bộ lưu trữ chia sẻ, không có lỗi nào được ném ra, thao tác vẫn thực hiện với `undefined`.

> [!NOTE]
> Trong trường hợp {{domxref("WindowSharedStorage")}}, nếu thao tác `delete()` không ghi thành công vào cơ sở dữ liệu vì lý do khác ngoài bộ lưu trữ chia sẻ không khả dụng, không có lỗi nào được ném ra, thao tác vẫn thực hiện với `undefined`.

## Ví dụ

```js
window.sharedStorage
  .delete("ab-testing-group")
  .then(() => console.log("Value deleted"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
