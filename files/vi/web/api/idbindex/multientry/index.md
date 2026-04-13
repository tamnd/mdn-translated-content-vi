---
title: IDBIndex.multiEntry
slug: Web/API/IDBIndex/multiEntry
page-type: web-api-instance-property
browser-compat: api.IDBIndex.multiEntry
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`multiEntry`** của giao diện `IDBIndex` cho biết index có được tạo với tùy chọn `multiEntry` hay không. Thuộc tính này ảnh hưởng đến cách index hoạt động khi kết quả đánh giá key path của index là một mảng.

## Giá trị

`true` nếu index là `multiEntry`; ngược lại là `false`.

## Ví dụ

```js
console.log(myIndex.multiEntry);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
