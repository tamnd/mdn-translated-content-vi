---
title: IDBIndex.getKey()
slug: Web/API/IDBIndex/getKey
page-type: web-api-instance-method
browser-compat: api.IDBIndex.getKey
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`getKey()`** của giao diện `IDBIndex` trả về khóa chính của bản ghi đầu tiên khớp trong object store được tham chiếu, hoặc khóa đầu tiên khớp trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.

## Cú pháp

```js-nolint
getKey(key)
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
const request = myIndex.getKey("Jane");
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
