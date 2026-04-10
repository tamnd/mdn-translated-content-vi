---
title: IDBIndex.keyPath
slug: Web/API/IDBIndex/keyPath
page-type: web-api-instance-property
browser-compat: api.IDBIndex.keyPath
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`keyPath`** của giao diện `IDBIndex` trả về [đường dẫn khóa](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) của index này. Nếu là `null`, index này không được tự động điền.

## Giá trị

Một giá trị `DOMString`, `DOMString[]` hoặc `null`.

## Ví dụ

```js
console.log(myIndex.keyPath);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
