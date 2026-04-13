---
title: IDBObjectStore
slug: Web/API/IDBObjectStore
page-type: web-api-interface
browser-compat: api.IDBObjectStore
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBObjectStore`** của [IndexedDB API](/vi/docs/Web/API/IndexedDB_API) đại diện cho một object store trong cơ sở dữ liệu. Các bản ghi trong một object store được sắp xếp theo khóa của chúng. Việc sắp xếp này cho phép chèn, tra cứu và truy xuất có thứ tự nhanh chóng.

## Thuộc tính instance

- {{domxref("IDBObjectStore.indexNames")}} {{ReadOnlyInline}}
  - : Danh sách tên của các [index](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#index) trên các đối tượng trong object store này.
- {{domxref("IDBObjectStore.keyPath")}} {{ReadOnlyInline}}
  - : [Đường dẫn khóa](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) của object store này. Nếu thuộc tính này là `null`, ứng dụng phải cung cấp khóa cho mỗi thao tác sửa đổi.
- {{domxref("IDBObjectStore.name")}}
  - : Tên của object store này.
- {{domxref("IDBObjectStore.transaction")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("IDBTransaction")}} mà object store này thuộc về.
- {{domxref("IDBObjectStore.autoIncrement")}} {{ReadOnlyInline}}
  - : Giá trị của cờ tự động tăng cho object store này.

## Phương thức instance

- {{domxref("IDBObjectStore.add()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một [bản sao có cấu trúc](https://html.spec.whatwg.org/multipage/common-dom-interfaces.html#structured-clone) của `value`, sau đó lưu giá trị đã sao chép vào object store. Phương thức này dùng để thêm bản ghi mới vào object store.
- {{domxref("IDBObjectStore.clear()")}}
  - : Tạo và trả về ngay lập tức một đối tượng {{domxref("IDBRequest")}}, đồng thời xóa sạch object store này trong một luồng riêng biệt. Phương thức này dùng để xóa tất cả bản ghi hiện có khỏi object store.
- {{domxref("IDBObjectStore.count()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, trả về tổng số bản ghi khớp với khóa hoặc {{domxref("IDBKeyRange")}} được cung cấp. Nếu không cung cấp đối số, nó trả về tổng số bản ghi trong store.
- {{domxref("IDBObjectStore.createIndex()")}}
  - : Tạo một index mới trong quá trình nâng cấp phiên bản, trả về một đối tượng {{domxref("IDBIndex")}} mới trong cơ sở dữ liệu đã kết nối.
- {{domxref("IDBObjectStore.delete()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, xóa đối tượng store được chọn theo khóa chỉ định. Phương thức này dùng để xóa từng bản ghi riêng lẻ khỏi object store.
- {{domxref("IDBObjectStore.deleteIndex()")}}
  - : Hủy index được chỉ định trong cơ sở dữ liệu đã kết nối, được sử dụng trong quá trình nâng cấp phiên bản.
- {{domxref("IDBObjectStore.get()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, trả về đối tượng store được chọn theo khóa chỉ định. Phương thức này dùng để truy xuất các bản ghi cụ thể từ object store.
- {{domxref("IDBObjectStore.getKey()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, truy xuất và trả về khóa bản ghi cho đối tượng trong object store khớp với tham số được chỉ định.
- {{domxref("IDBObjectStore.getAll()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, truy xuất tất cả đối tượng trong object store khớp với tham số được chỉ định hoặc tất cả đối tượng trong store nếu không cung cấp tham số.
- {{domxref("IDBObjectStore.getAllKeys()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, truy xuất khóa bản ghi cho tất cả đối tượng trong object store khớp với tham số được chỉ định hoặc tất cả đối tượng trong store nếu không cung cấp tham số.
- {{domxref("IDBObjectStore.getAllRecords()")}} {{experimental_inline}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm tất cả bản ghi khớp trong object store (bao gồm khóa chính và giá trị) tương ứng với khóa đã cho hoặc nằm trong khoảng, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBObjectStore.index()")}}
  - : Mở một index từ object store này, sau đó có thể sử dụng, ví dụ, để trả về một chuỗi các bản ghi được sắp xếp theo index đó bằng con trỏ.
- {{domxref("IDBObjectStore.openCursor()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, trả về một đối tượng {{domxref("IDBCursorWithValue")}} mới. Được sử dụng để lặp qua một object store theo khóa chính bằng con trỏ.
- {{domxref("IDBObjectStore.openKeyCursor()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, trả về một {{domxref("IDBCursor")}} mới. Được sử dụng để lặp qua một object store bằng khóa.
- {{domxref("IDBObjectStore.put()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một [bản sao có cấu trúc](https://html.spec.whatwg.org/multipage/common-dom-interfaces.html#structured-clone) của `value`, sau đó lưu giá trị đã sao chép vào object store. Phương thức này dùng để cập nhật bản ghi hiện có trong object store khi chế độ của giao dịch là `readwrite`.

## Ví dụ

Ví dụ này minh họa nhiều cách sử dụng khác nhau của object stores, từ việc cập nhật cấu trúc dữ liệu bằng {{domxref("IDBObjectStore.createIndex")}} trong hàm `onupgradeneeded`, đến việc thêm một mục mới vào object store bằng {{domxref("IDBObjectStore.add")}}. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào db.
  db = DBOpenRequest.result;
};

// Sự kiện này xử lý việc cần tạo phiên bản mới của
// cơ sở dữ liệu. Hoặc là chưa từng tạo trước đó, hoặc
// số phiên bản mới đã được gửi qua dòng window.indexedDB.open ở trên
DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Error loading database.";
  };

  // Tạo một objectStore cho cơ sở dữ liệu này

  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định các mục dữ liệu mà objectStore sẽ chứa

  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });

  objectStore.createIndex("notified", "notified", { unique: false });

  note.appendChild(document.createElement("li")).textContent =
    "Object store created.";
};

// Tạo một mục mới để thêm vào object store
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

// Mở một giao dịch db read/write, sẵn sàng để thêm dữ liệu
const transaction = db.transaction(["toDoList"], "readwrite");

// Báo cáo về việc giao dịch hoàn tất thành công
transaction.oncomplete = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Transaction completed.";
};

transaction.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Transaction not opened due to error. Duplicate items not allowed.";
};

// Tạo một object store trên giao dịch
const objectStore = transaction.objectStore("toDoList");
// Gửi yêu cầu thêm đối tượng newItem vào object store
const objectStoreRequest = objectStore.add(newItem[0]);

objectStoreRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Request successful.";
};
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
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
