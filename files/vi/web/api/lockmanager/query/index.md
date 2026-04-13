---
title: "LockManager: phương thức query()"
short-title: query()
slug: Web/API/LockManager/query
page-type: web-api-instance-method
browser-compat: api.LockManager.query
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Phương thức **`query()`** của giao diện {{domxref("LockManager")}} trả về {{jsxref('Promise')}} được giải quyết với đối tượng chứa thông tin về các khóa đang giữ và đang chờ.

## Cú pháp

```js-nolint
query()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được giải quyết với đối tượng chứa ảnh chụp trạng thái {{domxref("LockManager")}}. Đối tượng có các thuộc tính sau:

- `held`
  - : Mảng các đối tượng `LockInfo` cho các khóa đang giữ.
- `pending`
  - : Mảng các đối tượng `LockInfo` cho các yêu cầu khóa đang chờ.

Đối tượng `LockInfo` có thể có các thuộc tính sau:

- `name`
  - : Tên được truyền vào {{domxref("LockManager.request()")}} khi khóa được yêu cầu.
- `mode`
  - : Chế độ truy cập được truyền vào {{domxref("LockManager.request()")}} khi khóa được yêu cầu. Chế độ là `"exclusive"` hoặc `"shared"`.
- `clientId`
  - : Định danh duy nhất của ngữ cảnh nơi {{domxref("LockManager.request()")}} được gọi. Đây là cùng giá trị với {{domxref("Client.id")}}.

### Ngoại lệ

Phương thức này có thể trả về một promise bị từ chối với {{domxref("DOMException")}} của một trong các loại sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu tài liệu của môi trường không hoàn toàn hoạt động.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu không thể lấy trình quản lý khóa cho môi trường hiện tại.

## Ví dụ

```js
const state = await navigator.locks.query();
for (const lock of state.held) {
  console.log(`held lock: name ${lock.name}, mode ${lock.mode}`);
}
for (const request of state.pending) {
  console.log(`requested lock: name ${request.name}, mode ${request.mode}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
