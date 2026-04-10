---
title: "IDBDatabase: phương thức transaction()"
short-title: transaction()
slug: Web/API/IDBDatabase/transaction
page-type: web-api-instance-method
browser-compat: api.IDBDatabase.transaction
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`transaction`** của giao diện {{domxref("IDBDatabase")}} ngay lập tức trả về một transaction object ({{domxref("IDBTransaction")}}) chứa phương thức {{domxref("IDBTransaction.objectStore")}}, mà bạn có thể dùng để truy cập object store của mình.

## Cú pháp

```js-nolint
transaction(storeNames)
transaction(storeNames, mode)
transaction(storeNames, mode, options)
```

### Tham số

- `storeNames`
  - : Tên của các object store nằm trong phạm vi của transaction mới, được khai báo dưới dạng một mảng chuỗi. Chỉ nên chỉ định những object store mà bạn cần truy cập.
    Nếu bạn chỉ cần truy cập một object store, bạn có thể chỉ định tên của nó dưới dạng chuỗi.
    Vì vậy, các dòng sau là tương đương:

    ```js
    db.transaction(["my-store-name"]);
    db.transaction("my-store-name");
    ```

    Nếu bạn cần truy cập tất cả object store trong cơ sở dữ liệu, bạn có thể dùng thuộc tính {{domxref("IDBDatabase.objectStoreNames")}}:

    ```js
    const transaction = db.transaction(db.objectStoreNames);
    ```

    Truyền một mảng rỗng sẽ ném ngoại lệ.

- `mode` {{optional_inline}}
  - : Các kiểu truy cập có thể thực hiện trong transaction.
    Transaction được mở theo một trong ba chế độ:
    - `readonly`
      - : Mở transaction để đọc từ object store. Đây là chế độ mặc định.
    - `readwrite`
      - : Mở transaction cho cả đọc và ghi từ object store.
        Chỉ nên dùng nếu bạn cần ghi vào cơ sở dữ liệu.
    - `readwriteflush` {{non-standard_inline}} {{experimental_inline}}
      - : Buộc transaction flush xuống đĩa trước khi phát sự kiện `complete`.
        Có thể dùng khi lưu dữ liệu quan trọng không thể tính lại sau này.

- `options` {{optional_inline}}
  - : Đối tượng định nghĩa các tùy chọn bổ sung, bao gồm:
    - `durability`
      - : Một trong ba giá trị chuỗi sau:
        - `"strict"`
          - : User agent có thể chỉ xem transaction là commit thành công sau khi xác minh rằng mọi thay đổi đang chờ đã được ghi thành công xuống một phương tiện lưu trữ bền vững.
            Đây là lựa chọn được khuyến nghị khi rủi ro mất dữ liệu lớn hơn tác động của nó lên hiệu năng và năng lượng, so với `relaxed`.
        - `"relaxed"`
          - : User agent có thể xem transaction là commit thành công ngay khi mọi thay đổi đang chờ đã được ghi vào hệ điều hành, mà không cần xác minh tiếp theo.
            Điều này cho hiệu năng tốt hơn `strict` và được khuyến nghị cho dữ liệu tạm thời như cache hoặc bản ghi thay đổi nhanh.
        - `"default"`
          - : User agent nên dùng hành vi độ bền mặc định cho storage bucket.
            Đây là mặc định cho transaction nếu không chỉ định gì khác.

### Giá trị trả về

Một đối tượng {{domxref("IDBTransaction")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức {{domxref("IDBDatabase.close", "close()")}} đã từng được gọi trước đó trên thể hiện {{domxref("IDBDatabase")}} này.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu object store được chỉ định trong tham số `storeNames` đã bị xóa hoặc gỡ bỏ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu giá trị của tham số `mode` không hợp lệ.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu hàm được gọi với một danh sách tên store rỗng.

## Ví dụ

Trong ví dụ này, chúng ta mở một kết nối cơ sở dữ liệu, rồi dùng `transaction()` để mở transaction trên cơ sở dữ liệu. Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
let db;

// Hãy mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Cơ sở dữ liệu đã được khởi tạo.";

  // lưu kết quả mở cơ sở dữ liệu vào biến db.
  // Biến này sẽ được dùng rất nhiều về sau
  db = DBOpenRequest.result;

  // Chạy hàm displayData() để điền danh sách tác vụ với
  // toàn bộ dữ liệu to-do đã có trong IDB
  displayData();
};

// mở transaction đọc/ghi trên cơ sở dữ liệu, sẵn sàng để thêm dữ liệu
const transaction = db.transaction(["toDoList"], "readwrite");

// báo cáo về kết quả mở transaction
transaction.oncomplete = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Transaction đã hoàn tất: việc sửa đổi cơ sở dữ liệu đã xong.";
};

transaction.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Transaction không được mở do lỗi. Không cho phép mục trùng lặp.";
};

// sau đó bạn sẽ tiếp tục thực hiện thao tác nào đó với cơ sở dữ liệu này
// thông qua một object store
const objectStore = transaction.objectStore("toDoList");
// v.v.
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
