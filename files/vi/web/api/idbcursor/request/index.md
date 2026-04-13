---
title: "IDBCursor: thuộc tính request"
short-title: request
slug: Web/API/IDBCursor/request
page-type: web-api-instance-property
browser-compat: api.IDBCursor.request
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`request`** của giao diện {{domxref("IDBCursor")}} trả về {{domxref("IDBRequest")}} đã được dùng để lấy con trỏ.

## Giá trị

Một thể hiện đối tượng {{domxref("IDBRequest")}}.

## Ví dụ

Khi bạn mở một con trỏ, thuộc tính `request` sẽ có sẵn trên đối tượng con trỏ đó, để cho bạn biết con trỏ này bắt nguồn từ request nào. Ví dụ:

```js
function displayData() {
  list.textContent = "";
  const transaction = db.transaction(["rushAlbumList"], "readonly");
  const objectStore = transaction.objectStore("rushAlbumList");

  const request = objectStore.openCursor();

  request.onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);
      console.log(cursor.request);
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

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Sử dụng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Tham chiếu ví dụ: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
