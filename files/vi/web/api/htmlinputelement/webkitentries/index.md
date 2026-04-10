---
title: "HTMLInputElement: thuộc tính webkitEntries"
short-title: webkitEntries
slug: Web/API/HTMLInputElement/webkitEntries
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.webkitEntries
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính chỉ đọc **`webkitEntries`** của giao diện {{domxref("HTMLInputElement")}} chứa một mảng các mục nhập hệ thống tệp (dưới dạng đối tượng dựa trên {{domxref("FileSystemEntry")}}) đại diện cho các tệp và/hoặc thư mục do người dùng chọn bằng phần tử {{HTMLElement("input")}} loại `file`, nhưng chỉ nếu việc chọn đó được thực hiện bằng kéo-và-thả: chọn một tệp trong hộp thoại sẽ để thuộc tính trống.

Mảng chỉ có thể chứa các thư mục nếu thuộc tính {{domxref("HTMLInputElement.webkitdirectory", "webkitdirectory")}} là `true`. Điều này nghĩa là phần tử `<input>` được cấu hình để cho phép người dùng chọn thư mục.

> [!NOTE]
> Thuộc tính này được gọi là `webkitEntries` trong đặc tả do nguồn gốc là API dành riêng cho Google Chrome. Có thể nó sẽ được đổi tên vào một ngày nào đó.

## Giá trị

Một mảng các đối tượng dựa trên {{domxref("FileSystemEntry")}}, mỗi đối tượng đại diện cho một tệp được chọn trong phần tử {{HTMLElement("input")}}. Cụ thể hơn, các tệp được đại diện bởi các đối tượng {{domxref("FileSystemFileEntry")}}, và, nếu được phép, các thư mục được đại diện bởi các đối tượng {{domxref("FileSystemDirectoryEntry")}}.

## Ví dụ

Ví dụ này cho thấy cách tạo một phần tử `<input>` chọn tệp và xử lý các tệp đã chọn.

### HTML

```html
<input id="files" type="file" multiple />
```

### JavaScript

```js
document.getElementById("files").addEventListener("change", (event) => {
  event.target.webkitEntries.forEach((entry) => {
    /* thực hiện thao tác với entry */
  });
});
```

Mỗi khi sự kiện {{domxref("HTMLElement/change_event", "change")}} xảy ra, mã này lặp qua các tệp đã chọn, lấy các đối tượng dựa trên {{domxref("FileSystemEntry")}} của chúng và thực hiện thao tác trên chúng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("HTMLInputElement")}}
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystem")}}
