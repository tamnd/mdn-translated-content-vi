---
title: "IDBRequest: thuộc tính transaction"
short-title: transaction
slug: Web/API/IDBRequest/transaction
page-type: web-api-instance-property
browser-compat: api.IDBRequest.transaction
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`transaction`** của giao diện `IDBRequest` trả về transaction của request, tức là transaction mà request đang được thực hiện bên trong.

Thuộc tính này có thể là `null` đối với các request không được tạo bên trong transaction, chẳng hạn các request được trả về từ {{domxref("IDBFactory.open")}}. Trong trường hợp này, bạn chỉ đang kết nối tới cơ sở dữ liệu nên không có transaction nào để trả về. Nếu cần nâng cấp phiên bản khi mở cơ sở dữ liệu thì trong trình xử lý sự kiện {{domxref("IDBOpenDBRequest.upgradeneeded_event", "upgradeneeded")}}, thuộc tính **`transaction`** sẽ là một {{domxref("IDBTransaction")}} có {{domxref("IDBTransaction.mode", "mode")}} bằng `"versionchange"` và có thể được dùng để truy cập các object store và index hiện có, hoặc hủy nâng cấp. Sau khi nâng cấp xong, thuộc tính **`transaction`** sẽ আবার trở lại `null`.

## Giá trị

Một {{domxref("IDBTransaction")}}.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định, `onsuccess` lấy bản ghi liên quan từ {{domxref("IDBObjectStore")}} (có sẵn dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, rồi đưa bản ghi đã cập nhật trở lại object store trong một request khác. Nguồn của các request được ghi ra console của nhà phát triển, và cả hai đều xuất phát từ cùng một transaction. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const title = "Walk dog";

// Mở transaction như bình thường
const objectStore = db
  .transaction(["toDoList"], "readwrite")
  .objectStore("toDoList");

// Lấy object trong to-do list có tiêu đề này
const objectStoreTitleRequest = objectStore.get(title);

objectStoreTitleRequest.onsuccess = () => {
  // Lấy object dữ liệu được trả về như kết quả
  const data = objectStoreTitleRequest.result;

  // Cập nhật giá trị notified trong object thành "yes"
  data.notified = "yes";

  // Tạo một request khác để chèn mục trở lại
  // cơ sở dữ liệu
  const updateTitleRequest = objectStore.put(data);

  // Ghi lại transaction đã tạo ra request này
  console.log(
    `Transaction đã tạo ra request này là ${updateTitleRequest.transaction}`,
  );

  // Khi request mới này thành công, chạy lại hàm displayData()
  // để cập nhật hiển thị
  updateTitleRequest.onsuccess = () => {
    displayData();
  };
};
```

Ví dụ này cho thấy thuộc tính **`transaction`** có thể được dùng trong quá trình nâng cấp phiên bản để truy cập các object store hiện có:

```js
const openRequest = indexedDB.open("db", 2);
console.log(openRequest.transaction); // Sẽ ghi "null".

openRequest.onupgradeneeded = (event) => {
  console.log(openRequest.transaction.mode); // Sẽ ghi "versionchange".
  const db = openRequest.result;
  if (event.oldVersion < 1) {
    // Cơ sở dữ liệu mới, tạo object store "books".
    db.createObjectStore("books");
  }
  if (event.oldVersion < 2) {
    // Nâng cấp từ cơ sở dữ liệu v1: thêm index trên "title" vào store "books".
    const bookStore = openRequest.transaction.objectStore("books");
    bookStore.createIndex("by_title", "title");
  }
};

openRequest.onsuccess = () => {
  console.log(openRequest.transaction); // Sẽ ghi "null".
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
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Dùng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
