---
title: IDBIndex.openKeyCursor()
slug: Web/API/IDBIndex/openKeyCursor
page-type: web-api-instance-method
browser-compat: api.IDBIndex.openKeyCursor
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`openKeyCursor()`** của giao diện `IDBIndex` trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một cursor trên phạm vi khóa đã chỉ định, được sắp xếp theo index này.

## Cú pháp

```js-nolint
openKeyCursor()
openKeyCursor(query)
openKeyCursor(query, direction)
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
const request = myIndex.openKeyCursor();
request.onsuccess = () => {
  console.log(request.result);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
