---
title: IDBIndex.openCursor()
slug: Web/API/IDBIndex/openCursor
page-type: web-api-instance-method
browser-compat: api.IDBIndex.openCursor
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`openCursor()`** của giao diện `IDBIndex` trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một [cursor](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#cursor) trên phạm vi khóa đã chỉ định.

## Cú pháp

```js-nolint
openCursor()
openCursor(query)
openCursor(query, direction)
```

### Tham số

- `query` {{optional_inline}}
  - : Khóa hoặc phạm vi khóa để so khớp.
- `direction` {{optional_inline}}
  - : Hướng di chuyển của cursor.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}.

### Ngoại lệ

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Transaction của đối tượng này đang không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Khóa hoặc phạm vi khóa không hợp lệ.

## Ví dụ

```js
const request = myIndex.openCursor();
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
