---
title: IDBIndex
slug: Web/API/IDBIndex
page-type: web-api-interface
browser-compat: api.IDBIndex
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBIndex`** của [IndexedDB API](/vi/docs/Web/API/IndexedDB_API) cung cấp quyền truy cập bất đồng bộ vào một [index](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#index) trong cơ sở dữ liệu. Index là một dạng object store dùng để tra cứu các bản ghi trong một object store khác, được gọi là object store được tham chiếu. Bạn dùng giao diện này để truy xuất dữ liệu.

Bạn có thể truy xuất các bản ghi trong object store thông qua khóa chính hoặc bằng cách dùng index. Index cho phép bạn tra cứu bản ghi trong object store bằng các thuộc tính của giá trị trong bản ghi của object store thay vì chỉ dựa vào khóa chính.

Index là một kho lưu trữ khóa-giá trị bền vững, trong đó phần giá trị của các bản ghi là phần khóa của một bản ghi trong object store được tham chiếu. Các bản ghi trong index được tự động điền khi các bản ghi trong object store được tham chiếu được chèn, cập nhật hoặc xóa. Mỗi bản ghi trong index chỉ có thể trỏ đến một bản ghi trong object store được tham chiếu, nhưng nhiều index có thể tham chiếu cùng một object store. Khi object store thay đổi, tất cả index tham chiếu đến object store đó đều được cập nhật tự động.

Bạn có thể lấy một tập khóa trong một phạm vi. Để tìm hiểu thêm, xem {{domxref("IDBKeyRange")}}.

## Thuộc tính thể hiện

- {{domxref("IDBIndex.isAutoLocale")}} {{ReadOnlyInline}} {{ non-standard_inline }} {{deprecated_inline}}
  - : Trả về một giá trị boolean cho biết index có giá trị `locale` là `auto` hay không khi được tạo (xem tham số [`options`](/en-US/docs/Web/API/IDBObjectStore/createIndex#options) của [`IDBObjectStore.createIndex()`](/en-US/docs/Web/API/IDBObjectStore/createIndex).)
- {{domxref("IDBIndex.locale")}} {{ReadOnlyInline}} {{ non-standard_inline }} {{deprecated_inline}}
  - : Trả về `locale` của index, ví dụ `en-US` hoặc `pl`, nếu `locale` đã được chỉ định khi tạo (xem tham số [`options`](/en-US/docs/Web/API/IDBObjectStore/createIndex#options) của [`IDBObjectStore.createIndex()`](/en-US/docs/Web/API/IDBObjectStore/createIndex).)
- {{domxref("IDBIndex.name")}}
  - : Tên của index này.
- {{domxref("IDBIndex.objectStore")}} {{ReadOnlyInline}}
  - : Tên của object store được index này tham chiếu.
- {{domxref("IDBIndex.keyPath")}} {{ReadOnlyInline}}
  - : [Đường dẫn khóa](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) của index này. Nếu là `null`, index này sẽ không được tự động điền.
- {{domxref("IDBIndex.multiEntry")}} {{ReadOnlyInline}}
  - : Ảnh hưởng đến cách index hoạt động khi kết quả đánh giá key path của index trả về một mảng. Nếu là `true`, sẽ có một bản ghi trong index cho mỗi phần tử của mảng khóa. Nếu là `false`, sẽ có một bản ghi cho mỗi khóa là một mảng.
- {{domxref("IDBIndex.unique")}} {{ReadOnlyInline}}
  - : Nếu là `true`, index này không cho phép các giá trị trùng lặp cho một khóa.

## Phương thức thể hiện

Kế thừa từ: [EventTarget](/en-US/docs/Web/API/EventTarget)

- {{domxref("IDBIndex.count()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, trả về số lượng bản ghi trong một phạm vi khóa.
- {{domxref("IDBIndex.get()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm giá trị trong object store được tham chiếu tương ứng với khóa đã cho hoặc giá trị tương ứng đầu tiên, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBIndex.getKey()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm khóa đã cho hoặc khóa chính, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBIndex.getAll()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm tất cả giá trị khớp trong object store được tham chiếu tương ứng với khóa đã cho hoặc nằm trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBIndex.getAllKeys()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm tất cả khóa khớp trong object store được tham chiếu tương ứng với khóa đã cho hoặc nằm trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBIndex.getAllRecords()")}} {{experimental_inline}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tìm tất cả bản ghi khớp trong object store được tham chiếu (bao gồm khóa index, khóa chính và giá trị) tương ứng với khóa đã cho hoặc nằm trong phạm vi, nếu `key` là một {{domxref("IDBKeyRange")}}.
- {{domxref("IDBIndex.openCursor()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một [cursor](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#cursor) trên phạm vi khóa đã chỉ định.
- {{domxref("IDBIndex.openKeyCursor()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trong một luồng riêng biệt, tạo một cursor trên phạm vi khóa đã chỉ định, được sắp xếp theo index này.

## Ví dụ

Trong ví dụ sau, chúng ta mở một transaction và một object store, rồi lấy index `lName` từ một cơ sở dữ liệu liên hệ đơn giản. Sau đó, chúng ta mở một cursor cơ bản trên index bằng {{domxref("IDBIndex.openCursor")}} - thao tác này hoạt động giống như mở cursor trực tiếp trên một `ObjectStore` bằng {{domxref("IDBObjectStore.openCursor")}}, ngoại trừ việc các bản ghi được trả về được sắp xếp theo index, không phải theo khóa chính.

Cuối cùng, chúng ta lặp qua từng bản ghi và chèn dữ liệu vào một bảng HTML. Để xem ví dụ hoàn chỉnh đang chạy, hãy xem kho demo [IndexedDB-examples](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbindex) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbindex/)).

```js
function displayDataByIndex() {
  tableEntry.textContent = "";
  const transaction = db.transaction(["contactsList"], "readonly");
  const objectStore = transaction.objectStore("contactsList");

  const myIndex = objectStore.index("lName");
  myIndex.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const tableRow = document.createElement("tr");
      for (const cell of [
        cursor.value.id,
        cursor.value.lName,
        cursor.value.fName,
        cursor.value.jTitle,
        cursor.value.company,
        cursor.value.eMail,
        cursor.value.phone,
        cursor.value.age,
      ]) {
        const tableCell = document.createElement("td");
        tableCell.textContent = cell;
        tableRow.appendChild(tableCell);
      }
      tableEntry.appendChild(tableRow);

      cursor.continue();
    } else {
      console.log("Tất cả các mục đã được hiển thị.");
    }
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Sử dụng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Sử dụng cursor: {{domxref("IDBCursor")}}
- Ví dụ tham khảo: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
