---
title: "IDBCursorWithValue: thuộc tính value"
short-title: value
slug: Web/API/IDBCursorWithValue/value
page-type: web-api-instance-property
browser-compat: api.IDBCursorWithValue.value
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`value`** của giao diện {{domxref("IDBCursorWithValue")}} trả về giá trị của con trỏ hiện tại, bất kể đó là gì.

## Giá trị

Giá trị của con trỏ hiện tại.

## Ví dụ

Trong ví dụ này, chúng ta tạo một giao dịch, lấy một object store, sau đó sử dụng con trỏ để lặp qua tất cả các bản ghi trong object store. Trong mỗi lần lặp, chúng ta ghi giá trị của con trỏ với `cursor.value`.

Con trỏ không yêu cầu chúng ta chọn dữ liệu dựa trên khóa; chúng ta có thể lấy tất cả. Cũng lưu ý rằng trong mỗi lần lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`.
Để có ví dụ hoạt động đầy đủ, xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor)
([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/).)

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

      console.log(cursor.value);
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

- [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Đặt phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
