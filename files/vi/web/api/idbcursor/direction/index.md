---
title: "IDBCursor: thuộc tính direction"
short-title: direction
slug: Web/API/IDBCursor/direction
page-type: web-api-instance-property
browser-compat: api.IDBCursor.direction
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`direction`** của giao diện {{domxref("IDBCursor")}} là một chuỗi trả về hướng duyệt của con trỏ (ví dụ được đặt bằng {{domxref("IDBObjectStore.openCursor")}}). Xem phần [Giá trị](#value) bên dưới để biết các giá trị có thể có.

## Giá trị

Một chuỗi biểu thị hướng mà con trỏ đang duyệt dữ liệu. Các giá trị có thể là:

- `next`
  - : Con trỏ được mở ở đầu nguồn.
- `nextunique`
  - : Con trỏ được mở ở đầu nguồn.
    Với mỗi khóa có giá trị trùng, chỉ bản ghi gần đầu nguồn nhất được trả về.
- `prev`
  - : Con trỏ được mở ở cuối nguồn.
- `prevunique`
  - : Con trỏ được mở ở cuối nguồn.
    Với mỗi khóa có giá trị trùng, chỉ bản ghi gần đầu nguồn nhất được trả về.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua tất cả các bản ghi trong object store. Ở mỗi vòng lặp, chúng ta ghi hướng của con trỏ vào console.

> [!NOTE]
> Chúng ta không thể thay đổi hướng di chuyển của con trỏ bằng thuộc tính `direction`, vì nó là chỉ đọc. Ta chỉ định hướng di chuyển bằng đối số thứ hai của {{domxref("IDBObjectStore.openCursor")}}.

Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function backwards() {
  list.textContent = "";
  const transaction = db.transaction(["rushAlbumList"], "readonly");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor(null, "prev").onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);

      console.log(cursor.direction);
      cursor.continue();
    } else {
      console.log("Entries displayed backwards.");
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
