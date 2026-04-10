---
title: IDBCursor
slug: Web/API/IDBCursor
page-type: web-api-interface
browser-compat: api.IDBCursor
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

> [!NOTE]
> Không nên nhầm lẫn với {{domxref("IDBCursorWithValue")}}, đây chỉ là giao diện **`IDBCursor`** có thêm thuộc tính **`value`**.

Giao diện **`IDBCursor`** của [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API) đại diện cho một [con trỏ](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology#cursor) dùng để duyệt hoặc lặp qua nhiều bản ghi trong một cơ sở dữ liệu.

Con trỏ có một nguồn xác định index hoặc object store mà nó đang duyệt. Nó có một vị trí trong phạm vi, và di chuyển theo một hướng tăng hoặc giảm trong thứ tự của các khóa bản ghi. Con trỏ cho phép ứng dụng xử lý bất đồng bộ toàn bộ các bản ghi trong phạm vi của nó.

Bạn có thể có vô số con trỏ cùng lúc. Bạn luôn nhận được cùng một đối tượng `IDBCursor` đại diện cho một con trỏ cụ thể. Các thao tác được thực hiện trên index hoặc object store bên dưới.

## Thuộc tính thể hiện

> [!NOTE]
> {{domxref("IDBCursorWithValue")}} là một giao diện **`IDBCursor`** có thêm thuộc tính **`value`**.

- {{domxref("IDBCursor.source")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("IDBObjectStore")}} hoặc {{domxref("IDBIndex")}} mà con trỏ đang duyệt. Hàm này không bao giờ trả về `null` hay ném ngoại lệ, ngay cả khi con trỏ đang được duyệt, đã đi quá phạm vi, hoặc transaction của nó không còn hoạt động.
- {{domxref("IDBCursor.direction")}} {{ReadOnlyInline}}
  - : Trả về hướng duyệt của con trỏ.
- {{domxref("IDBCursor.key")}} {{ReadOnlyInline}}
  - : Trả về khóa của bản ghi tại vị trí con trỏ. Nếu con trỏ nằm ngoài phạm vi, giá trị này được đặt là `undefined`. Khóa của con trỏ có thể là bất kỳ kiểu dữ liệu nào.
- {{domxref("IDBCursor.primaryKey")}} {{ReadOnlyInline}}
  - : Trả về khóa chính hiệu lực hiện tại của con trỏ. Nếu con trỏ đang được duyệt hoặc đã duyệt ra ngoài phạm vi, giá trị này được đặt là `undefined`. Khóa chính của con trỏ có thể là bất kỳ kiểu dữ liệu nào.
- {{domxref("IDBCursor.request")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("IDBRequest")}} đã được dùng để lấy con trỏ.

## Phương thức thể hiện

- {{domxref("IDBCursor.advance()")}}
  - : Thiết lập số lần mà con trỏ sẽ di chuyển vị trí của nó về phía trước.
- {{domxref("IDBCursor.continue()")}}
  - : Đưa con trỏ đến vị trí tiếp theo theo hướng của nó, tới mục có khóa khớp với tham số `key` tùy chọn.
- {{domxref("IDBCursor.continuePrimaryKey()")}}
  - : Đưa con trỏ đến khóa index và khóa chính đã cho dưới dạng đối số.
- {{domxref("IDBCursor.delete()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trên một luồng riêng, xóa bản ghi tại vị trí của con trỏ mà không thay đổi vị trí đó. Điều này có thể dùng để xóa các bản ghi cụ thể.
- {{domxref("IDBCursor.update()")}}
  - : Trả về một đối tượng {{domxref("IDBRequest")}} và, trên một luồng riêng, cập nhật giá trị tại vị trí hiện tại của con trỏ trong object store. Điều này có thể dùng để cập nhật các bản ghi cụ thể.

## Hằng số

{{Deprecated_Header}}

> [!WARNING]
> Các hằng số này không còn khả dụng nữa - chúng đã bị xóa trong Gecko 25. Thay vào đó bạn nên dùng trực tiếp các hằng chuỗi. ([Firefox bug 891944](https://bugzil.la/891944))

- `NEXT`: `"next"` : Con trỏ hiển thị tất cả bản ghi, kể cả bản ghi trùng. Nó bắt đầu từ giới hạn dưới của key range và di chuyển lên trên (tăng đơn điệu theo thứ tự khóa).
- `NEXTUNIQUE`: `"nextunique"` : Con trỏ hiển thị tất cả bản ghi, loại trừ bản ghi trùng. Nếu có nhiều bản ghi có cùng khóa, chỉ bản ghi đầu tiên được duyệt mới được trả về. Nó bắt đầu từ giới hạn dưới của key range và di chuyển lên trên.
- `PREV`: `"prev"` : Con trỏ hiển thị tất cả bản ghi, kể cả bản ghi trùng. Nó bắt đầu từ giới hạn trên của key range và di chuyển xuống dưới (giảm đơn điệu theo thứ tự khóa).
- `PREVUNIQUE`: `"prevunique"` : Con trỏ hiển thị tất cả bản ghi, loại trừ bản ghi trùng. Nếu có nhiều bản ghi có cùng khóa, chỉ bản ghi đầu tiên được duyệt mới được trả về. Nó bắt đầu từ giới hạn trên của key range và di chuyển xuống dưới.

## Ví dụ

Trong đoạn ví dụ đơn giản này, chúng ta tạo một transaction, lấy một object store, rồi dùng một con trỏ để duyệt qua tất cả bản ghi trong object store. Con trỏ không yêu cầu chúng ta chọn dữ liệu theo khóa; chúng ta chỉ cần lấy toàn bộ dữ liệu. Lưu ý thêm rằng ở mỗi vòng lặp, bạn có thể lấy dữ liệu từ bản ghi hiện tại dưới đối tượng con trỏ bằng `cursor.value.foo`. Để xem ví dụ hoàn chỉnh, hãy xem [ví dụ IDBCursor](https://github.com/mdn/dom-examples/tree/main/indexeddb-examples/idbcursor) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/indexeddb-examples/idbcursor/)).

```js
function displayData() {
  const transaction = db.transaction(["rushAlbumList"], "readonly");
  const objectStore = transaction.objectStore("rushAlbumList");

  objectStore.openCursor().onsuccess = (event) => {
    const cursor = event.target.result;
    if (cursor) {
      const listItem = document.createElement("li");
      listItem.textContent = `${cursor.value.albumTitle}, ${cursor.value.year}`;
      list.appendChild(listItem);

      cursor.continue();
    } else {
      console.log("Entries all displayed.");
    }
  };
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB)
- Bắt đầu transaction: {{domxref("IDBDatabase")}}
- Sử dụng transaction: {{domxref("IDBTransaction")}}
- Thiết lập một phạm vi khóa: {{domxref("IDBKeyRange")}}
- Truy xuất và thay đổi dữ liệu của bạn: {{domxref("IDBObjectStore")}}
- Tham chiếu ví dụ: [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem bản chạy trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).
