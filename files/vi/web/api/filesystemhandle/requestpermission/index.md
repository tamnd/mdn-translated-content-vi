---
title: "FileSystemHandle: phương thức requestPermission()"
short-title: requestPermission()
slug: Web/API/FileSystemHandle/requestPermission
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.FileSystemHandle.requestPermission
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức **`requestPermission()`** của giao diện {{domxref("FileSystemHandle")}} yêu cầu quyền đọc hoặc đọc-ghi cho file handle.

## Cú pháp

```js-nolint
requestPermission(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một object chỉ định chế độ quyền cần truy vấn. Các tùy chọn như sau:
    - `'mode'` {{optional_inline}}
      - : Có thể là `'read'`, `'write'` hoặc `'readwrite'`.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve với {{domxref('PermissionStatus.state')}} là một trong `'granted'`, `'denied'` hoặc `'prompt'`. Nó cũng có thể reject với một trong các ngoại lệ bên dưới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu không chỉ định tham số nào hoặc `mode` không phải là `'read'`, `'write'` hoặc `'readwrite'`.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Phương thức được gọi trong ngữ cảnh không cùng origin với ngữ cảnh cấp cao nhất, tức một iframe khác origin.
    - Không có kích hoạt người dùng tạm thời, chẳng hạn một lần nhấn nút. Điều này bao gồm cả trường hợp handle nằm trong ngữ cảnh không phải `Window` không thể tiêu thụ kích hoạt người dùng, chẳng hạn worker.

## Bảo mật

Yêu cầu có [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc một phần tử giao diện để tính năng này hoạt động.

## Ví dụ

Hàm bất đồng bộ sau yêu cầu quyền nếu chúng chưa được cấp.

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
