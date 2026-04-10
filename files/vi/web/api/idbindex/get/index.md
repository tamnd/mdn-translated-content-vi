---
title: IDBIndex.get()
slug: Web/API/IDBIndex/get
page-type: web-api-instance-method
browser-compat: api.IDBIndex.get
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện `IDBIndex` trả về bản ghi đầu tiên trong object store được tham chiếu khớp với khóa đã cho, hoặc bản ghi đầu tiên khớp trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Khóa hoặc phạm vi khóa dùng để tìm bản ghi.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}.

### Ngoại lệ

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Transaction của đối tượng này đang không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Khóa hoặc phạm vi khóa không hợp lệ.

## Ví dụ

```js
const request = myIndex.get("Jane");
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
