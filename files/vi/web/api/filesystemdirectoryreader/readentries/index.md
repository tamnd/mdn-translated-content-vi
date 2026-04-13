---
title: "FileSystemDirectoryReader: readEntries() method"
short-title: readEntries()
slug: Web/API/FileSystemDirectoryReader/readEntries
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryReader.readEntries
---

{{APIRef("File and Directory Entries API")}}

Phương thức **`readEntries()`** của giao diện {{domxref("FileSystemDirectoryReader")}} lấy các mục nhập thư mục trong thư mục đang được đọc và cung cấp chúng trong một mảng cho hàm callback được cung cấp.

Các đối tượng trong mảng đều dựa trên {{domxref("FileSystemEntry")}}. Thông thường, chúng là các đối tượng {{domxref("FileSystemFileEntry")}} đại diện cho các tệp tiêu chuẩn, hoặc các đối tượng {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục.

## Cú pháp

```js-nolint
readEntries(successCallback)
readEntries(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Hàm được gọi khi nội dung thư mục đã được lấy. Hàm nhận một tham số đầu vào duy nhất: một mảng các đối tượng mục nhập hệ thống tệp, mỗi đối tượng dựa trên {{domxref("FileSystemEntry")}}. Thông thường, chúng là các đối tượng {{domxref("FileSystemFileEntry")}} đại diện cho các tệp tiêu chuẩn, hoặc các đối tượng {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục. Nếu không còn tệp nào nữa, hoặc bạn đã gọi `readEntries()` trên {{domxref("FileSystemDirectoryReader")}} này rồi, mảng sẽ rỗng.
- `errorCallback` {{optional_inline}}
  - : Hàm callback được gọi nếu xảy ra lỗi khi đọc từ thư mục. Nó nhận một tham số đầu vào: một đối tượng {{domxref("DOMException")}} mô tả lỗi đã xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem [`DataTransferItem.webkitGetAsEntry()`](/en-US/docs/Web/API/DataTransferItem/webkitGetAsEntry#examples) để biết mã ví dụ sử dụng phương thức này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

Trong các trình duyệt dựa trên Chromium, `readEntries()` chỉ trả về 100 đối tượng `FileSystemEntry` đầu tiên. Để có được tất cả các đối tượng, `readEntries()` phải được gọi nhiều lần.

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryEntry")}}
- {{domxref("FileSystem")}}
