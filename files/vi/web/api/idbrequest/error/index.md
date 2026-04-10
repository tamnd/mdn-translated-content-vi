---
title: "IDBRequest: thuộc tính error"
short-title: error
slug: Web/API/IDBRequest/error
page-type: web-api-instance-property
browser-compat: api.IDBRequest.error
---

{{APIRef("IndexedDB")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`error`** của giao diện {{domxref("IDBRequest")}} trả về lỗi trong trường hợp request thất bại.

## Giá trị

Một {{domxref("DOMException")}} hoặc `null` nếu không có lỗi. Đối tượng ngoại lệ sẽ có một trong các tên sau, tùy theo nguyên nhân gây lỗi.

Các lỗi này là bất đồng bộ, nghĩa là không thể xử lý bằng [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch). Tuy nhiên, nếu `IDBRequest` có gán trình xử lý sự kiện {{domxref("IDBRequest.error_event", "error")}}, bạn vẫn có thể kiểm tra các lỗi này bằng cách truy vấn thuộc tính `error` của request qua đối tượng sự kiện, ví dụ [`event.target.error.name`](/en-US/docs/Web/API/DOMException/name) hoặc [`event.target.error.message`](/en-US/docs/Web/API/DOMException/message).

- `AbortError`
  - : Nếu bạn hủy transaction, tất cả request đang xử lý sẽ nhận lỗi này.
- `ConstraintError`
  - : Nhận được nếu bạn chèn dữ liệu không tuân theo ràng buộc khi điền dữ liệu vào store. Ví dụ, bạn sẽ gặp lỗi này nếu cố thêm một khóa mới vốn đã tồn tại trong store.
- `NotReadableError`
  - : Nhận được cho các lỗi đọc không thể khôi phục. Cụ thể, lỗi này cho biết bản ghi vẫn có trong cơ sở dữ liệu nhưng không thể truy xuất giá trị của nó. Xem thêm [Transient and unrecoverable read errors](#transient_and_unrecoverable_read_errors) bên dưới.
- {{domxref("QuotaExceededError")}}
  - : Nhận được nếu ứng dụng hết hạn ngạch đĩa. Trong một số trường hợp, trình duyệt sẽ hỏi người dùng có cho thêm dung lượng hay không, và lỗi sẽ được trả về nếu họ từ chối. Ở các trường hợp khác, trình duyệt dùng các heuristic để quyết định xem có thể cấp thêm dung lượng hay không.
- `UnknownError`
  - : Nhận được cho các lỗi đọc tạm thời, bao gồm lỗi IO đĩa chung. Xem thêm [Transient and unrecoverable read errors](#transient_and_unrecoverable_read_errors) bên dưới.
- `VersionError`
  - : Nhận được nếu bạn cố mở cơ sở dữ liệu với phiên bản thấp hơn phiên bản hiện tại của nó.

### Lỗi đọc tạm thời và không thể khôi phục

Lỗi đọc xảy ra khi IndexedDB lưu giá trị rồi sau đó không thể đọc lại các giá trị đó, mặc dù các bản ghi liên quan vẫn còn trong cơ sở dữ liệu.

Lỗi đọc có thể thuộc hai loại: **tạm thời** hoặc **không thể khôi phục**.

Lỗi đọc tạm thời được biểu thị bằng kiểu `UnknownError` và thường do thiếu bộ nhớ. Điều này thường không phải vấn đề với cơ sở dữ liệu nhỏ. Để tránh tình trạng thiếu bộ nhớ với cơ sở dữ liệu lớn, hãy cố gắng chia nhỏ quyền truy cập cơ sở dữ liệu để chỉ tải những bản ghi bạn cần tại mỗi thời điểm, chẳng hạn bằng cách dùng các [phạm vi khóa](/en-US/docs/Web/API/IDBKeyRange) cụ thể liên quan đến truy vấn tìm kiếm hoặc cơ chế phân trang của người dùng. Nếu gặp lỗi thiếu bộ nhớ, người dùng có thể được yêu cầu đóng bớt các ứng dụng khác để giải phóng không gian ở mức hệ điều hành.

Lỗi đọc không thể khôi phục được biểu thị bằng kiểu `NotReadableError` và do các tệp nguồn bị xóa.

Ví dụ, một số trình duyệt lưu các giá trị lớn, như blob tệp âm thanh cho ứng dụng podcast ngoại tuyến, thành các tệp riêng biệt được truy cập qua một tham chiếu lưu trong cơ sở dữ liệu. Người ta quan sát thấy rằng các tệp riêng biệt này có thể bị xóa vì chúng hiện ra như các tệp opaque với người dùng khi họ dùng chương trình khôi phục dung lượng đĩa, dẫn đến lỗi đọc không thể khôi phục khi IndexedDB được truy cập lần tiếp theo.

Các hành động khắc phục có thể cho lỗi đọc không thể khôi phục bao gồm thông báo cho người dùng, xóa mục khỏi cơ sở dữ liệu, rồi cố gắng lấy lại dữ liệu từ máy chủ.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra khi cố truy cập thuộc tính nếu request chưa hoàn tất, và do đó lỗi chưa khả dụng.

## Ví dụ

Ví dụ sau yêu cầu một tiêu đề bản ghi nhất định, `onsuccess` lấy bản ghi liên quan từ {{domxref("IDBObjectStore")}} (có sẵn dưới dạng `objectStoreTitleRequest.result`), cập nhật một thuộc tính của bản ghi, rồi đưa bản ghi đã cập nhật trở lại object store. Đồng thời, ở cuối ví dụ có một hàm `onerror` để báo lỗi đã xảy ra nếu request thất bại. Để xem một ví dụ hoạt động đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

```js
const title = "Walk dog";

// Mở transaction như bình thường
const objectStore = db
  .transaction(["toDoList"], "readwrite")
  .objectStore("toDoList");

// Lấy to-do list có tiêu đề đã chỉ định
const objectStoreTitleRequest = objectStore.get(title);

objectStoreTitleRequest.onsuccess = () => {
  // Lấy object dữ liệu được trả về như kết quả
  const data = objectStoreTitleRequest.result;

  // Cập nhật giá trị notified trong object thành "yes"
  data.notified = "yes";

  // Tạo một request khác để chèn mục
  // trở lại cơ sở dữ liệu
  const updateTitleRequest = objectStore.put(data);

  // Khi request mới này thành công, chạy lại hàm displayData()
  // để cập nhật hiển thị
  updateTitleRequest.onsuccess = () => {
    displayData();
  };
};

objectStoreTitleRequest.onerror = () => {
  // Nếu request gặp lỗi, ghi lại lỗi đó
  console.log(
    `Đã xảy ra lỗi khi truy xuất dữ liệu của bạn:
    ${objectStoreTitleRequest.error.name}: ${objectStoreTitleRequest.error.message}`,
  );
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
