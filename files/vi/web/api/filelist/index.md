---
title: FileList
slug: Web/API/FileList
page-type: web-api-interface
browser-compat: api.FileList
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Giao diện **`FileList`** đại diện cho đối tượng kiểu này được trả về bởi thuộc tính `files` của phần tử HTML {{HTMLElement("input")}}; điều này cho phép bạn truy cập danh sách các tệp được chọn bằng phần tử `<input type="file">`. Nó cũng được sử dụng cho danh sách các tệp được thả vào nội dung web khi sử dụng API kéo thả; xem đối tượng {{domxref("DataTransfer")}} để biết thêm chi tiết về cách sử dụng này.

Tất cả các nút phần tử `<input>` đều có thuộc tính `files` kiểu `FileList` cho phép truy cập các mục trong danh sách này. Ví dụ, nếu HTML bao gồm đầu vào tệp sau:

```html
<input id="fileItem" type="file" />
```

Dòng mã sau lấy tệp đầu tiên trong danh sách tệp của nút dưới dạng đối tượng {{domxref("File")}}:

```js
const file = document.getElementById("fileItem").files[0];
```

Giao diện này là [một nỗ lực tạo danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ tiếp tục được hỗ trợ để không phá vỡ code đã sử dụng nó. Các API hiện đại đại diện cấu trúc danh sách bằng các kiểu dựa trên [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) JavaScript, do đó cung cấp nhiều phương thức mảng có sẵn, đồng thời áp đặt thêm ngữ nghĩa về cách sử dụng (như làm cho các mục của chúng chỉ đọc).

Những lý do lịch sử này không có nghĩa là bạn với tư cách là nhà phát triển nên tránh `FileList`. Bạn không tự tạo các đối tượng `FileList`, mà nhận chúng từ các API như {{domxref("HTMLInputElement.files")}}, và các API này không bị lỗi thời. Tuy nhiên, hãy cẩn thận về sự khác biệt ngữ nghĩa so với mảng thực sự.

## Thuộc tính phiên bản

- {{DOMxRef("FileList.length", "length")}} {{ReadOnlyInline}}
  - : Giá trị chỉ đọc cho biết số lượng tệp trong danh sách.

## Phương thức phiên bản

- {{DOMxRef("FileList.item()", "item()")}}
  - : Trả về đối tượng {{domxref("File")}} đại diện cho tệp tại chỉ mục được chỉ định trong danh sách tệp.

## Ví dụ

### Ghi nhật ký tên tệp

Trong ví dụ này, chúng ta ghi nhật ký tên của tất cả các tệp được người dùng chọn.

#### HTML

```html
<input id="myfiles" multiple type="file" />
<pre class="output">Selected files:</pre>
```

#### CSS

```css
.output {
  overflow: scroll;
  margin: 1rem 0;
  height: 200px;
}
```

#### JavaScript

```js
const output = document.querySelector(".output");
const fileInput = document.querySelector("#myfiles");

fileInput.addEventListener("change", () => {
  for (const file of fileInput.files) {
    output.innerText += `\n${file.name}`;
  }
});
```

#### Kết quả

{{EmbedLiveSample("Logging filenames")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- {{domxref("File")}}
- {{domxref("FileReader")}}
