---
title: "IDBObjectStore: phương thức add()"
short-title: add()
slug: Web/API/IDBObjectStore/add
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.add
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`add()`** của giao diện {{domxref("IDBObjectStore")}} trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, tạo một [bản sao có cấu trúc](https://html.spec.whatwg.org/multipage/common-dom-interfaces.html#structured-clone) của giá trị, sau đó lưu giá trị đã sao chép vào object store. Phương thức này dùng để thêm bản ghi mới vào object store.

Để xác định xem thao tác thêm đã hoàn tất thành công hay chưa, hãy lắng nghe sự kiện `complete` của giao dịch bên cạnh sự kiện `success` của yêu cầu `IDBObjectStore.add`, vì giao dịch vẫn có thể thất bại sau khi sự kiện success được kích hoạt. Nói cách khác, sự kiện success chỉ được kích hoạt khi giao dịch đã được xếp hàng thành công.

Phương thức add là phương thức _chỉ chèn_. Nếu một bản ghi đã tồn tại trong object store với tham số `key` làm khóa của nó, thì một lỗi `ConstraintError` sẽ được kích hoạt trên đối tượng request được trả về. Để cập nhật các bản ghi hiện có, bạn nên sử dụng phương thức {{domxref("IDBObjectStore.put")}} thay thế.

## Cú pháp

```js-nolint
add(value)
add(value, key)
```

### Tham số

- `value`
  - : Giá trị cần lưu trữ.
- `key` {{optional_inline}}
  - : Khóa dùng để xác định bản ghi. Nếu không được chỉ định, kết quả sẽ là null.

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là khóa của bản ghi mới.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch liên quan đến thao tác này đang ở [chế độ](/vi/docs/Web/API/IDBTransaction#mode_constants) chỉ đọc.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu bất kỳ điều kiện nào sau đây áp dụng:
    - Object store sử dụng khóa nội tuyến hoặc có bộ tạo khóa, và tham số key đã được cung cấp.
    - Object store sử dụng khóa ngoại tuyến và không có bộ tạo khóa, và không có tham số key nào được cung cấp.
    - Object store sử dụng khóa nội tuyến nhưng không có bộ tạo khóa, và đường dẫn khóa của object store không tạo ra một khóa hợp lệ.
    - Tham số key đã được cung cấp nhưng không chứa một khóa hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném nếu dữ liệu đang được lưu trữ không thể được sao chép bởi thuật toán sao chép có cấu trúc nội bộ.
- `ConstraintError` {{domxref("DOMException")}}
  - : Được ném nếu thao tác chèn thất bại do vi phạm ràng buộc khóa chính (do đã tồn tại bản ghi có cùng giá trị khóa chính).

## Ví dụ

Trong đoạn mã sau, chúng ta mở một giao dịch read/write trên cơ sở dữ liệu và thêm một số dữ liệu vào object store bằng `add()`. Lưu ý các hàm được gắn vào các trình xử lý sự kiện giao dịch để báo cáo kết quả của việc mở giao dịch trong trường hợp thành công hoặc thất bại. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này được sử dụng nhiều ở dưới
  db = DBOpenRequest.result;

  // Chạy hàm addData() để thêm dữ liệu vào cơ sở dữ liệu
  addData();
};

function addData() {
  // Tạo một đối tượng mới sẵn sàng chèn vào IDB
  const newItem = [
    {
      taskTitle: "Walk dog",
      hours: 19,
      minutes: 30,
      day: 24,
      month: "December",
      year: 2013,
      notified: "no",
    },
  ];

  // mở một giao dịch db read/write, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về việc giao dịch hoàn tất thành công
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction not opened due to error. Duplicate items not allowed.";
  };

  // tạo một object store trên giao dịch
  const objectStore = transaction.objectStore("toDoList");

  // Gửi yêu cầu thêm đối tượng newItem vào object store
  const objectStoreRequest = objectStore.add(newItem[0]);

  objectStoreRequest.onsuccess = (event) => {
    // báo cáo sự thành công của yêu cầu
    note.appendChild(document.createElement("li")).textContent =
      "Request successful.";
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
