---
title: "FileSystemSyncAccessHandle: truncate() method"
short-title: truncate()
slug: Web/API/FileSystemSyncAccessHandle/truncate
page-type: web-api-instance-method
browser-compat: api.FileSystemSyncAccessHandle.truncate
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`truncate()`** của giao diện {{domxref("FileSystemSyncAccessHandle")}} thay đổi kích thước tệp liên kết với handle thành số byte được chỉ định.

> [!NOTE]
> Trong các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và `truncate()` được chỉ định sai là phương thức bất đồng bộ. Tuy nhiên, tất cả các trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng là phương thức đồng bộ.

## Cú pháp

```js-nolint
truncate(newSize)
```

### Tham số

- `newSize`
  - : Số byte để thay đổi kích thước tệp thành.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu access handle liên kết đã bị đóng, hoặc nếu việc sửa đổi dữ liệu nhị phân của tệp thất bại.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu `newSize` lớn hơn kích thước ban đầu của tệp và vượt quá [hạn ngạch lưu trữ](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) của trình duyệt.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu hệ thống tệp cơ bản không hỗ trợ đặt kích thước tệp thành kích thước mới.

## Ví dụ

```js
async function truncateFile() {
  // Get handle to draft file
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Get sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // Truncate the file to 0 bytes
  accessHandle.truncate(0);

  // Persist changes to disk.
  accessHandle.flush();

  // Always close FileSystemSyncAccessHandle if done.
  accessHandle.close();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
