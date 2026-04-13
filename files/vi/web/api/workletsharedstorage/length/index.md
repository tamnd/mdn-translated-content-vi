---
title: "WorkletSharedStorage: length() method"
short-title: length()
slug: Web/API/WorkletSharedStorage/length
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WorkletSharedStorage.length
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`length()`** của giao diện {{domxref("WorkletSharedStorage")}} trả về số lượng mục hiện đang được lưu trong bộ nhớ chia sẻ cho nguồn gốc hiện tại.

## Cú pháp

```js-nolint
length()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với số, đại diện cho tổng số cặp key-value hiện tại trong bộ nhớ chia sẻ.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Module worklet chưa được thêm với {{domxref("Worklet.addModule", "addModule()")}}.
    - Trang gọi không có Shared Storage API trong [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.
    - Trình duyệt không thể lấy số lượng mục vì một lý do khác.

## Ví dụ

```js
// length() available inside a shared storage worklet module

async function retrieveLength() {
  const length = await this.sharedStorage.length();
  console.log(length);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
