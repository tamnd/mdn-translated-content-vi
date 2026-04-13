---
title: "IDBCursor: thuộc tính source"
short-title: source
slug: Web/API/IDBCursor/source
page-type: web-api-instance-property
browser-compat: api.IDBCursor.source
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("IDBCursor")}} trả về {{domxref("IDBObjectStore")}} hoặc {{domxref("IDBIndex")}} mà con trỏ đang duyệt. Hàm này không bao giờ trả về `null` hay ném ngoại lệ, ngay cả khi con trỏ đang được duyệt, đã đi quá phần cuối, hoặc transaction của nó không còn hoạt động.

## Giá trị

{{domxref("IDBObjectStore")}} hoặc {{domxref("IDBIndex")}} mà con trỏ đang duyệt.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua các bản ghi trong object store. Ở mỗi vòng lặp, chúng ta ghi nguồn của con trỏ vào console, và điều đó sẽ ghi đối tượng {{domxref("IDBObjectStore")}} của chúng ta ra console.

Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function displayData() {
  const transaction = db.transaction(["rushAlbumList"], "readonly");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);

      console.log(cursor.source);
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
