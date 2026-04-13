---
title: Web Locks API
slug: Web/API/Web_Locks_API
page-type: web-api-overview
browser-compat:
  - api.LockManager
  - api.Lock
spec-urls: https://w3c.github.io/web-locks/
---

{{DefaultAPISidebar("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

**Web Locks API** cho phép các script chạy trong một tab hoặc worker bất đồng bộ thu hồi một khóa (lock), giữ nó trong khi thực hiện công việc, sau đó giải phóng nó. Trong khi đang giữ khóa, không có script nào khác thực thi trong cùng origin có thể thu hồi cùng khóa đó, điều này cho phép ứng dụng web chạy trong nhiều tab hoặc worker phối hợp công việc và sử dụng tài nguyên.

## Khái niệm và cách sử dụng

Một khóa là một khái niệm trừu tượng đại diện cho một tài nguyên có thể được chia sẻ, được xác định bởi một tên do ứng dụng web chọn. Ví dụ, nếu một ứng dụng web chạy trong nhiều tab muốn đảm bảo rằng chỉ có một tab đang đồng bộ dữ liệu giữa mạng và Indexed DB, mỗi tab có thể cố gắng thu hồi khóa "my_net_db_sync", nhưng chỉ có một tab sẽ thành công (mẫu bầu chọn leader).

API được sử dụng như sau:

1. Yêu cầu khóa.
2. Thực hiện công việc trong khi giữ khóa trong một tác vụ bất đồng bộ.
3. Khóa tự động được giải phóng khi tác vụ hoàn thành.

```js
navigator.locks.request("my_resource", async (lock) => {
  // Khóa đã được thu hồi.
  await do_something();
  await do_something_else();
  // Bây giờ khóa sẽ được giải phóng.
});
```

Trong khi khóa đang được giữ, các yêu cầu về cùng khóa từ ngữ cảnh thực thi này, hoặc từ các tab/worker khác, sẽ được xếp hàng. Yêu cầu đầu tiên trong hàng đợi sẽ chỉ được cấp khi khóa được giải phóng.

API cung cấp chức năng tùy chọn có thể được sử dụng khi cần, bao gồm:

- trả về giá trị từ tác vụ bất đồng bộ
- chế độ khóa chia sẻ và độc quyền
- thu hồi có điều kiện
- chẩn đoán để truy vấn trạng thái khóa trong một origin
- một lối thoát để bảo vệ chống deadlock

Điểm vào chính là {{domxref("LockManager.request", "navigator.locks.request()")}} yêu cầu một khóa. Nó nhận tên khóa, một tập tùy chọn, và một callback. Callback được gọi khi khóa được cấp. Khóa tự động được giải phóng khi callback trả về, vì vậy thông thường callback là một _async function_, khiến khóa chỉ được giải phóng khi async function hoàn thành hoàn toàn.

### Tùy chọn

Một số tùy chọn có thể được truyền khi yêu cầu khóa:

- `mode`: Chế độ mặc định là "exclusive", nhưng có thể chỉ định "shared". Chỉ có thể có một người giữ "exclusive" của một khóa, nhưng nhiều yêu cầu "shared" có thể được cấp cùng lúc. Điều này có thể được dùng để triển khai mẫu readers-writer.
- `ifAvailable`: Nếu được chỉ định, yêu cầu khóa sẽ thất bại nếu khóa không thể được cấp ngay lập tức mà không cần chờ. Callback được gọi với `null`.
- `steal`: Nếu được chỉ định, thì bất kỳ khóa đang giữ nào có cùng tên sẽ được giải phóng, và yêu cầu sẽ được cấp, ưu tiên bất kỳ yêu cầu nào đang xếp hàng.
- `signal`: Một {{domxref("AbortSignal")}} có thể được truyền vào, cho phép yêu cầu khóa bị hủy. Điều này có thể được dùng để triển khai timeout trên các yêu cầu.

### Giám sát

Phương thức {{domxref("LockManager.query", "navigator.locks.query()")}} có thể được các script dùng để xem xét trạng thái của lock manager cho origin. Điều này có thể hữu ích khi gỡ lỗi, ví dụ, xác định tại sao một khóa không thể được thu hồi.

## Giao diện

- {{domxref("Lock")}}
  - : Cung cấp tên và chế độ của một khóa đã được yêu cầu trước đó, nhận được trong callback của {{domxref("LockManager.request()")}}.
- {{domxref("LockManager")}}
  - : Cung cấp các phương thức để yêu cầu đối tượng {{domxref("Lock")}} mới và truy vấn đối tượng {{domxref('Lock')}} hiện có.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.locks")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("LockManager")}} cung cấp các phương thức để yêu cầu đối tượng {{domxref('Lock')}} mới và truy vấn đối tượng {{domxref('Lock')}} hiện có.
- {{domxref("WorkerNavigator.locks")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{DOMxRef("LockManager")}} cung cấp các phương thức để yêu cầu đối tượng {{DOMxRef('Lock')}} mới và truy vấn đối tượng {{domxref('Lock')}} hiện có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
