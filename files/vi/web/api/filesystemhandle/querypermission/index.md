---
title: "FileSystemHandle: phương thức queryPermission()"
short-title: queryPermission()
slug: Web/API/FileSystemHandle/queryPermission
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FileSystemHandle.queryPermission
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức **`queryPermission()`** của giao diện {{domxref("FileSystemHandle")}} truy vấn trạng thái quyền hiện tại của handle hiện tại.

## Cú pháp

```js-nolint
queryPermission(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một object chỉ định chế độ quyền cần truy vấn. Các tùy chọn như sau:
    - `'mode'` {{optional_inline}}
      - : Có thể là `'read'`, `'write'` hoặc `'readwrite'`.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve với {{domxref('PermissionStatus.state')}} là một trong `'granted'`, `'denied'` hoặc `'prompt'`. Nó cũng có thể reject với một trong các ngoại lệ bên dưới.

Nếu Promise resolve với `"prompt"`, website sẽ phải gọi `requestPermission()` trước khi có thể thực hiện bất kỳ thao tác nào trên handle. Nếu resolve với `"denied"`, mọi thao tác sẽ bị reject. Thông thường, các handle trả về từ các factory của hệ thống file cục bộ sẽ ban đầu resolve với `"granted"` cho trạng thái quyền đọc. Tuy nhiên, ngoại trừ trường hợp người dùng thu hồi quyền, một handle lấy từ IndexedDB cũng rất có thể resolve với `"prompt"`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `mode` được chỉ định với giá trị khác `'read'`, `'write'` hoặc `'readwrite'`.

## Ví dụ

Hàm bất đồng bộ sau trả về `true` nếu người dùng đã cấp quyền đọc hoặc đọc-ghi cho file handle. Nếu chưa, quyền sẽ được yêu cầu.

```js
// fileHandle là một FileSystemFileHandle
// withWrite là một boolean được đặt thành true nếu muốn ghi

async function verifyPermission(fileHandle, withWrite) {
  const opts = {};
  if (withWrite) {
    opts.mode = "readwrite";
  }

  // Kiểm tra xem chúng ta đã có quyền chưa, nếu có thì trả về true.
  if ((await fileHandle.queryPermission(opts)) === "granted") {
    return true;
  }

  // Yêu cầu quyền với file, nếu người dùng cấp quyền thì trả về true.
  if ((await fileHandle.requestPermission(opts)) === "granted") {
    return true;
  }

  // Người dùng không cấp quyền, trả về false.
  return false;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [File System Access API: đơn giản hóa truy cập tới file cục bộ](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
