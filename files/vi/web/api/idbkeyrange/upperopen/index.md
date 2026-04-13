---
title: "IDBKeyRange: thuộc tính upperOpen"
short-title: upperOpen
slug: Web/API/IDBKeyRange/upperOpen
page-type: web-api-instance-property
browser-compat: api.IDBKeyRange.upperOpen
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`upperOpen`** của giao diện {{domxref("IDBKeyRange")}} trả về một giá trị boolean cho biết giá trị ở giới hạn trên có được bao gồm trong phạm vi khóa hay không.

## Giá trị

Một giá trị boolean:

| Giá trị | Ý nghĩa                                                        |
| ------- | -------------------------------------------------------------- |
| `true`  | Giá trị ở giới hạn trên không được bao gồm trong phạm vi khóa. |
| `false` | Giá trị ở giới hạn trên được bao gồm trong phạm vi khóa.       |

## Ví dụ

Ví dụ sau minh họa cách dùng một phạm vi khóa. Ở đây chúng ta khai báo `keyRangeValue = IDBKeyRange.upperBound("F", "W", true, true);` - một phạm vi bao gồm mọi giá trị nằm giữa `"F"` và `"W"` nhưng không bao gồm chính chúng, vì cả giới hạn trên lẫn dưới đều được khai báo là mở (`true`). Chúng ta mở một transaction (dùng {{domxref("IDBTransaction")}}) và một object store, rồi mở một cursor bằng {{domxref("IDBObjectStore.openCursor")}}, với `keyRangeValue` là giá trị phạm vi khóa tùy chọn.

Sau khi khai báo phạm vi khóa, chúng ta ghi giá trị thuộc tính `upperOpen` của nó ra console; kết quả nên là `"true"`: giới hạn trên là mở nên sẽ không được bao gồm trong phạm vi.

> [!NOTE]
> Để có ví dụ đầy đủ hơn cho phép bạn thử nghiệm phạm vi khóa, hãy xem repo [IDBKeyRange-example](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbkeyrange) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbkeyrange/) nữa.

```js
function displayData() {
  const keyRangeValue = IDBKeyRange.bound("F", "W", true, true);
  console.log(keyRangeValue.upperOpen);

  const transaction = db.transaction(["fThings"], "readonly");
  const objectStore = transaction.objectStore("fThings");
  objectStore.openCursor(keyRangeValue).onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.fThing}, ${cursor.value.fRating}`;
      list.appendChild(listItem);
      cursor.continue();
    } else {
      console.log("Entries all displayed.");
    }
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và sửa đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
