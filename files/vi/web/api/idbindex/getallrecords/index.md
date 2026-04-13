---
title: IDBIndex.getAllRecords()
slug: Web/API/IDBIndex/getAllRecords
page-type: web-api-instance-method
browser-compat: api.IDBIndex.getAllRecords
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`getAllRecords()`** của giao diện `IDBIndex` trả về tất cả bản ghi khớp trong object store được tham chiếu, bao gồm khóa index, khóa chính và giá trị, tương ứng với khóa đã cho hoặc nằm trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.

## Cú pháp

```js-nolint
getAllRecords()
getAllRecords(query)
getAllRecords(query, count)
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
const request = myIndex.getAllRecords("Jane");
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
