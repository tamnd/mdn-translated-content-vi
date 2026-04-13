---
title: "FileSystemWritableFileStream: write() method"
short-title: write()
slug: Web/API/FileSystemWritableFileStream/write
page-type: web-api-instance-method
browser-compat: api.FileSystemWritableFileStream.write
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`write()`** của giao diện {{domxref("FileSystemWritableFileStream")}} ghi nội dung vào tệp mà phương thức được gọi, tại vị trí con trỏ tệp hiện tại.

Không có thay đổi nào được ghi vào tệp thực sự trên đĩa cho đến khi luồng được đóng.
Các thay đổi thường được ghi vào một tệp tạm thời thay thế. Phương thức này cũng có thể được sử dụng để tìm kiếm một điểm byte trong luồng và cắt ngắn để sửa đổi tổng số byte mà tệp chứa.

## Cú pháp

```js-nolint
write(data)
```

### Tham số

- `data`
  - : Có thể là một trong các loại sau:
    - Dữ liệu tệp cần ghi, dưới dạng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref('Blob')}}, hoặc chuỗi.
    - Một đối tượng chứa các thuộc tính sau:
      - `type`
        - : Một chuỗi là một trong `"write"`, `"seek"`, hoặc `"truncate"`.
      - `data`
        - : Dữ liệu tệp cần ghi. Có thể là {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref('Blob')}}, hoặc chuỗi. Thuộc tính này bắt buộc nếu `type` được đặt là `"write"`.
      - `position`
        - : Vị trí byte mà con trỏ tệp hiện tại nên di chuyển đến nếu sử dụng `"seek"`. Cũng có thể được đặt nếu `type` là `"write"`, trong trường hợp đó việc ghi sẽ bắt đầu tại vị trí được chỉ định.
      - `size`
        - : Một số đại diện cho số byte mà luồng nên chứa. Thuộc tính này bắt buộc nếu `type` được đặt là `"truncate"`.

### Giá trị trả về

Một {{jsxref('Promise')}} trả về `undefined`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} không phải là `granted`.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu kích thước mới của tệp lớn hơn kích thước gốc của tệp và vượt quá [hạn ngạch lưu trữ](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) của trình duyệt.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `data` không được xác định, hoặc nếu `position` hoặc `size` không hợp lệ.

## Ví dụ

Hàm bất đồng bộ sau đây mở hộp thoại 'Save File', trả về {{domxref('FileSystemFileHandle')}} khi một tệp được chọn. Từ đó, một luồng ghi được tạo bằng phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

Sau đó, một chuỗi văn bản được ghi vào luồng, và luồng được đóng lại.

```js
async function saveFile() {
  try {
    // create a new handle
    const newHandle = await window.showSaveFilePicker();

    // create a FileSystemWritableFileStream to write to
    const writableStream = await newHandle.createWritable();

    // write our file
    await writableStream.write("This is my file content");

    // close the file and write the contents to disk.
    await writableStream.close();
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

Các ví dụ sau đây cho thấy các tùy chọn khác nhau có thể được truyền vào phương thức `write()`.

```js
// just pass in the data (no options)
writableStream.write(data);

// writes the data to the stream from the determined position
writableStream.write({ type: "write", position, data });

// updates the current file cursor offset to the position specified
writableStream.write({ type: "seek", position });

// resizes the file to be size bytes long
writableStream.write({ type: "truncate", size });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
