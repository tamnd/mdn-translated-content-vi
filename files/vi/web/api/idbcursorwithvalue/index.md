---
title: IDBCursorWithValue
slug: Web/API/IDBCursorWithValue
page-type: web-api-interface
browser-compat: api.IDBCursorWithValue
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBCursorWithValue`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) đại diện cho một [con trỏ](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#cursor) để duyệt hoặc lặp qua nhiều bản ghi trong cơ sở dữ liệu. Nó giống với {{domxref("IDBCursor")}}, ngoại trừ việc nó bao gồm thuộc tính `value`.

Con trỏ có một nguồn cho biết nó đang lặp qua index hoặc object store nào. Nó có một vị trí trong phạm vi và di chuyển theo hướng tăng dần hoặc giảm dần theo thứ tự của các khóa bản ghi. Con trỏ cho phép ứng dụng xử lý tất cả các bản ghi trong phạm vi của con trỏ một cách bất đồng bộ.

Bạn có thể có số lượng con trỏ không giới hạn cùng một lúc. Bạn luôn lấy cùng một đối tượng `IDBCursorWithValue` đại diện cho một con trỏ nhất định. Các thao tác được thực hiện trên index hoặc object store bên dưới.

{{InheritanceDiagram}}

## Phương thức phiên bản

Kế thừa các phương thức từ giao diện cha, {{domxref("IDBCursor")}}.

## Thuộc tính phiên bản

Kế thừa các thuộc tính từ giao diện cha, {{domxref("IDBCursor")}}.

- {{domxref("IDBCursorWithValue.value")}} {{ReadOnlyInline}}
  - : Trả về giá trị của con trỏ hiện tại.

## Ví dụ

Trong ví dụ này, chúng ta tạo một giao dịch, lấy một object store, sau đó sử dụng con trỏ để lặp qua tất cả các bản ghi trong object store. Con trỏ không yêu cầu chúng ta chọn dữ liệu dựa trên khóa; chúng ta có thể lấy tất cả. Cũng lưu ý rằng trong mỗi lần lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng cách dùng `cursor.value.foo`. Để có ví dụ hoạt động đầy đủ, xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/).)

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

- [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Đặt phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
