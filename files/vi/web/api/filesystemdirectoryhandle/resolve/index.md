---
title: "FileSystemDirectoryHandle: phương thức resolve()"
short-title: resolve()
slug: Web/API/FileSystemDirectoryHandle/resolve
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.resolve
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`resolve()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} trả về một {{jsxref('Array')}} các tên thư mục từ handle cha đến mục con được chỉ định, với tên của mục con là phần tử cuối cùng trong mảng.

## Cú pháp

```js-nolint
resolve(possibleDescendant)
```

### Tham số

- `possibleDescendant`
  - : {{domxref('FileSystemHandle')}} mà từ đó trả về đường dẫn tương đối.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một {{jsxref('Array')}} các chuỗi, hoặc `null` nếu `possibleDescendant` không phải là hậu duệ của {{domxref('FileSystemDirectoryHandle')}} này.

### Ngoại lệ

Không có ngoại lệ nào được ném ra.

## Ví dụ

Hàm bất đồng bộ sau dùng `resolve()` để tìm đường dẫn đến một tệp đã chọn, tương đối với một handle thư mục được chỉ định.

```js
async function returnPathDirectories(directoryHandle) {
  // Lấy một file handle bằng cách hiển thị bộ chọn tệp:
  const [handle] = await self.showOpenFilePicker();
  if (!handle) {
    // Người dùng đã hủy, hoặc không mở được tệp.
    return;
  }

  // Kiểm tra xem handle có tồn tại bên trong handle thư mục của chúng ta không
  const relativePaths = await directoryHandle.resolve(handle);

  if (relativePaths === null) {
    // Không nằm trong handle thư mục
  } else {
    // relativePath là một mảng các tên, biểu thị đường dẫn tương đối
    for (const name of relativePaths) {
      // ghi log từng mục
      console.log(name);
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
