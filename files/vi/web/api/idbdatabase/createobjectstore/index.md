---
title: "IDBDatabase: phương thức createObjectStore()"
short-title: createObjectStore()
slug: Web/API/IDBDatabase/createObjectStore
page-type: web-api-instance-method
browser-compat: api.IDBDatabase.createObjectStore
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`createObjectStore()`** của giao diện {{domxref("IDBDatabase")}} tạo và trả về một {{domxref("IDBObjectStore")}} mới.

Phương thức này nhận tên của store cùng với một đối tượng tham số cho phép bạn xác định các thuộc tính tùy chọn quan trọng. Bạn có thể dùng thuộc tính này để định danh duy nhất từng object riêng lẻ trong store. Vì thuộc tính này là một định danh, nó nên là duy nhất cho mỗi object, và mỗi object nên có thuộc tính đó.

Phương thức này _chỉ_ có thể được gọi trong một transaction [`versionchange`](/en-US/docs/Web/API/IDBDatabase/versionchange_event).

## Cú pháp

```js-nolint
createObjectStore(name)
createObjectStore(name, options)
```

### Tham số

- `name`
  - : Tên của object store mới sẽ được tạo. Lưu ý rằng có thể tạo object store với tên rỗng.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn mà các thuộc tính của nó là tham số tùy chọn của phương thức. Nó bao gồm các thuộc tính sau:
    - `keyPath` {{optional_inline}}
      - : [Key path](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) sẽ được dùng bởi object store mới. Nếu rỗng hoặc không được chỉ định, object store sẽ được tạo mà không có key path và sẽ dùng [out-of-line keys](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#out-of-line_key). Bạn cũng có thể truyền một mảng làm `keyPath`.
    - `autoIncrement` {{optional_inline}}
      - : Nếu `true`, object store có một [key generator](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_generator). Mặc định là <code>false</code>.

### Giá trị trả về

Một {{domxref("IDBObjectStore")}} mới.

### Ngoại lệ

Phương thức này có thể ném một {{domxref("DOMException")}} với `name` là một trong các loại sau:

- `ConstraintError` {{domxref("DOMException")}}
  - : Được ném ra nếu một object store với tên đã cho (dựa trên so sánh phân biệt hoa thường) đã tồn tại trong cơ sở dữ liệu đang kết nối.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu `autoIncrement` được đặt là true và `keyPath` là chuỗi rỗng hoặc một mảng.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức không được gọi từ callback của transaction `versionchange`.
- `SyntaxError`
  - : Được ném ra nếu tùy chọn `keyPath` chứa một key path không hợp lệ.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném ra nếu một request được thực hiện trên cơ sở dữ liệu nguồn không tồn tại, ví dụ khi cơ sở dữ liệu đã bị xóa hoặc gỡ bỏ, hoặc nếu transaction nâng cấp liên quan đã hoàn tất hoặc đang xử lý một request.

## Ví dụ

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const request = window.indexedDB.open("toDoList", 4);

// Trình xử lý này được gọi khi một phiên bản mới của cơ sở dữ liệu
// được tạo, hoặc chưa từng được tạo trước đó
// hoặc khi một số phiên bản mới được gửi vào bằng cách gọi
// window.indexedDB.open().
// Trình xử lý này chỉ được hỗ trợ trong các trình duyệt gần đây.
request.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Lỗi khi tải cơ sở dữ liệu.";
  };

  // Tạo objectStore cho cơ sở dữ liệu này

  const objectStore = db.createObjectStore("toDoList", {
    keyPath: "taskTitle",
  });

  // xác định những mục dữ liệu mà objectStore sẽ chứa

  objectStore.createIndex("hours", "hours", { unique: false });
  objectStore.createIndex("minutes", "minutes", { unique: false });
  objectStore.createIndex("day", "day", { unique: false });
  objectStore.createIndex("month", "month", { unique: false });
  objectStore.createIndex("year", "year", { unique: false });

  objectStore.createIndex("notified", "notified", { unique: false });

  note.appendChild(document.createElement("li")).textContent =
    "Object store đã được tạo.";
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một dải khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
