---
title: "WorkletSharedStorage: entries() method"
short-title: entries()
slug: Web/API/WorkletSharedStorage/entries
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WorkletSharedStorage.entries
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`entries()`** của giao diện {{domxref("WorkletSharedStorage")}} trả về một [async iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator). Iterator cung cấp mảng các cặp `[key, value]` tương ứng với các thuộc tính có thể liệt kê của một phiên bản `WorkletSharedStorage`. Thứ tự của các cặp này tương tự như trong vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in), mặc dù vòng lặp `for...in` cũng liệt kê các thuộc tính từ chuỗi prototype.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Mảng các cặp key-value của các thuộc tính có thể liệt kê của `WorkletSharedStorage`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu trang gọi không có Shared Storage API trong [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

```js
// entries() available inside a shared storage worklet module
const storage = await this.sharedStorage;

async function logEntries() {
  for await (const [key, value] of storage.entries()) {
    console.log({ key, value });
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
