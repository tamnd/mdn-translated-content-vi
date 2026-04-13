---
title: "SharedStorage: append() method"
short-title: append()
slug: Web/API/SharedStorage/append
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorage.append
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`append()`** của giao diện {{domxref("SharedStorage")}} nối thêm một chuỗi vào giá trị của một cặp key-value hiện có trong bộ lưu trữ chia sẻ của nguồn gốc hiện tại.

## Cú pháp

```js-nolint
append(key, value)
```

### Tham số

- `key`
  - : Một chuỗi đại diện cho key của cặp key-value mà bạn muốn nối thêm giá trị.
- `value`
  - : Một chuỗi bạn muốn nối thêm vào giá trị hiện có của cặp key-value.

> [!NOTE]
> Nếu `key` được chỉ định không tìm thấy trong bộ lưu trữ chia sẻ, thao tác `append()` tương đương với {{domxref("SharedStorage.set", "set()")}}, tức là một cặp key-value mới với `key` được chỉ định sẽ được thêm vào bộ lưu trữ chia sẻ.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `Promise` từ chối với {{jsxref("TypeError")}} nếu:
  - Mục nhập được nối thêm không được lưu trữ thành công trong cơ sở dữ liệu do bộ lưu trữ chia sẻ không khả dụng (ví dụ: bị tắt bởi cài đặt trình duyệt).
  - `key` và/hoặc `value` vượt quá độ dài tối đa do trình duyệt xác định.
  - Trang gọi không có Shared Storage API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.
- Trong trường hợp {{domxref("WorkletSharedStorage")}}, `Promise` từ chối với {{jsxref("TypeError")}} nếu module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]
> Trong trường hợp {{domxref("WindowSharedStorage")}}, nếu thao tác `append()` không ghi thành công vào cơ sở dữ liệu vì lý do khác ngoài bộ lưu trữ chia sẻ không khả dụng, không có lỗi nào được ném ra, thao tác vẫn thực hiện với `undefined`.

## Ví dụ

```js
window.sharedStorage
  .append("integer-list", ",9")
  .then(() => console.log("Value appended to integer list"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
