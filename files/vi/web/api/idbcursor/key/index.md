---
title: "IDBCursor: thuộc tính key"
short-title: key
slug: Web/API/IDBCursor/key
page-type: web-api-instance-property
browser-compat: api.IDBCursor.key
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`key`** của giao diện {{domxref("IDBCursor")}} trả về khóa của bản ghi tại vị trí của con trỏ. Nếu con trỏ nằm ngoài phạm vi, giá trị này được đặt là `undefined`. Khóa của con trỏ có thể là bất kỳ kiểu dữ liệu nào.

## Giá trị

Một giá trị thuộc bất kỳ kiểu nào.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ đang được di chuyển hoặc đã kết thúc.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua các bản ghi trong object store. Ở mỗi vòng lặp, chúng ta ghi khóa của con trỏ vào console.

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

      console.log(cursor.key);
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
