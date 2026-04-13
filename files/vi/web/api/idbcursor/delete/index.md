---
title: "IDBCursor: phương thức delete()"
short-title: delete()
slug: Web/API/IDBCursor/delete
page-type: web-api-instance-method
browser-compat: api.IDBCursor.delete
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("IDBCursor")}} trả về một đối tượng {{domxref("IDBRequest")}} và, trên một luồng riêng, xóa bản ghi tại vị trí của con trỏ mà không thay đổi vị trí đó. Khi bản ghi đã bị xóa, giá trị của con trỏ được đặt thành `null`.

Lưu ý rằng bạn không thể gọi `delete()` (hoặc {{domxref("IDBCursor.update()")}}) trên các con trỏ lấy từ {{domxref("IDBIndex.openKeyCursor()")}}. Với nhu cầu như vậy, bạn phải dùng {{domxref("IDBIndex.openCursor()")}} thay thế.

## Cú pháp

```js-nolint
delete()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}, trên đó các sự kiện tiếp theo liên quan đến thao tác này sẽ được phát ra.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request sẽ là `undefined`.

### Ngoại lệ

Phương thức này có thể ném ra một {{domxref("DOMException")}} thuộc một trong các kiểu sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu transaction của IDBCursor này không hoạt động.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném ra nếu chế độ transaction là chỉ đọc.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ được tạo bằng {{domxref("IDBindex.openKeyCursor")}}, đang được duyệt, hoặc đã duyệt quá phần cuối.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua tất cả các bản ghi trong object store. Nếu `albumTitle` của con trỏ hiện tại là `"Grace under pressure"`, chúng ta xóa toàn bộ bản ghi đó bằng `const request = cursor.delete();`.

Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function deleteResult() {
  list.textContent = "";
  const transaction = db.transaction(["rushAlbumList"], "readwrite");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      if (cursor.value.albumTitle === "Grace under pressure") {
        const request = cursor.delete();
        request.onsuccess = () => {
          console.log(
            "Deleted that mediocre album from 1984. Even Power windows is better.",
          );
        };
      } else {
        const listItem = document.createElement("li");
        listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
        list.appendChild(listItem);
      }
      cursor.continue();
    } else {
      console.log("Entries displayed.");
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
