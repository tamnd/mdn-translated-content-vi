---
title: "FileSystemEntry: getParent() method"
short-title: getParent()
slug: Web/API/FileSystemEntry/getParent
page-type: web-api-instance-method
browser-compat: api.FileSystemEntry.getParent
---

{{APIRef("File and Directory Entries API")}}

Phương thức **`getParent()`** của giao diện {{domxref("FileSystemEntry")}} lấy một {{domxref("FileSystemDirectoryEntry")}}.

## Cú pháp

```js-nolint
getParent(successCallback, errorCallback)
getParent(successCallback)
```

### Tham số

- `successCallback`
  - : Hàm được gọi khi mục thư mục cha đã được lấy. Callback nhận một tham số đầu vào duy nhất: một đối tượng {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục cha. Thư mục cha của thư mục gốc được coi là chính thư mục gốc đó, vì vậy hãy chú ý xử lý trường hợp này.
- `errorCallback` {{optional_inline}}
  - : Callback tùy chọn được thực thi nếu xảy ra lỗi. Có một tham số duy nhất: một {{domxref("DOMException")}} mô tả lỗi xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `DOMException.INVALID_STATE_ERR`
  - : Thao tác thất bại vì trạng thái của hệ thống tệp không cho phép. Điều này có thể xảy ra, ví dụ, khi trạng thái đã lưu trong bộ nhớ cache của hệ thống tệp khác với trạng thái thực tế của hệ thống tệp.
- `DOMException.NOT_FOUND_ERR`
  - : Đường dẫn được chỉ định không tìm thấy.
- `DOMException.SECURITY_ERR`
  - : Các hạn chế bảo mật ngăn cản việc lấy thông tin về thư mục cha.

## Ví dụ

Ví dụ này đổi tên tệp được chỉ định bởi biến `fileEntry` thành `"newname.html"`.

```js
fileEntry.getParent(
  (parent) => {
    fileEntry.moveTo(parent, "newname.html", (updatedEntry) => {
      console.log(`File ${fileEntry.name} renamed to newname.html.`);
    });
  },
  (error) => {
    console.error(
      `An error occurred: Unable to rename ${fileEntry.name} to newname.html.`,
    );
  },
);
```

Điều này được thực hiện bằng cách trước tiên lấy đối tượng {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục hiện tại chứa tệp. Sau đó {{domxref("FileSystemEntry.moveTo", "moveTo()")}} được sử dụng để đổi tên tệp trong thư mục đó.

## Sử dụng Promise

Hiện tại, không có phiên bản dựa trên {{jsxref("Promise")}} của phương thức này. Tuy nhiên, bạn có thể tạo một hàm trợ giúp đơn giản để thích nghi nó, như sau:

```js
function getParentPromise(entry) {
  return new Promise((resolve, reject) => {
    entry.getParent(resolve, reject);
  });
}
```

Cách tiếp cận tương tự có thể được áp dụng ở những nơi khác trong File and Directory Entries API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
