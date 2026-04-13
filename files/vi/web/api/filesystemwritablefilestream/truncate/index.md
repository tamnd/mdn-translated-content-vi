---
title: "FileSystemWritableFileStream: truncate() method"
short-title: truncate()
slug: Web/API/FileSystemWritableFileStream/truncate
page-type: web-api-instance-method
browser-compat: api.FileSystemWritableFileStream.truncate
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`truncate()`** của giao diện {{domxref("FileSystemWritableFileStream")}} thay đổi kích thước tệp liên kết với luồng thành kích thước được chỉ định tính bằng byte.

Nếu kích thước được chỉ định lớn hơn kích thước tệp hiện tại, tệp sẽ được đệm bằng các byte `0x00`.

Con trỏ tệp cũng được cập nhật khi `truncate()` được gọi.
Nếu offset nhỏ hơn kích thước, nó vẫn không thay đổi.
Nếu offset lớn hơn kích thước, offset được đặt thành kích thước đó.
Điều này đảm bảo các lần ghi tiếp theo không gặp lỗi.

Không có thay đổi nào được ghi vào tệp thực sự trên đĩa cho đến khi luồng được đóng.
Các thay đổi thường được ghi vào một tệp tạm thời thay thế.

## Cú pháp

```js-nolint
truncate(size)
```

### Tham số

- `size`
  - : Một số xác định số byte để thay đổi kích thước luồng.

### Giá trị trả về

Một {{jsxref('Promise')}} trả về `undefined`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} không phải là `granted`.
- {{domxref("QuotaExceededError")}}
  - : Được ném ra nếu kích thước mới của tệp lớn hơn kích thước gốc của tệp và vượt quá [hạn ngạch lưu trữ](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria) của trình duyệt.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `size` không phải là số hoặc không được xác định.

## Ví dụ

Hàm bất đồng bộ sau đây mở hộp thoại 'Save File', trả về {{domxref('FileSystemFileHandle')}} khi một tệp được chọn. Từ đó, một luồng ghi được tạo bằng phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

Tiếp theo, chúng ta ghi vào luồng:

1. Một chuỗi văn bản được ghi vào luồng.
2. Phương thức `truncate()` được sử dụng để thay đổi kích thước tệp thành 8 byte.
3. Một chuỗi văn bản thứ hai được ghi vào đầu luồng, ghi đè lần ghi đầu tiên.

Sau đó luồng được đóng lại.

```js
async function saveFile() {
  try {
    // create a new handle
    const newHandle = await window.showSaveFilePicker();

    // create a FileSystemWritableFileStream to write to
    const writableStream = await newHandle.createWritable();

    // write our file
    await writableStream.write("This is my first file content");
    await writableStream.truncate(8);
    await writableStream.write("my second file content");

    // close the file and write the contents to disk.
    await writableStream.close();
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

Nếu bạn chạy hàm trên và sau đó mở tệp kết quả được tạo trên đĩa, bạn sẽ thấy văn bản "This is my second file content".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
