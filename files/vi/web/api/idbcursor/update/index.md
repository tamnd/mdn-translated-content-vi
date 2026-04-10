---
title: "IDBCursor: phương thức update()"
short-title: update()
slug: Web/API/IDBCursor/update
page-type: web-api-instance-method
browser-compat: api.IDBCursor.update
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`update()`** của giao diện {{domxref("IDBCursor")}} trả về một đối tượng {{domxref("IDBRequest")}} và, trên một luồng riêng, cập nhật giá trị tại vị trí hiện tại của con trỏ trong object store. Nếu con trỏ đang trỏ tới một bản ghi vừa bị xóa, một bản ghi mới sẽ được tạo.

Lưu ý rằng bạn không thể gọi `update()` (hoặc {{domxref("IDBCursor.delete()")}}) trên các con trỏ lấy từ {{domxref("IDBIndex.openKeyCursor()")}}. Với nhu cầu như vậy, bạn phải dùng {{domxref("IDBIndex.openCursor()")}} thay thế.

## Cú pháp

```js-nolint
update(value)
```

### Tham số

- `value`
  - : Giá trị mới sẽ được lưu tại vị trí hiện tại.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}}, trên đó các sự kiện tiếp theo liên quan đến thao tác này sẽ được phát ra.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request sẽ là khóa của bản ghi đã được cập nhật.

### Ngoại lệ

Phương thức này có thể ném ra một {{domxref("DOMException")}} thuộc một trong các kiểu sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu transaction của IDBCursor này không hoạt động.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném ra nếu chế độ transaction là chỉ đọc.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu con trỏ được tạo bằng {{domxref("IDBindex.openKeyCursor")}}, đang được duyệt, hoặc đã duyệt quá phần cuối.
- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu object store bên dưới dùng khóa nội tuyến và thuộc tính trong giá trị tại key path của object store không khớp với khóa ở vị trí hiện tại của con trỏ này.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu dữ liệu đang được lưu không thể được sao chép bởi thuật toán structured cloning nội bộ.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua các bản ghi trong object store. Nếu `albumTitle` của con trỏ hiện tại là `"A farewell to kings"`, chúng ta cập nhật năm phát hành của album bằng `const request = cursor.update();`.

Lưu ý rằng bạn không thể thay đổi khóa chính bằng `cursor.update()`, vì vậy chúng ta không đổi tiêu đề album; điều đó sẽ làm hỏng tính toàn vẹn của dữ liệu. Trong trường hợp đó, bạn phải xóa toàn bộ bản ghi rồi thêm một bản ghi mới bằng {{domxref("IDBObjectStore.add")}}. Cũng lưu ý rằng bạn không thể đưa trực tiếp `cursor.value` vào lời gọi update, vì vậy ví dụ dưới đây dùng biến trung gian `updateData`.

Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function updateResult() {
  list.textContent = "";
  const transaction = db.transaction(["rushAlbumList"], "readwrite");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      if (cursor.value.albumTitle === "A farewell to kings") {
        const updateData = cursor.value;

        updateData.year = 2050;
        const request = cursor.update(updateData);
        request.onsuccess = () => {
          console.log("A better album year?");
        };
      }

      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);
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
