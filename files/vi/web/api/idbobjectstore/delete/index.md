---
title: "IDBObjectStore: phương thức delete()"
short-title: delete()
slug: Web/API/IDBObjectStore/delete
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.delete
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, xóa (các) bản ghi được chỉ định.

Có thể truyền vào một khóa hoặc một {{domxref("IDBKeyRange")}}, cho phép xóa một hoặc nhiều bản ghi từ một store. Để xóa tất cả bản ghi trong một store, hãy sử dụng {{domxref("IDBObjectStore.clear")}}.

Lưu ý rằng nếu bạn đang sử dụng một {{domxref("IDBCursor", "IDBCursor")}}, bạn có thể sử dụng phương thức {{domxref("IDBCursor.delete()")}} để xóa bản ghi hiện tại hiệu quả hơn — mà không cần phải tra cứu rõ ràng khóa của bản ghi.

## Cú pháp

```js-nolint
delete(key)
```

### Tham số

- `key`
  - : Khóa của bản ghi cần xóa, hoặc một {{domxref("IDBKeyRange")}} để xóa tất cả bản ghi có khóa nằm trong khoảng.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là `undefined`.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc các loại sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của object store này không hoạt động.
- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném nếu chế độ giao dịch của object store là chỉ đọc.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu object store đã bị xóa.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu `key` không phải là một [khóa hợp lệ](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#key) hoặc một [phạm vi khóa](/vi/docs/Web/API/IDBKeyRange).

## Ví dụ

Đoạn mã sau minh họa hàm `deleteItem()`, là một phần của ứng dụng ví dụ To-do Notifications. Ứng dụng này lưu trữ các mục danh sách việc cần làm bằng IndexedDB. Bạn có thể [xem toàn bộ mã của ứng dụng trên GitHub](https://github.com/mdn/dom-examples/tree/main/to-do-notifications), và [thử chạy ứng dụng trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/).

Hàm `deleteItem()` được gọi khi người dùng nhấp vào nút để xóa một mục trong danh sách việc cần làm. Khóa của mục được đặt trong thuộc tính dữ liệu `'data-task'` của nút, vì vậy hàm biết cần xóa mục nào. Hàm mở một giao dịch cơ sở dữ liệu để xóa mục, cung cấp khóa của nó. Khi giao dịch hoàn tất, hàm cập nhật giao diện ứng dụng để báo cáo rằng mục đã được xóa.

Lưu ý rằng trong hàm này `db` là một biến toàn cục tham chiếu đến một đối tượng {{domxref("IDBDatabase")}} được khởi tạo khi ứng dụng tải.

```js
function deleteItem(event) {
  // lấy tên của tác vụ chúng ta muốn xóa
  let dataTask = event.target.getAttribute("data-task");

  // mở một giao dịch cơ sở dữ liệu và xóa tác vụ, tìm nó theo tên chúng ta đã lấy ở trên
  let transaction = db.transaction(["toDoList"], "readwrite");
  let request = transaction.objectStore("toDoList").delete(dataTask);

  // báo cáo rằng mục dữ liệu đã được xóa
  transaction.oncomplete = () => {
    // xóa phần tử cha của nút, tức là mục danh sách, để nó không còn được hiển thị
    event.target.parentNode.parentNode.removeChild(event.target.parentNode);
    note.appendChild(document.createElement("li")).textContent =
      `Task "${dataTask}" deleted.`;
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
