---
title: "IDBCursor: phương thức advance()"
short-title: advance()
slug: Web/API/IDBCursor/advance
page-type: web-api-instance-method
browser-compat: api.IDBCursor.advance
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`advance()`** của giao diện {{domxref("IDBCursor")}} thiết lập số lần mà con trỏ sẽ di chuyển vị trí của nó về phía trước.

## Cú pháp

```js-nolint
advance(count)
```

### Tham số

- `count`
  - : Số lần di chuyển con trỏ về phía trước.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Phương thức này có thể ném ra một {{domxref("DOMException")}} thuộc một trong các kiểu sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu transaction của `IDBCursor` này không hoạt động.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu giá trị truyền vào tham số `count` là 0 hoặc là số âm.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ đang được duyệt hoặc đã duyệt quá phần cuối.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua các bản ghi trong object store. Ở đây chúng ta dùng `cursor.advance(2)` để nhảy tiến 2 vị trí mỗi lần, nghĩa là chỉ hiển thị mỗi bản ghi cách nhau một mục. `advance()` hoạt động tương tự như {{domxref("IDBCursor.continue")}}, ngoại trừ việc nó cho phép nhảy qua nhiều bản ghi cùng lúc, không chỉ luôn sang bản ghi kế tiếp.

Lưu ý rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function advanceResult() {
  list.textContent = "";
  const transaction = db.transaction(["rushAlbumList"], "readonly");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);
      cursor.advance(2);
    } else {
      console.log("Every other entry displayed.");
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
