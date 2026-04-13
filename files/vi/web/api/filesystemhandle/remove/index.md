---
title: "FileSystemHandle: phương thức remove()"
short-title: remove()
slug: Web/API/FileSystemHandle/remove
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.FileSystemHandle.remove
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}{{SeeCompatTable}}{{Non-standard_header}}

Phương thức **`remove()`** của giao diện {{domxref("FileSystemHandle")}} yêu cầu xóa mục nhập được biểu diễn bởi handle khỏi hệ thống file nền.

Phương thức `remove()` cho phép bạn xóa trực tiếp một file hoặc thư mục từ handle của nó. Nếu không có phương thức này, bạn sẽ phải lấy handle của thư mục cha rồi gọi {{domxref("FileSystemDirectoryHandle.removeEntry()")}} trên đó để xóa nó.

Bạn cũng có thể gọi `remove()` trên thư mục gốc của [Origin Private File System](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) để xóa toàn bộ nội dung của nó; sau đó một OPFS mới, rỗng, sẽ được tạo.

## Cú pháp

```js-nolint
remove()
remove(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object chỉ định các tùy chọn cho thao tác xóa. Các thuộc tính có thể có như sau:
    - `recursive` {{optional_inline}}
      - : Một giá trị boolean mặc định là `false`. Khi đặt thành `true` và mục nhập là thư mục, toàn bộ nội dung của nó sẽ bị xóa đệ quy.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn thành với giá trị `undefined`.

### Ngoại lệ

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Được ném ra nếu `recursive` được đặt thành `false` và mục nhập cần xóa là một thư mục có phần tử con.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể giành được khóa độc quyền trên mục nhập.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus')}} không phải là `granted`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu không tìm thấy mục nhập.

## Ví dụ

Demo [`FileSystemHandle.remove()`](https://mdn.github.io/dom-examples/file-system-api/filesystemhandle-remove/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/filesystemhandle-remove)) là một ứng dụng tạo file. Bạn có thể nhập văn bản vào {{htmlelement("textarea")}} rồi nhấn nút {{htmlelement("button")}} "Save file", và ứng dụng sẽ mở một bộ chọn file cho phép bạn lưu văn bản đó vào hệ thống file cục bộ dưới dạng file văn bản mà bạn chọn. Bạn cũng có thể chọn xóa các file đã tạo.

Ứng dụng không cho phép xem nội dung các file đã tạo và cũng không đồng bộ với hệ thống file nền khi tải lại hoặc đóng trang. Điều này có nghĩa là các file do ứng dụng tạo ra vẫn sẽ tồn tại trên hệ thống file nếu bạn không chọn xóa chúng trước khi tải lại hoặc đóng tab.

File picker, file handle, và bản thân file nếu bạn đang tạo file mới, được tạo bằng {{domxref("window.showSaveFilePicker()")}}. Văn bản được ghi vào file qua {{domxref("FileSystemFileHandle.createWritable()")}}.

Khi một file đã được tạo trên hệ thống file, một mục được tạo trong ứng dụng (xem `processNewFile()` trong mã nguồn):

- Một tham chiếu tới file handle được lưu trong mảng `savedFileRefs` để có thể tham chiếu lại sau này.
- Một mục danh sách được thêm bên dưới tiêu đề "Saved files" trong giao diện, với tên file hiển thị cùng một nút "Delete".

Khi nhấn nút "Delete", hàm `deleteFile()` sẽ chạy, trông như sau:

```js
async function deleteFile(e) {
  for (const handle of savedFileRefs) {
    if (handle.name === `${e.target.id}.txt`) {
      await handle.remove();
      savedFileRefs = savedFileRefs.filter(
        (handle) => handle.name !== `${e.target.id}.txt`,
      );
      e.target.parentElement.parentElement.removeChild(e.target.parentElement);
    }
  }
}
```

Diễn giải:

1. Với mỗi file handle được lưu trong mảng `savedFileRefs`, chúng ta kiểm tra tên của nó xem có khớp với thuộc tính `id` của nút đã kích hoạt sự kiện hay không.
2. Khi tìm thấy phần tử khớp, chúng ta gọi `FileSystemHandle.remove()` trên handle đó để xóa file khỏi hệ thống file nền.
3. Chúng ta cũng loại bỏ handle khớp khỏi mảng `savedFileRefs`.
4. Cuối cùng, chúng ta xóa mục danh sách tương ứng trong giao diện người dùng.

## Thông số kỹ thuật

Tính năng này chưa thuộc về bất kỳ đặc tả nào, nhưng có thể trở thành tiêu chuẩn trong tương lai. Xem [_whatwg/fs#9_](https://github.com/whatwg/fs/pull/9) để biết chi tiết.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
