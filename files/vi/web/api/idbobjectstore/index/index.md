---
title: "IDBObjectStore: phương thức index()"
short-title: index()
slug: Web/API/IDBObjectStore/index
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.index
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`index()`** của giao diện {{domxref("IDBObjectStore")}} mở một index có tên trong object store hiện tại, sau đó có thể sử dụng để, ví dụ, trả về một chuỗi các bản ghi được sắp xếp theo index đó bằng con trỏ.

## Cú pháp

```js-nolint
index(name)
```

### Tham số

- `name`
  - : Tên của index cần mở.

### Giá trị trả về

Một đối tượng {{domxref("IDBIndex")}} để truy cập index.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu object store nguồn đã bị xóa, hoặc giao dịch cho object store đã kết thúc.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không có index nào có tên trùng khớp (có phân biệt hoa thường) trong cơ sở dữ liệu.

## Ví dụ

Trong ví dụ sau, chúng ta mở một giao dịch và một object store, sau đó lấy index `lName` từ một cơ sở dữ liệu contacts đơn giản. Sau đó, chúng ta mở một con trỏ cơ bản trên index bằng {{domxref("IDBIndex.openCursor")}} — thao tác này hoạt động tương tự như mở một con trỏ trực tiếp trên một `ObjectStore` bằng {{domxref("IDBObjectStore.openCursor")}} ngoại trừ việc các bản ghi được trả về được sắp xếp dựa trên index, không phải khóa chính.

Cuối cùng, chúng ta lặp qua từng bản ghi và chèn dữ liệu vào một bảng HTML. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo [ví dụ IDBIndex trong kho demo indexeddb-examples](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbindex) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbindex/).)

```js
function displayDataByIndex() {
  tableEntry.textContent = "";
  const transaction = db.transaction(["contactsList"], "readonly");
  const objectStore = transaction.objectStore("contactsList");

  const myIndex = objectStore.index("lName");
  myIndex.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const tableRow = document.createElement("tr");
      for (const cell of [
        cursor.value.id,
        cursor.value.lName,
        cursor.value.fName,
        cursor.value.jTitle,
        cursor.value.company,
        cursor.value.eMail,
        cursor.value.phone,
        cursor.value.age,
      ]) {
        const tableCell = document.createElement("td");
        tableCell.textContent = cell;
        tableRow.appendChild(tableCell);
      }
      tableEntry.appendChild(tableRow);

      cursor.continue();
    } else {
      console.log("Entries all displayed.");
    }
  };
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/vi/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu giao dịch: {{domxref("IDBDatabase")}}
- Sử dụng giao dịch: {{domxref("IDBTransaction")}}
- Thiết lập phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
