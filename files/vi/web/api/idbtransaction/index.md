---
title: IDBTransaction
slug: Web/API/IDBTransaction
page-type: web-api-interface
browser-compat: api.IDBTransaction
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBTransaction`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) cung cấp một transaction bất đồng bộ, tĩnh trên cơ sở dữ liệu bằng các thuộc tính trình xử lý sự kiện. Mọi thao tác đọc và ghi dữ liệu đều được thực hiện trong transaction. Bạn dùng {{domxref("IDBDatabase")}} để bắt đầu transaction, dùng `IDBTransaction` để đặt chế độ của transaction, ví dụ `readonly` hay `readwrite`, và truy cập một {{domxref("IDBObjectStore")}} để tạo request. Bạn cũng có thể dùng một đối tượng `IDBTransaction` để hủy transaction.

{{InheritanceDiagram}}

Transaction được bắt đầu ngay khi transaction được tạo, không phải khi request đầu tiên được đặt; ví dụ:

```js
const trans1 = db.transaction("foo", "readwrite");
const trans2 = db.transaction("foo", "readwrite");
const objectStore2 = trans2.objectStore("foo");
const objectStore1 = trans1.objectStore("foo");
objectStore2.put("2", "key");
objectStore1.put("1", "key");
```

Sau khi đoạn mã được thực thi, object store sẽ chứa giá trị `"2"`, vì `trans2` sẽ chạy sau `trans1`.

Một transaction luân phiên giữa trạng thái _active_ và _inactive_ giữa các task của event loop. Nó active trong task đã tạo ra nó, và trong mỗi task của các event handler [`success`](/en-US/docs/Web/API/IDBRequest/success_event) hoặc [`error`](/en-US/docs/Web/API/IDBRequest/error_event) của các request. Nó inactive trong mọi task khác; khi đó việc đặt request sẽ thất bại. Nếu không có request mới nào được đặt khi transaction đang active, và không còn request nào đang chờ, transaction sẽ tự động commit.

## Lỗi transaction

Transaction có thể thất bại vì một số lý do nhất định, và tất cả chúng, trừ khi user agent bị sập, đều sẽ kích hoạt callback abort:

- Abort do request lỗi, ví dụ cố `add()` cùng một khóa hai lần, hoặc `put()` với cùng một khóa index khi có ràng buộc duy nhất. Điều này gây ra lỗi trên request, sau đó có thể lan lên lỗi trên transaction và làm transaction bị abort. Có thể ngăn điều này bằng cách dùng `preventDefault()` trên sự kiện lỗi của request.
- Gọi `abort()` trực tiếp từ script.
- Một ngoại lệ không được bắt trong handler `success`/`error` của request.
- Lỗi I/O, ví dụ ghi xuống đĩa thất bại hoặc lỗi OS/phần cứng khác.
- Vượt quá hạn mức.
- User agent bị sập.

## Độ bền trên Firefox

Lưu ý rằng từ Firefox 40, IndexedDB transaction có độ bền được nới lỏng để tăng hiệu năng (xem [Firefox bug 1112702](https://bugzil.la/1112702)). Trước đây, trong transaction `readwrite`, sự kiện {{domxref("IDBTransaction.complete_event","complete")}} chỉ được kích hoạt khi mọi dữ liệu được đảm bảo đã được ghi xuống đĩa. Từ Firefox 40 trở đi, sự kiện `complete` được kích hoạt sau khi hệ điều hành đã được yêu cầu ghi dữ liệu, nhưng có thể là trước khi dữ liệu thực sự được ghi xuống đĩa. Vì thế `complete` có thể được phát nhanh hơn trước; tuy nhiên vẫn tồn tại một khả năng nhỏ rằng toàn bộ transaction sẽ bị mất nếu hệ điều hành sập hoặc mất điện trước khi dữ liệu được ghi xuống đĩa. Vì các sự cố như vậy hiếm gặp, phần lớn người dùng không cần bận tâm thêm.

Nếu bạn cần bảo đảm độ bền vì lý do nào đó, ví dụ đang lưu dữ liệu quan trọng không thể tính lại về sau, bạn có thể buộc transaction ghi xuống đĩa trước khi phát sự kiện `complete` bằng cách tạo transaction với chế độ thực nghiệm (không chuẩn) `readwriteflush` (xem {{domxref("IDBDatabase.transaction")}}).

## Thuộc tính thể hiện

- {{domxref("IDBTransaction.db")}} {{ReadOnlyInline}}
  - : Kết nối cơ sở dữ liệu mà transaction này gắn với.
- {{domxref("IDBTransaction.durability")}} {{ReadOnlyInline}}
  - : Trả về gợi ý độ bền mà transaction được tạo cùng.
- {{domxref("IDBTransaction.error")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMException")}} cho biết loại lỗi đã xảy ra khi transaction thất bại. Thuộc tính này là `null` nếu transaction chưa kết thúc, đã kết thúc và được commit thành công, hoặc đã bị hủy bằng hàm {{domxref("IDBTransaction.abort()")}}.
- {{domxref("IDBTransaction.mode")}} {{ReadOnlyInline}}
  - : Chế độ dùng để cô lập truy cập tới dữ liệu trong các object store thuộc phạm vi transaction. Giá trị mặc định là `readonly`.
- {{domxref("IDBTransaction.objectStoreNames")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMStringList")}} chứa các tên của các đối tượng {{domxref("IDBObjectStore")}} được liên kết với transaction.

## Phương thức thể hiện

Kế thừa từ: {{domxref("EventTarget")}}

- {{domxref("IDBTransaction.abort()")}}
  - : Hoàn nguyên mọi thay đổi đối với các đối tượng trong cơ sở dữ liệu gắn với transaction này. Nếu transaction đã bị hủy hoặc đã hoàn tất, phương thức này sẽ phát ra sự kiện lỗi.
- {{domxref("IDBTransaction.objectStore()")}}
  - : Trả về một đối tượng {{domxref("IDBObjectStore")}} đại diện cho object store nằm trong phạm vi của transaction này.
- {{domxref("IDBTransaction.commit()")}}
  - : Với một transaction đang active, commit transaction đó. Lưu ý rằng thường thì không cần phải gọi phương thức này; transaction sẽ tự động commit khi mọi request đang chờ đã được xử lý và không còn request mới nào được tạo. `commit()` có thể dùng để bắt đầu quá trình commit mà không cần chờ sự kiện từ các request đang chờ.

## Sự kiện

Nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán thuộc tính trình xử lý sự kiện `oneventname` của giao diện này.

- [`abort`](/en-US/docs/Web/API/IDBTransaction/abort_event)
  - : Sự kiện được phát khi transaction `IndexedDB` bị hủy.
    Cũng có thể truy cập qua thuộc tính `onabort`; sự kiện này nổi bọt lên {{domxref("IDBDatabase")}}.
- [`complete`](/en-US/docs/Web/API/IDBTransaction/complete_event)
  - : Sự kiện được phát khi transaction hoàn tất thành công.
    Cũng có thể truy cập qua thuộc tính `oncomplete`.
- [`error`](/en-US/docs/Web/API/IDBTransaction/error_event)
  - : Sự kiện được phát khi một request trả về lỗi và sự kiện nổi bọt lên đối tượng kết nối ({{domxref("IDBDatabase")}}).
    Cũng có thể truy cập qua thuộc tính `onerror`.

## Hằng số chế độ

{{Deprecated_Header}}

> [!WARNING]
> Các hằng số này không còn khả dụng nữa, chúng đã bị xóa trong Gecko 25. Bạn nên dùng trực tiếp các hằng chuỗi thay thế. ([Firefox bug 888598](https://bugzil.la/888598))

Transaction có thể có một trong ba chế độ sau:

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Hằng số</th>
      <th scope="col">Giá trị</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code><a>READ_ONLY</a></code>
      </td>
      <td>"readonly" (0 trong Chrome)</td>
      <td><p>Cho phép đọc dữ liệu nhưng không cho sửa đổi.</p></td>
    </tr>
    <tr>
      <td>
        <code><a>READ_WRITE</a></code>
      </td>
      <td>"readwrite" (1 trong Chrome)</td>
      <td>
        Cho phép đọc và ghi dữ liệu trong các kho dữ liệu hiện có.
      </td>
    </tr>
    <tr>
      <td>
        <code><a>VERSION_CHANGE</a></code>
      </td>
      <td>"versionchange" (2 trong Chrome)</td>
      <td>
        Cho phép thực hiện mọi thao tác, kể cả những thao tác xóa và tạo object store cũng như index. Transaction ở chế độ này không thể chạy đồng thời với transaction khác. Transaction ở chế độ này được gọi là "upgrade transaction".
      </td>
    </tr>
  </tbody>
</table>

Ngay cả khi các hằng số này đã bị deprecate, bạn vẫn có thể dùng chúng để duy trì tương thích ngược nếu cần. Nên viết mã phòng thủ trong trường hợp đối tượng không còn khả dụng:

```js
const myIDBTransaction = window.IDBTransaction ||
  window.webkitIDBTransaction || { READ_WRITE: "readwrite" };
```

## Ví dụ

Trong đoạn mã sau, chúng ta mở một transaction đọc/ghi trên cơ sở dữ liệu và thêm dữ liệu vào một object store. Lưu ý các hàm được gắn vào event handler của transaction để báo kết quả mở transaction trong trường hợp thành công hoặc thất bại. Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const note = document.getElementById("notifications");

// một thể hiện của object db để lưu dữ liệu IDB vào
let db;

// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db
  // Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Thêm dữ liệu vào cơ sở dữ liệu
  addData();
};

function addData() {
  // Tạo một object mới để chèn vào IDB
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

  // mở transaction đọc/ghi, sẵn sàng để thêm dữ liệu
  const transaction = db.transaction(["toDoList"], "readwrite");

  // báo cáo về kết quả mở transaction
  transaction.oncomplete = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction completed: database modification finished.";
  };

  transaction.onerror = (event) => {
    note.appendChild(document.createElement("li")).textContent =
      "Transaction not opened due to error. Duplicate items not allowed.";
  };

  // tạo object store trên transaction
  const objectStore = transaction.objectStore("toDoList");

  // thêm object newItem vào object store
  const objectStoreRequest = objectStore.add(newItem[0]);

  objectStoreRequest.onsuccess = (event) => {
    // báo cáo thành công của request (điều này không có nghĩa là mục
    // đã được lưu thành công trong DB - để làm vậy bạn cần transaction.onsuccess)
    note.appendChild(document.createElement("li")).textContent =
      "Request successful.";
  };

  // Trả về kết nối cơ sở dữ liệu (IDBDatabase) mà transaction này gắn với
  transaction.db;
}
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
- Truy xuất và thay đổi dữ liệu: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
