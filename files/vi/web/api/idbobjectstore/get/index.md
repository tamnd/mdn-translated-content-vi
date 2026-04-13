---
title: "IDBObjectStore: phương thức get()"
short-title: get()
slug: Web/API/IDBObjectStore/get
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.get
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, trả về đối tượng được chọn theo khóa được chỉ định. Phương thức này dùng để truy xuất các bản ghi cụ thể từ một object store.

Nếu một giá trị được tìm thấy thành công, thì một bản sao có cấu trúc của nó được tạo và đặt làm [`result`](/vi/docs/Web/API/IDBRequest/result) của đối tượng request.

> [!NOTE]
> Phương thức này tạo ra cùng kết quả cho: a) một bản ghi không tồn tại trong cơ sở dữ liệu và b) một bản ghi có giá trị undefined.
> Để phân biệt các trường hợp này, hãy gọi phương thức `openCursor()` với cùng khóa đó. Phương thức đó cung cấp một con trỏ nếu bản ghi tồn tại, và không có con trỏ nếu nó không tồn tại.

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Khóa hoặc phạm vi khóa xác định bản ghi cần truy xuất.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là giá trị của bản ghi đầu tiên khớp với khóa hoặc phạm vi khóa đã cho.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu khóa hoặc phạm vi khóa được cung cấp chứa một khóa không hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một giao dịch read/write trên cơ sở dữ liệu và lấy một bản ghi cụ thể từ object store bằng `get()` — một bản ghi mẫu có khóa "Walk dog". Khi đối tượng dữ liệu này được truy xuất, bạn có thể cập nhật nó bằng JavaScript thông thường, sau đó đưa nó trở lại cơ sở dữ liệu bằng thao tác {{domxref("IDBObjectStore.put", "put()")}}. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này được sử dụng nhiều ở dưới
  db = DBOpenRequest.result;

  // Chạy hàm getData() để lấy dữ liệu từ cơ sở dữ liệu
  getData();
};

function getData() {
  // mở một giao dịch db read/write, sẵn sàng để truy xuất dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về việc giao dịch hoàn tất thành công
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      `Transaction not opened due to error: ${transaction.error}`;
  };

  // tạo một object store trên giao dịch
  const objectStore = transaction.objectStore("toDoList");

  // Gửi yêu cầu lấy một bản ghi theo khóa từ object store
  const objectStoreRequest = objectStore.get("Walk dog");

  objectStoreRequest.onsuccess = (event) => {
    // báo cáo sự thành công của yêu cầu
    note.appendChild(document.createElement("li")).textContent =
      "Request successful.";

    const myRecord = objectStoreRequest.result;
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
