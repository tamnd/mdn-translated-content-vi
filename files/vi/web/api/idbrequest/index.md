---
title: IDBRequest
slug: Web/API/IDBRequest
page-type: web-api-interface
browser-compat: api.IDBRequest
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Giao diện **`IDBRequest`** của IndexedDB API cung cấp quyền truy cập vào kết quả của các yêu cầu bất đồng bộ tới cơ sở dữ liệu và các đối tượng cơ sở dữ liệu bằng các thuộc tính trình xử lý sự kiện. Mọi thao tác đọc và ghi trên cơ sở dữ liệu đều được thực hiện thông qua một request.

Ban đầu, đối tượng request không chứa bất kỳ thông tin nào về kết quả của thao tác. Khi thông tin trở nên khả dụng, một sự kiện sẽ được kích hoạt trên request và thông tin đó sẽ có thể truy cập qua các thuộc tính của thể hiện `IDBRequest`.

Mọi thao tác bất đồng bộ đều trả về ngay một thể hiện `IDBRequest`. Mỗi request có một `readyState` được đặt là trạng thái `'pending'`; trạng thái này chuyển sang `'done'` khi request hoàn tất hoặc thất bại. Khi trạng thái là `done`, mọi request đều trả về một `result` và một `error`, đồng thời một sự kiện được kích hoạt trên request. Khi trạng thái vẫn là `pending`, mọi nỗ lực truy cập `result` hoặc `error` sẽ ném ra ngoại lệ `InvalidStateError`.

Nói đơn giản, mọi phương thức bất đồng bộ đều trả về một đối tượng request. Nếu request hoàn tất thành công, kết quả sẽ có sẵn qua thuộc tính `result` và một sự kiện báo thành công sẽ được kích hoạt trên request ({{domxref("IDBRequest.success_event", "success")}}). Nếu xảy ra lỗi trong khi thực hiện thao tác, ngoại lệ sẽ có sẵn qua thuộc tính `error` và một sự kiện lỗi sẽ được kích hoạt ({{domxref("IDBRequest.error_event", "error")}}).

Giao diện {{domxref("IDBOpenDBRequest")}} được dẫn xuất từ `IDBRequest`.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ {{domxref("EventTarget")}}._

- {{domxref("IDBRequest.error")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMException")}} trong trường hợp request không thành công, cho biết lỗi đã xảy ra là gì.
- {{domxref("IDBRequest.result")}} {{ReadOnlyInline}}
  - : Trả về kết quả của request. Nếu request chưa hoàn tất, kết quả sẽ không khả dụng và ngoại lệ `InvalidStateError` sẽ được ném ra.
- {{domxref("IDBRequest.source")}} {{ReadOnlyInline}}
  - : Nguồn của request, chẳng hạn một {{domxref("IDBIndex")}} hoặc {{domxref("IDBObjectStore")}}. Nếu không có nguồn nào tồn tại, ví dụ khi gọi {{domxref("IDBFactory.open")}}, thuộc tính này trả về `null`.
- {{domxref("IDBRequest.readyState")}} {{ReadOnlyInline}}
  - : Trạng thái của request. Mọi request đều bắt đầu ở trạng thái `pending`. Trạng thái sẽ chuyển thành `done` khi request hoàn tất thành công hoặc khi xảy ra lỗi.
- {{domxref("IDBRequest.transaction")}} {{ReadOnlyInline}}
  - : Transaction của request. Thuộc tính này có thể là `null` đối với một số request, ví dụ các request được trả về từ {{domxref("IDBFactory.open")}} trừ khi cần nâng cấp. Khi đó bạn chỉ đang kết nối tới cơ sở dữ liệu, nên không có transaction nào để trả về.

## Phương thức thể hiện

_Không có phương thức, nhưng kế thừa các phương thức từ {{domxref("EventTarget")}}._

## Sự kiện

Nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- [`error`](/en-US/docs/Web/API/IDBRequest/error_event)
  - : Được kích hoạt khi một lỗi làm request thất bại.
- [`success`](/en-US/docs/Web/API/IDBRequest/success_event)
  - : Được kích hoạt khi `IDBRequest` thành công.

## Ví dụ

Trong đoạn mã sau, chúng ta mở một cơ sở dữ liệu bất đồng bộ và tạo một request; các hàm `onerror` và `onsuccess` được dùng để xử lý trường hợp thành công và lỗi. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
let db;

// Mở cơ sở dữ liệu của chúng ta
const DBOpenRequest = window.indexedDB.open("toDoList", 4);

// hai trình xử lý sự kiện này phản ứng khi cơ sở dữ liệu
// được mở thành công hoặc không thành công
DBOpenRequest.onerror = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Error loading database.";
};

DBOpenRequest.onsuccess = (event) => {
  note.appendChild(document.createElement("li")).textContent =
    "Database initialized.";

  // lưu kết quả mở cơ sở dữ liệu
  db = DBOpenRequest.result;
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
