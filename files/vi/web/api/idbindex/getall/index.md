---
title: IDBIndex.getAll()
slug: Web/API/IDBIndex/getAll
page-type: web-api-instance-method
browser-compat: api.IDBIndex.getAll
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`getAll()`** của giao diện `IDBIndex` trả về tất cả giá trị khớp trong object store được tham chiếu tương ứng với khóa đã cho hoặc nằm trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.

## Cú pháp

```js-nolint
getAll()
getAll(query)
getAll(query, count)
```

### Tham số

- `query` {{optional_inline}}
  - : Khóa hoặc phạm vi khóa để so khớp.
- `count` {{optional_inline}}
  - : Số lượng bản ghi tối đa cần trả về.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}.

### Ngoại lệ

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Transaction của đối tượng này đang không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Khóa hoặc phạm vi khóa không hợp lệ.

## Ví dụ

```js
const request = myIndex.getAll("Jane");
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
