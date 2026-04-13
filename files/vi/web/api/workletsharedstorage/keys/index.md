---
title: "WorkletSharedStorage: keys() method"
short-title: keys()
slug: Web/API/WorkletSharedStorage/keys
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WorkletSharedStorage.keys
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`keys()`** của giao diện {{domxref("WorkletSharedStorage")}} trả về một [async iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator), chứa các khóa cho mỗi mục trong một phiên bản `WorkletSharedStorage`.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Mảng các khóa thuộc tính có thể liệt kê của `WorkletSharedStorage`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu trang gọi không có Shared Storage API trong [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

```js
// keys() available inside a shared storage worklet module
const storage = await this.sharedStorage;

async function logKeys() {
  for await (const key of storage.keys()) {
    console.log(key);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
