---
title: "IDBCursor: phương thức continue()"
short-title: continue()
slug: Web/API/IDBCursor/continue
page-type: web-api-instance-method
browser-compat: api.IDBCursor.continue
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`continue()`** của giao diện {{domxref("IDBCursor")}} đưa con trỏ đến vị trí tiếp theo theo hướng của nó, tới mục có khóa khớp với tham số khóa tùy chọn. Nếu không chỉ định khóa, con trỏ sẽ chuyển đến vị trí tiếp theo ngay lập tức theo hướng hiện tại của nó.

## Cú pháp

```js-nolint
continue()
continue(key)
```

### Tham số

- `key` {{optional_inline}}
  - : Khóa để đặt vị trí con trỏ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Phương thức này có thể ném ra một {{domxref("DOMException")}} thuộc một trong các kiểu sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu transaction của `IDBCursor` này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số khóa có bất kỳ điều kiện nào sau đây:
    - Khóa không phải là một khóa hợp lệ.
    - Khóa nhỏ hơn hoặc bằng vị trí hiện tại của con trỏ, và hướng của con trỏ là `next` hoặc `nextunique`.
    - Khóa lớn hơn hoặc bằng vị trí hiện tại của con trỏ, và hướng của con trỏ là `prev` hoặc `prevunique`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ đang được duyệt hoặc đã duyệt quá phần cuối.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua tất cả các bản ghi trong object store. Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

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
