---
title: "IDBObjectStore: phương thức put()"
short-title: put()
slug: Web/API/IDBObjectStore/put
page-type: web-api-instance-method
browser-compat: api.IDBObjectStore.put
---

{{ APIRef("IndexedDB") }} {{AvailableInWorkers}}

Phương thức **`put()`** của giao diện {{domxref("IDBObjectStore")}} cập nhật một bản ghi trong cơ sở dữ liệu, hoặc chèn một bản ghi mới nếu mục đã cho chưa tồn tại.

Nó trả về một đối tượng {{domxref("IDBRequest")}}, và, trong một luồng riêng biệt, tạo một [bản sao có cấu trúc](https://html.spec.whatwg.org/multipage/common-dom-interfaces.html#structured-clone) của giá trị và lưu giá trị đã sao chép vào object store. Phương thức này dùng để thêm bản ghi mới, hoặc cập nhật bản ghi hiện có trong object store khi chế độ của giao dịch là `readwrite`. Nếu bản ghi được lưu thành công, thì một sự kiện success được kích hoạt trên đối tượng request được trả về với `result` được đặt thành khóa của bản ghi đã lưu, và `transaction` được đặt thành giao dịch mà object store này được mở.

Phương thức put là phương thức _cập nhật hoặc chèn_. Xem phương thức {{domxref("IDBObjectStore.add")}} để biết phương thức _chỉ chèn_.

Lưu ý rằng nếu bạn có một {{domxref("IDBCursor","IDBCursor")}} đến bản ghi bạn muốn cập nhật, việc cập nhật nó bằng {{domxref("IDBCursor.update()")}} sẽ tốt hơn là sử dụng `IDBObjectStore.put()`. Điều này làm rõ rằng một bản ghi hiện có sẽ được cập nhật, thay vì một bản ghi mới được chèn vào.

## Cú pháp

```js-nolint
put(item)
put(item, key)
```

### Tham số

- `item`
  - : Mục bạn muốn cập nhật (hoặc chèn).
- `key` {{optional_inline}}
  - : Khóa chính của bản ghi bạn muốn cập nhật (ví dụ: từ {{domxref("IDBCursor.primaryKey")}}).

### Giá trị trả về

Một đối tượng {{domxref("IDBRequest")}} mà các sự kiện tiếp theo liên quan đến thao tác này sẽ được kích hoạt trên đó.

Nếu thao tác thành công, giá trị của thuộc tính {{domxref("IDBRequest.result", "result")}} của request là khóa của bản ghi mới hoặc đã cập nhật.

### Ngoại lệ

Phương thức này có thể gây ra một {{domxref("DOMException")}} thuộc một trong các loại sau:

- `ReadOnlyError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch liên quan đến thao tác này đang ở [chế độ](/vi/docs/Web/API/IDBTransaction#mode_constants) chỉ đọc.
- `TransactionInactiveError` {{domxref("DOMException")}}
  - : Được ném nếu giao dịch của {{domxref("IDBObjectStore")}} này không hoạt động.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu bất kỳ điều kiện nào sau đây áp dụng:
    - Object store sử dụng [khóa nội tuyến](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#in-line_key) hoặc có [bộ tạo khóa](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#key_generator), và tham số `key` đã được cung cấp.
    - Object store sử dụng khóa ngoại tuyến và không có bộ tạo khóa, và không có tham số `key` nào được cung cấp.
    - Object store sử dụng khóa nội tuyến nhưng không có bộ tạo `key`, và [đường dẫn khóa](/vi/docs/Web/API/IndexedDB_API/Basic_Terminology#key_path) của object store không tạo ra một khóa hợp lệ.
    - Tham số `key` đã được cung cấp nhưng không chứa một khóa hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("IDBObjectStore")}} đã bị xóa hoặc loại bỏ.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném nếu dữ liệu đang được lưu trữ không thể được sao chép bởi thuật toán sao chép có cấu trúc nội bộ.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định; khi yêu cầu đó thành công, hàm `onsuccess` lấy bản ghi liên kết từ {{domxref("IDBObjectStore")}} (được cung cấp dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, sau đó đưa bản ghi đã cập nhật trở lại object store trong một yêu cầu khác bằng `put()`. Để xem ví dụ hoạt động đầy đủ, hãy tham khảo ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const title = "Walk dog";

// Mở một giao dịch như bình thường
const objectStore = db
  .transaction(["toDoList"], "readwrite")
  .objectStore("toDoList");

// Lấy đối tượng danh sách việc cần làm có tiêu đề này
const objectStoreTitleRequest = objectStore.get(title);

objectStoreTitleRequest.onsuccess = () => {
  // Lấy đối tượng dữ liệu được trả về làm kết quả
  const data = objectStoreTitleRequest.result;

  // Cập nhật giá trị notified trong đối tượng thành "yes"
  data.notified = "yes";

  // Tạo một yêu cầu khác chèn mục này trở lại cơ sở dữ liệu
  const updateTitleRequest = objectStore.put(data);

  // Ghi lại giao dịch đã khởi tạo yêu cầu này
  console.log(
    `The transaction that originated this request is ${updateTitleRequest.transaction}`,
  );

  // Khi yêu cầu mới này thành công, chạy lại hàm displayData() để cập nhật hiển thị
  updateTitleRequest.onsuccess = () => {
    displayData();
  };
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
