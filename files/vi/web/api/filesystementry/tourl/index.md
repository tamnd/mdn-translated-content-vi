---
title: "FileSystemEntry: toURL() method"
short-title: toURL()
slug: Web/API/FileSystemEntry/toURL
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemEntry.toURL
---

{{APIRef("File and Directory Entry API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`toURL()`** của giao diện {{domxref("FileSystemEntry")}} tạo và trả về một chuỗi chứa URL có thể được sử dụng để xác định mục hệ thống tệp. Điều này được thực hiện bằng cách hiển thị một sơ đồ URL mới `filesystem:` có thể được dùng làm giá trị của thuộc tính `src` và `href`.

## Cú pháp

```js-nolint
toURL()
toURL(mimeType)
```

### Tham số

- `mimeType` {{optional_inline}}
  - : Một chuỗi tùy chọn xác định kiểu MIME để sử dụng khi diễn giải tệp. Điều này có thể giúp xử lý các tệp có kiểu không được tác nhân người dùng nhận dạng tự động. Nếu tham số này bị bỏ qua, tác nhân người dùng sẽ sử dụng các thuật toán tiêu chuẩn để nhận dạng tệp.

### Giá trị trả về

Một chuỗi chứa URL có thể được sử dụng làm tài liệu tham chiếu trong nội dung HTML, hoặc chuỗi rỗng nếu URL không thể tạo được (chẳng hạn như khi việc triển khai hệ thống tệp không hỗ trợ `toURL()`).

## Ví dụ

Nếu bạn có {{domxref("FileSystemFileEntry")}} tương ứng với tệp hình ảnh trong hệ thống tệp của trang web hoặc ứng dụng, bạn có thể gọi `toURL()` để lấy URL của nó để sử dụng trong HTML. Nếu trang web của bạn đặt tại `http://my-awesome-website.woot` và bạn có hệ thống tệp tạm thời chứa tệp hình ảnh tên `awesome-sauce.jpg`, URL được trả về bởi `toURL()` có thể (tùy thuộc vào triển khai của trình duyệt) là `"filesystem:http://my-awesome-website.woot/temporary/awesome-sauce.jpg"`.

Mã sử dụng điều này có thể như sau:

```js
const img = document.createElement("img");
img.src = imageFileEntry.toURL();
img.alt = "";
document.body.appendChild(img);
```

Giả sử tình huống được đề cập trước đoạn mã, kết quả sẽ là HTML như thế này được thêm vào cuối tài liệu:

```html
<img
  src="filesystem:http://my-awesome-website.woot/temporary/awesome-sauce.jpg"
  alt="" />
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryEntry.removeRecursively()")}}
