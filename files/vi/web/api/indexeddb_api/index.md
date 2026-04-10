---
title: IndexedDB API
slug: Web/API/IndexedDB_API
page-type: web-api-overview
spec-urls: https://w3c.github.io/IndexedDB/
---

{{DefaultAPISidebar("IndexedDB")}} {{AvailableInWorkers}}

IndexedDB là một API cấp thấp để lưu trữ phía client một lượng lớn dữ liệu có cấu trúc, bao gồm cả tệp/blob. API này dùng các chỉ mục để cho phép tìm kiếm dữ liệu với hiệu năng cao. Trong khi [Web Storage](/en-US/docs/Web/API/Web_Storage_API) hữu ích cho việc lưu một lượng dữ liệu nhỏ hơn, nó kém phù hợp hơn khi lưu dữ liệu có cấu trúc lớn. IndexedDB cung cấp một giải pháp cho nhu cầu đó. Đây là trang đích chính cho phần tài liệu IndexedDB trên MDN. Ở đây chúng tôi cung cấp các liên kết đến toàn bộ tài liệu tham chiếu API và các hướng dẫn sử dụng, chi tiết hỗ trợ trình duyệt, cùng một số giải thích về các khái niệm chính.

## Khái niệm chính và cách dùng

IndexedDB là một hệ cơ sở dữ liệu giao dịch, tương tự một hệ quản trị cơ sở dữ liệu quan hệ dựa trên SQL (RDBMS). Tuy nhiên, khác với các RDBMS dựa trên SQL, vốn dùng bảng có cột cố định, IndexedDB là một cơ sở dữ liệu hướng đối tượng dựa trên JavaScript. IndexedDB cho phép bạn lưu và truy xuất các đối tượng được đánh chỉ mục bằng một **key**; bất kỳ đối tượng nào được hỗ trợ bởi [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) đều có thể được lưu. Bạn cần chỉ định lược đồ cơ sở dữ liệu, mở một kết nối đến cơ sở dữ liệu, rồi truy xuất và cập nhật dữ liệu trong một chuỗi **transactions**.

- Đọc thêm về [các đặc tính key và thuật ngữ cơ bản của IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Basic_Terminology).
- Tìm hiểu cách dùng IndexedDB bất đồng bộ từ đầu với hướng dẫn [Using IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB).
- Xem một ví dụ đầy đủ từng bước trong hướng dẫn [checking when a deadline is due](/en-US/docs/Web/API/IndexedDB_API/Checking_when_a_deadline_is_due).

> [!NOTE]
> Giống như hầu hết các giải pháp lưu trữ web, IndexedDB tuân theo [same-origin policy](https://www.w3.org/Security/wiki/Same_Origin_Policy). Vì vậy, trong khi bạn có thể truy cập dữ liệu đã lưu trong cùng một miền, bạn không thể truy cập dữ liệu giữa các miền khác nhau.

### Đồng bộ và bất đồng bộ

Các thao tác được thực hiện bằng IndexedDB là bất đồng bộ, để không chặn ứng dụng.

### Giới hạn lưu trữ và tiêu chí loại bỏ

Có nhiều công nghệ web khác nhau lưu dữ liệu phía client theo cách này hay cách khác, tức là trên đĩa cục bộ của bạn. IndexedDB là công nghệ thường được nhắc đến nhất. Cách trình duyệt xác định bao nhiêu dung lượng sẽ được cấp cho dữ liệu web, và sẽ xóa gì khi đạt giới hạn đó, không hề đơn giản và còn khác nhau giữa các trình duyệt. [Hạn mức lưu trữ của trình duyệt và tiêu chí loại bỏ dữ liệu](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) cố gắng giải thích cách hoạt động này, ít nhất là trong trường hợp của Firefox.

## Giao diện

Để truy cập cơ sở dữ liệu, hãy gọi [`open()`](/en-US/docs/Web/API/IDBFactory/open) trên thuộc tính [`indexedDB`](/en-US/docs/Web/API/Window/indexedDB) của đối tượng [window](/en-US/docs/Web/API/Window). Phương thức này trả về một đối tượng {{domxref("IDBRequest")}}; các thao tác bất đồng bộ sẽ giao tiếp với ứng dụng gọi bằng cách kích hoạt các sự kiện trên các đối tượng {{domxref("IDBRequest")}}.

### Kết nối với cơ sở dữ liệu

- {{domxref("IDBFactory")}}
  - : Cung cấp quyền truy cập vào cơ sở dữ liệu. Một đối tượng thuộc kiểu này là giá trị của các thuộc tính toàn cục {{domxref("Window.indexedDB")}} và {{domxref("WorkerGlobalScope.indexedDB")}}. Vì vậy, nó là điểm vào của API.
- {{domxref("IDBOpenDBRequest")}}
  - : Đại diện cho một yêu cầu mở cơ sở dữ liệu.
- {{domxref("IDBDatabase")}}
  - : Đại diện cho một kết nối đến cơ sở dữ liệu. Đây là cách duy nhất để tạo transaction trên cơ sở dữ liệu.

### Truy xuất và sửa đổi dữ liệu

- {{domxref("IDBTransaction")}}
  - : Đại diện cho một transaction. Bạn tạo transaction trên một cơ sở dữ liệu, chỉ định phạm vi (chẳng hạn những object store nào bạn muốn truy cập), và xác định kiểu truy cập (chỉ đọc hoặc đọc/ghi) mà bạn muốn.
- {{domxref("IDBRequest")}}
  - : Giao diện tổng quát xử lý các yêu cầu cơ sở dữ liệu và cung cấp quyền truy cập vào kết quả.
- {{domxref("IDBObjectStore")}}
  - : Đại diện cho một object store, cho phép truy cập một tập dữ liệu trong cơ sở dữ liệu IndexedDB, được tra cứu qua primary key.
- {{domxref("IDBIndex")}}
  - : Cũng cho phép truy cập một tập con dữ liệu trong cơ sở dữ liệu IndexedDB, nhưng dùng index để truy xuất bản ghi thay vì primary key. Cách này đôi khi nhanh hơn dùng {{domxref("IDBObjectStore")}}.
- {{domxref("IDBCursor")}}
  - : Duyệt qua các object store và index.
- {{domxref("IDBCursorWithValue")}}
  - : Duyệt qua các object store và index, đồng thời trả về giá trị hiện tại của con trỏ.
- {{domxref("IDBKeyRange")}}
  - : Xác định một khoảng key có thể được dùng để truy xuất dữ liệu từ cơ sở dữ liệu trong một phạm vi nhất định.

### Giao diện sự kiện tùy biến

Đặc tả này phát sinh các sự kiện với giao diện tùy biến sau:

- {{domxref("IDBVersionChangeEvent")}}
  - : Giao diện `IDBVersionChangeEvent` cho biết phiên bản của cơ sở dữ liệu đã thay đổi, là kết quả của một trình xử lý sự kiện {{domxref("IDBOpenDBRequest.upgradeneeded_event", "IDBOpenDBRequest.onupgradeneeded")}}.

## Ví dụ

- [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)): Ứng dụng tham chiếu cho các ví dụ trong tài liệu tham khảo.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Web Storage API](/en-US/docs/Web/API/Web_Storage_API)
- [Window: localStorage property](/en-US/docs/Web/API/Window/localStorage)
- [Window: sessionStorage property](/en-US/docs/Web/API/Window/sessionStorage)
- [StorageEvent](/en-US/docs/Web/API/StorageEvent)
