---
title: IDBDatabase
slug: Web/API/IDBDatabase
page-type: web-api-interface
browser-compat: api.IDBDatabase
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBDatabase`** của IndexedDB API cung cấp một [kết nối tới cơ sở dữ liệu](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#database_connection); bạn có thể dùng một đối tượng `IDBDatabase` để mở một [transaction](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#transaction) trên cơ sở dữ liệu của mình, rồi tạo, thao tác và xóa các object (dữ liệu) trong cơ sở dữ liệu đó. Giao diện này là cách duy nhất để lấy và quản lý các phiên bản của cơ sở dữ liệu.

> [!NOTE]
> Mọi thao tác bạn thực hiện trong IndexedDB luôn diễn ra trong ngữ cảnh của một [transaction](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#transaction), đại diện cho các tương tác với dữ liệu trong cơ sở dữ liệu. Tất cả các đối tượng trong IndexedDB, bao gồm object store, index và cursor, đều gắn với một transaction cụ thể. Vì vậy, bạn không thể thực thi lệnh, truy cập dữ liệu hoặc mở bất cứ thứ gì bên ngoài một transaction.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("IDBDatabase.name")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa tên của cơ sở dữ liệu đang kết nối.
- {{domxref("IDBDatabase.version")}} {{ReadOnlyInline}}
  - : Một số nguyên 64 bit chứa phiên bản của cơ sở dữ liệu đang kết nối. Khi cơ sở dữ liệu mới được tạo, thuộc tính này là một chuỗi rỗng.
- {{domxref("IDBDatabase.objectStoreNames")}} {{ReadOnlyInline}}
  - : Một {{ domxref("DOMStringList") }} chứa danh sách tên của các [object store](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#object_store) hiện có trong cơ sở dữ liệu đang kết nối.

## Phương thức thể hiện

Kế thừa từ: [EventTarget](/en-US/docs/Web/API/EventTarget)

- {{domxref("IDBDatabase.close()")}}
  - : Trả về ngay lập tức và đóng kết nối tới cơ sở dữ liệu trong một luồng riêng.
- {{domxref("IDBDatabase.createObjectStore()")}}
  - : Tạo và trả về một object store hoặc index mới.
- {{domxref("IDBDatabase.deleteObjectStore()")}}
  - : Xóa object store có tên đã cho trong cơ sở dữ liệu đang kết nối, cùng với mọi index tham chiếu đến nó.
- {{domxref("IDBDatabase.transaction()")}}
  - : Trả về ngay một transaction object ({{domxref("IDBTransaction")}}) chứa phương thức {{domxref("IDBTransaction.objectStore")}}, mà bạn có thể dùng để truy cập object store của mình. Nó chạy trong một luồng riêng.

## Sự kiện

Nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán một thuộc tính trình nghe sự kiện vào dạng `oneventname` của giao diện này.

- [`close`](/en-US/docs/Web/API/IDBDatabase/close_event)
  - : Sự kiện được kích hoạt khi kết nối cơ sở dữ liệu bị đóng một cách bất ngờ.

- [`versionchange`](/en-US/docs/Web/API/IDBDatabase/versionchange_event)
  - : Sự kiện được kích hoạt khi có yêu cầu thay đổi cấu trúc cơ sở dữ liệu.

Các sự kiện sau khả dụng với `IDBDatabase` thông qua event bubbling từ {{domxref("IDBTransaction")}}:

- `IDBTransaction` [`abort`](/en-US/docs/Web/API/IDBTransaction/abort_event)
  - : Sự kiện được kích hoạt khi một transaction bị hủy.
- `IDBTransaction` [`error`](/en-US/docs/Web/API/IDBTransaction/error_event)
  - : Sự kiện được kích hoạt khi một request trả về lỗi và sự kiện nổi bọt lên đối tượng kết nối.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một cơ sở dữ liệu bất đồng bộ ({{domxref("IDBFactory")}}), xử lý các trường hợp thành công và lỗi, và tạo một object store mới trong trường hợp cần nâng cấp (`IDBDatabase`). Để xem ví dụ hoàn chỉnh đang hoạt động, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này hoạt động trên đối tượng IDBDatabase
// khi cơ sở dữ liệu được mở thành công hoặc không thành công
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Lỗi khi tải cơ sở dữ liệu.";
};

DBOpenRequest.onsuccess = (event) => {
  node.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Chạy hàm displayData() để điền danh sách tác vụ
  // với toàn bộ dữ liệu to-do đã có trong IDB
  displayData();
};

// Sự kiện này xử lý tình huống khi cần tạo một phiên bản mới
// của cơ sở dữ liệu. Điều này xảy ra khi chưa từng có phiên bản nào
// được tạo trước đó, hoặc khi một số phiên bản mới được gửi vào qua
// dòng window.indexedDB.open ở trên

DBOpenRequest.onupgradeneeded = (event) => {
  const db = event.target.result;

  db.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Lỗi khi tải cơ sở dữ liệu.";
  };

  // Tạo objectStore cho cơ sở dữ liệu này bằng
  // IDBDatabase.createObjectStore

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

Dòng tiếp theo mở một transaction trên cơ sở dữ liệu, rồi mở một object store mà chúng ta có thể thao tác dữ liệu bên trong.

```js
const objectStore = db
  .transaction("toDoList", "readwrite")
  .objectStore("toDoList");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Dùng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một dải khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
