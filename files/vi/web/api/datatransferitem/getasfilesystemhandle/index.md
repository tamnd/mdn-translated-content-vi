---
title: "DataTransferItem: phương thức getAsFileSystemHandle()"
short-title: getAsFileSystemHandle()
slug: Web/API/DataTransferItem/getAsFileSystemHandle
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.DataTransferItem.getAsFileSystemHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{SeeCompatTable}}

Phương thức **`getAsFileSystemHandle()`** của giao diện {{domxref("DataTransferItem")}} trả về một {{jsxref('Promise')}} được hoàn thành với một {{domxref('FileSystemFileHandle')}} nếu mục được kéo là tệp, hoặc được hoàn thành với một {{domxref('FileSystemDirectoryHandle')}} nếu mục được kéo là thư mục.

## Cú pháp

```js-nolint
getAsFileSystemHandle()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}}.

Nếu thuộc tính {{domxref("DataTransferItem.kind", "kind")}} của mục là `"file"` và mục này được truy cập trong trình xử lý sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}} hoặc {{domxref("HTMLElement/drop_event", "drop")}}, thì promise được trả về sẽ được hoàn thành với một {{domxref('FileSystemFileHandle')}} nếu mục được kéo là tệp hoặc một {{domxref('FileSystemDirectoryHandle')}} nếu mục được kéo là thư mục.

Ngược lại, promise được hoàn thành với `null`.

### Ngoại lệ

Không có.

## Ví dụ

Ví dụ này sử dụng phương thức `getAsFileSystemHandle()` để trả về {{domxref('FileSystemHandle', 'file handles', '', 'nocode')}} cho các mục được thả xuống.

> [!NOTE]
> Vì `getAsFileSystemHandle()` chỉ có thể lấy handle của mục trong cùng tick với trình xử lý sự kiện `drop`, không được có `await` trước nó. Đó là lý do tại sao chúng ta gọi `getAsFileSystemHandle()` đồng bộ cho tất cả các mục trước, sau đó chờ kết quả của chúng đồng thời.

```js
elem.addEventListener("dragover", (e) => {
  // Prevent navigation.
  e.preventDefault();
});
elem.addEventListener("drop", async (e) => {
  // Prevent navigation.
  e.preventDefault();
  const handlesPromises = [...e.dataTransfer.items]
    // kind will be 'file' for file/directory entries.
    .filter((x) => x.kind === "file")
    .map((x) => x.getAsFileSystemHandle());
  const handles = await Promise.all(handlesPromises);

  // Process all of the items.
  for (const handle of handles) {
    if (handle.kind === "file") {
      // run code for if handle is a file
    } else if (handle.kind === "directory") {
      // run code for is handle is a directory
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
