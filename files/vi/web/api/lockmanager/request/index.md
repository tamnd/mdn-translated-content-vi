---
title: "LockManager: phương thức request()"
short-title: request()
slug: Web/API/LockManager/request
page-type: web-api-instance-method
browser-compat: api.LockManager.request
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Phương thức **`request()`** của giao diện {{domxref("LockManager")}} yêu cầu đối tượng {{domxref('Lock')}} với các tham số chỉ định tên và đặc điểm của nó. `Lock` được yêu cầu được truyền vào một callback, trong khi bản thân hàm trả về một {{jsxref('Promise')}} được giải quyết (hoặc từ chối) với kết quả của callback sau khi khóa được giải phóng, hoặc từ chối nếu yêu cầu bị hủy bỏ.

Thuộc tính `mode` của tham số `options` có thể là `"exclusive"` hoặc `"shared"`.

Yêu cầu khóa `"exclusive"` khi nó chỉ nên được giữ bởi một phiên bản mã tại một thời điểm. Điều này áp dụng cho mã trong cả tab và worker. Sử dụng điều này để đại diện cho quyền truy cập loại trừ lẫn nhau vào tài nguyên. Khi khóa `"exclusive"` cho tên nhất định đang được giữ, không có khóa nào khác có cùng tên có thể được giữ.

Yêu cầu khóa `"shared"` khi nhiều phiên bản mã có thể chia sẻ quyền truy cập vào tài nguyên. Khi khóa `"shared"` cho tên nhất định đang được giữ, các khóa `"shared"` khác cho cùng tên có thể được cấp, nhưng không có khóa `"exclusive"` nào với tên đó có thể được giữ hoặc cấp.

Mẫu khóa chia sẻ/độc quyền này phổ biến trong kiến trúc giao dịch cơ sở dữ liệu, ví dụ để cho phép nhiều người đọc đồng thời (mỗi người yêu cầu khóa `"shared"`) nhưng chỉ một người viết (một khóa `"exclusive"` duy nhất). Đây được gọi là mẫu readers-writer. Trong [IndexedDB API](/en-US/docs/Web/API/IndexedDB_API), điều này được thể hiện là các giao dịch `"readonly"` và `"readwrite"` có cùng ngữ nghĩa.

## Cú pháp

```js-nolint
request(name, callback)
request(name, options, callback)
```

### Tham số

- `name`
  - : Định danh cho khóa bạn muốn yêu cầu.

- `options` {{optional_inline}}
  - : Đối tượng mô tả đặc điểm của khóa bạn muốn tạo. Các giá trị hợp lệ là:
    - `mode` {{optional_inline}}
      - : Hoặc là `"exclusive"` hoặc `"shared"`. Giá trị mặc định là `"exclusive"`.

    - `ifAvailable` {{optional_inline}}
      - : Nếu `true`, yêu cầu khóa sẽ chỉ được cấp nếu nó chưa được giữ. Nếu không thể cấp, callback sẽ được gọi với `null` thay vì phiên bản `Lock`. Giá trị mặc định là `false`.

    - `steal` {{optional_inline}}
      - : Nếu `true`, thì bất kỳ khóa đang giữ nào có cùng tên sẽ được giải phóng, và yêu cầu sẽ được cấp, ưu tiên hơn bất kỳ yêu cầu nào trong hàng đợi cho nó. Giá trị mặc định là `false`.

        > [!WARNING]
        > Sử dụng cẩn thận! Mã đang chạy trước đó bên trong khóa tiếp tục chạy và có thể xung đột với mã hiện đang giữ khóa.

    - `signal` {{optional_inline}}
      - : Một {{domxref("AbortSignal")}} (thuộc tính {{domxref("AbortController.signal", "signal")}} của {{domxref("AbortController")}}); nếu được chỉ định và {{domxref("AbortController")}} bị hủy bỏ, yêu cầu khóa sẽ bị bỏ nếu chưa được cấp.

- `callback`
  - : Phương thức được gọi khi khóa được cấp. Khóa tự động được giải phóng khi callback trả về (hoặc khi ngoại lệ được ném). Thông thường callback là hàm async, khiến khóa chỉ được giải phóng khi hàm async hoàn toàn kết thúc.

### Giá trị trả về

Một {{jsxref('Promise')}} được giải quyết (hoặc từ chối) với kết quả của callback sau khi khóa được giải phóng, hoặc từ chối nếu yêu cầu bị hủy bỏ.

### Ngoại lệ

Phương thức này có thể trả về một promise bị từ chối với {{domxref("DOMException")}} của một trong các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu tài liệu của môi trường không hoàn toàn hoạt động.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu không thể lấy trình quản lý khóa cho môi trường hiện tại.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `name` bắt đầu bằng dấu gạch ngang (`-`), cả hai tùy chọn `steal` và `ifAvailable` đều là `true`, hoặc nếu tùy chọn `signal` tồn tại và _hoặc_ tùy chọn `steal` hoặc `ifAvailable` là `true`.
- `AbortError` {{domxref("DOMException")}}
  - : Được ném nếu tùy chọn `signal` tồn tại và bị hủy bỏ.

## Ví dụ

### Ví dụ chung

Ví dụ sau đây cho thấy cách sử dụng cơ bản của phương thức `request()` với một hàm không đồng bộ làm callback. Sau khi callback được gọi, không có mã nào khác đang chạy trên origin này có thể giữ `my_resource` cho đến khi callback trả về.

```js
await navigator.locks.request("my_resource", async (lock) => {
  // The lock was granted.
});
```

### Ví dụ `mode`

Ví dụ sau đây cho thấy cách sử dụng tùy chọn `mode` cho người đọc và người viết.

```js
async function doRead() {
  await navigator.locks.request(
    "my_resource",
    { mode: "shared" },
    async (lock) => {
      // Read code here.
    },
  );
}
```

```js
async function doWrite() {
  await navigator.locks.request(
    "my_resource",
    { mode: "exclusive" },
    async (lock) => {
      // Write code here.
    },
  );
}
```

### Ví dụ `ifAvailable`

Để lấy khóa chỉ khi nó chưa được giữ, sử dụng tùy chọn `ifAvailable`.

```js
await navigator.locks.request(
  "my_resource",
  { ifAvailable: true },
  async (lock) => {
    if (!lock) {
      // The lock was not granted - get out fast.
      return;
    }

    // The lock was granted, and no other running code in this origin is holding
    // the 'my_res_lock' lock until this returns.
  },
);
```

### Ví dụ `signal`

Để chỉ chờ khóa trong một khoảng thời gian ngắn, sử dụng tùy chọn `signal`.

```js
const controller = new AbortController();
// Wait at most 200ms.
setTimeout(() => controller.abort(), 200);

try {
  await navigator.locks.request(
    "my_resource",
    { signal: controller.signal },
    async (lock) => {
      // The lock was acquired!
    },
  );
} catch (ex) {
  if (ex.name === "AbortError") {
    // The request aborted before it could be granted.
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
