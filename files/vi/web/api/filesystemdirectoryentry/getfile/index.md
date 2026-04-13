---
title: "FileSystemDirectoryEntry: getFile() method"
short-title: getFile()
slug: Web/API/FileSystemDirectoryEntry/getFile
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryEntry.getFile
---

{{APIRef("File and Directory Entries API")}}

Phương thức **`getFile()`** của giao diện {{domxref("FileSystemDirectoryEntry")}} trả về một đối tượng {{domxref("FileSystemFileEntry")}} tương ứng với một tệp nằm ở đâu đó trong cây thư mục con bắt đầu từ thư mục mà nó được gọi.

## Cú pháp

```js-nolint
getFile()
getFile(path)
getFile(path, options)
getFile(path, options, successCallback)
getFile(path, options, successCallback, errorCallback)
```

### Tham số

- `path` {{optional_inline}}
  - : Một chuỗi chỉ định đường dẫn, tương đối với thư mục mà phương thức được gọi, mô tả mục tệp nào cần trả về.
- `options` {{optional_inline}}
  - : Một đối tượng cho phép bạn chỉ định có tạo mục hay không nếu nó bị thiếu và có phải là lỗi nếu tệp đã tồn tại hay không.
- `successCallback` {{optional_inline}}
  - : Một phương thức được gọi khi {{domxref("FileSystemFileEntry")}} đã được tạo. Phương thức nhận một tham số đơn: đối tượng `FileSystemFileEntry` đại diện cho tệp.
- `errorCallback` {{optional_inline}}
  - : Một phương thức được gọi nếu xảy ra lỗi. Nhận một tham số đầu vào duy nhất là đối tượng {{domxref("DOMException")}} mô tả lỗi xảy ra.

#### Tham số `options`

Đối tượng tham số `options` chấp nhận các tham số sau:

- `create` {{optional_inline}}
  - : Nếu thuộc tính này là `true` và tệp được yêu cầu không tồn tại, tác nhân người dùng sẽ tạo nó. Mặc định là `false`. Thư mục cha phải đã tồn tại.
- `exclusive` {{optional_inline}}
  - : Nếu `true` và tùy chọn `create` cũng là `true`, tệp không được tồn tại trước khi phát lệnh gọi. Mặc định là `false`. Tham số này bị bỏ qua nếu `create` là `false`.

| Tùy chọn `create` | Tùy chọn `exclusive` | Điều kiện đường dẫn                | Kết quả                                                                                                                 |
| ----------------- | -------------------- | ---------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `false`           | _Bị bỏ qua_          | Đường dẫn tồn tại và là tệp        | `successCallback` được gọi với {{domxref("FileSystemFileEntry")}}.                                                      |
| `false`           | _Bị bỏ qua_          | Đường dẫn tồn tại nhưng là thư mục | `errorCallback` được gọi với mã lỗi thích hợp (nếu callback được cung cấp).                                             |
| `true`            | `false`              | Đường dẫn tồn tại                  | Tệp hiện tại bị xóa và thay thế bằng tệp mới, sau đó `successCallback` được gọi với {{domxref("FileSystemFileEntry")}}. |
| `true`            | `false`              | Đường dẫn không tồn tại            | Tệp được tạo, sau đó {{domxref("FileSystemFileEntry")}} được truyền vào `successCallback`.                              |
| `true`            | `true`               | Đường dẫn tồn tại                  | `errorCallback` được gọi với lỗi thích hợp, chẳng hạn `DOMException.PATH_EXISTS_ERR`.                                   |
| `true`            | `true`               | Đường dẫn không tồn tại            | Tệp được tạo, sau đó {{domxref("FileSystemFileEntry")}} được truyền vào `successCallback`.                              |

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu tùy chọn `create` không được chỉ định (hoặc được chỉ định là `false`), và tệp không tồn tại.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu yêu cầu truy cập tệp bị từ chối vì lý do bảo mật.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Được ném ra nếu đường dẫn được chỉ định không phải là tệp; có thể là thư mục, hoặc bộ mô tả tệp không được hỗ trợ như một đường ống; điều này phụ thuộc vào tác nhân người dùng ở một mức độ nào đó.

## Ví dụ

Trong ví dụ này, hàm tìm một tệp JSON trong thư mục dữ liệu ứng dụng của người dùng chứa từ điển người dùng cho ngôn ngữ được chỉ định, sau đó tải từ điển đó.

```js
let dictionary = null;

function loadDictionaryForLanguage(appDataDirEntry, lang) {
  dictionary = null;

  appDataDirEntry.getDirectory("Dictionaries", {}, (dirEntry) => {
    dirEntry.getFile(`${lang}-dict.json`, {}, (fileEntry) => {
      fileEntry.file((dictFile) => {
        let reader = new FileReader();

        reader.addEventListener("loadend", () => {
          dictionary = JSON.parse(reader.result);
        });

        reader.readAsText(dictFile);
      });
    });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Mục Tệp và Thư mục](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemFileEntry")}}
