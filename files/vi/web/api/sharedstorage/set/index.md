---
title: "SharedStorage: set() method"
short-title: set()
slug: Web/API/SharedStorage/set
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorage.set
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`set()`** của giao diện {{domxref("SharedStorage")}} lưu trữ một cặp key-value mới trong bộ lưu trữ chia sẻ của nguồn gốc hiện tại hoặc cập nhật cặp hiện có.

## Cú pháp

```js-nolint
set(key, value)
set(key, value, options)
```

### Tham số

- `key`
  - : Một chuỗi đại diện cho key trong cặp key-value mà bạn muốn thêm hoặc cập nhật.
- `value`
  - : Một chuỗi đại diện cho giá trị bạn muốn thêm hoặc cập nhật.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `ignoreIfPresent`
      - : Một giá trị boolean. Giá trị `true` khiến thao tác set hủy bỏ nếu cặp key-value với `key` được chỉ định đã tồn tại. Giá trị mặc định `false` khiến thao tác set ghi đè lên giá trị trước đó.

### Giá trị trả về

Một {{jsxref("Promise")}} thực hiện với `undefined`.

### Ngoại lệ

- `Promise` từ chối với {{jsxref("TypeError")}} nếu:
  - Mục nhập được tạo không được lưu trữ thành công trong cơ sở dữ liệu do bộ lưu trữ chia sẻ không khả dụng (ví dụ: bị tắt bởi cài đặt trình duyệt).
  - `key` và/hoặc `value` vượt quá độ dài tối đa do trình duyệt xác định.
  - Trang gọi không có Shared Storage API được bao gồm trong [quy trình đăng ký privacy sandbox](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.
- Trong trường hợp {{domxref("WorkletSharedStorage")}}, `Promise` từ chối với {{jsxref("TypeError")}} nếu module worklet chưa được thêm bằng {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

> [!NOTE]
> Trong trường hợp {{domxref("WindowSharedStorage")}}, nếu thao tác `set()` không ghi thành công vào cơ sở dữ liệu vì lý do khác ngoài bộ lưu trữ chia sẻ không khả dụng, không có lỗi nào được ném ra, thao tác vẫn thực hiện với `undefined`.

## Ví dụ

```js
window.sharedStorage
  .set("ab-testing-group", "0", {
    ignoreIfPresent: true,
  })
  .then(() => console.log("Set operation completed"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
