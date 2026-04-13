---
title: IDBIndex.count()
slug: Web/API/IDBIndex/count
page-type: web-api-instance-method
browser-compat: api.IDBIndex.count
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`count()`** của giao diện `IDBIndex` trả về số lượng bản ghi trong index phù hợp với khóa hoặc phạm vi khóa đã cho.

## Cú pháp

```js-nolint
count()
count(key)
```

### Tham số

- `key` {{optional_inline}}
  - : Giá trị khóa hoặc một {{domxref("IDBKeyRange")}} để đếm số bản ghi khớp. Nếu bỏ qua, phương thức trả về tổng số bản ghi trong index.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}.

### Ngoại lệ

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Transaction của đối tượng này đang không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Khóa hoặc phạm vi khóa không hợp lệ.

## Ví dụ

```js
const countRequest = myIndex.count();
countRequest.onsuccess = () => {
  console.log(countRequest.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
