---
title: "IDBObjectStore: phương thức createIndex()"
short-title: createIndex()
slug: Web/API/IDBObjectStore/createIndex
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.createIndex
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`createIndex()`** của giao diện {{domxref("IDBObjectStore")}} tạo và trả về một đối tượng {{domxref("IDBIndex")}} mới trong cơ sở dữ liệu đã kết nối. Phương thức này tạo một trường/cột mới xác định một điểm dữ liệu mới mà mỗi bản ghi cơ sở dữ liệu sẽ chứa.

Lưu ý rằng các index của IndexedDB có thể chứa _bất kỳ_ kiểu dữ liệu JavaScript nào; IndexedDB sử dụng [thuật toán sao chép có cấu trúc](/vi/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) để tuần tự hóa các đối tượng được lưu trữ, cho phép lưu trữ các đối tượng đơn giản và phức tạp.

Lưu ý rằng phương thức này chỉ được gọi từ callback của chế độ giao dịch `VersionChange`.

## Cú pháp

```js-nolint
createIndex(indexName, keyPath)
createIndex(indexName, keyPath, options)
```

### Tham số

- `indexName`
  - : Tên của index cần tạo. Lưu ý rằng có thể tạo một index với tên rỗng.
- `keyPath`
  - : Đường dẫn khóa cho index sẽ sử dụng. Lưu ý rằng có thể tạo một index với `keyPath` rỗng, và cũng có thể truyền vào một chuỗi (mảng) làm `keyPath`.
- `options` {{optional_inline}}
  - : Một đối tượng có thể bao gồm các thuộc tính sau:
    - `unique`
      - : Nếu là `true`, index sẽ không cho phép các giá trị trùng lặp cho một khóa duy nhất. Mặc định là `false`.
    - `multiEntry`
      - : Nếu là `true`, index sẽ thêm một mục vào index cho mỗi phần tử mảng khi `keyPath` phân giải thành một mảng.
        Nếu là `false`, nó sẽ thêm một mục duy nhất chứa mảng đó. Mặc định là `false`.
    - `locale` {{non-standard_inline}} {{deprecated_inline}}
      - : Cho phép bạn chỉ định một locale cho index.
        Mọi thao tác sắp xếp được thực hiện trên dữ liệu thông qua các phạm vi khóa sẽ tuân theo quy tắc sắp xếp của locale đó.
        Bạn có thể chỉ định giá trị của nó theo một trong ba cách:
        - `string`: Một chuỗi chứa mã locale cụ thể, ví dụ: `en-US`, hoặc `pl`.
        - `auto`: Locale mặc định của nền tảng sẽ được sử dụng (có thể bị thay đổi bởi cài đặt user agent).
        - `null` hoặc `undefined`: Nếu không chỉ định locale, sắp xếp JavaScript thông thường sẽ được sử dụng — không nhận biết locale.

### Giá trị trả về

Một đối tượng {{domxref("IDBIndex")}}: index mới được tạo.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `ConstraintError` {{domxref("DOMException")}}
  - : Được ném nếu một index có cùng tên đã tồn tại trong cơ sở dữ liệu. Tên index có phân biệt hoa thường.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném nếu đường dẫn khóa được cung cấp là một chuỗi, và `multiEntry` được đặt thành `true` trong đối tượng `objectParameters`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - Phương thức không được gọi từ callback của chế độ giao dịch `versionchange`, tức là từ bên trong trình xử lý {{domxref("IDBOpenDBRequest.upgradeneeded_event", "onupgradeneeded")}}.
    - Object store đã bị xóa.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném nếu `keyPath` được cung cấp không phải là một [đường dẫn khóa hợp lệ](https://w3c.github.io/IndexedDB/#valid-key-path).
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch mà {{domxref("IDBObjectStore")}} này thuộc về không hoạt động (ví dụ: đã bị xóa hoặc loại bỏ.) Trong Firefox trước phiên bản 41, một `InvalidStateError` đã được ném trong trường hợp này, gây hiểu lầm; vấn đề này đã được sửa (xem [Firefox bug 1176165](https://bugzil.la/1176165).)

## Ví dụ

Trong ví dụ sau, bạn có thể thấy trình xử lý {{domxref("IDBOpenDBRequest.upgradeneeded_event", "onupgradeneeded")}} được sử dụng để cập nhật cấu trúc cơ sở dữ liệu nếu một cơ sở dữ liệu với số phiên bản cao hơn được tải. `createIndex()` được sử dụng để tạo các index mới trên object store. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
let db;

// Mở cơ sở dữ liệu
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// Hai trình xử lý sự kiện cho việc mở cơ sở dữ liệu.
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // Lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này được sử dụng nhiều ở dưới.
  db = request.result;

  // Chạy hàm displayData() để điền danh sách tác vụ với
  // tất cả dữ liệu danh sách việc cần làm đã có trong IDB
  displayData();
};

// Trình xử lý này được kích hoạt khi một cơ sở dữ liệu mới được tạo và cho biết
// rằng chưa từng tạo trước đó, hoặc một phiên bản mới
// đã được gửi với window.indexedDB.open(). (Xem ở trên.)
// Nó chỉ được triển khai trong các trình duyệt gần đây.
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
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng con trỏ: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
