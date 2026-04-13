---
title: File API
slug: Web/API/File_API
page-type: web-api-overview
spec-urls: https://w3c.github.io/FileAPI/
---

{{DefaultAPISidebar("File API")}}{{AvailableInWorkers}}

## Khái niệm và cách sử dụng

File API cho phép các ứng dụng web truy cập tệp và nội dung của chúng.

Các ứng dụng web có thể truy cập tệp khi người dùng cung cấp chúng, sử dụng [phần tử `<input>` kiểu file](/en-US/docs/Web/HTML/Reference/Elements/input/file) hoặc [qua kéo và thả](/en-US/docs/Web/API/DataTransfer/files).

Các tập hợp tệp được cung cấp theo cách này được đại diện bởi các đối tượng {{domxref("FileList")}}, cho phép ứng dụng web lấy các đối tượng {{domxref("File")}} riêng lẻ. Các đối tượng {{domxref("File")}} cung cấp quyền truy cập vào siêu dữ liệu như tên, kích thước, loại và ngày sửa đổi cuối cùng của tệp.

Các đối tượng {{domxref("File")}} có thể được truyền vào các đối tượng {{domxref("FileReader")}} để truy cập nội dung tệp. Giao diện {{domxref("FileReader")}} là không đồng bộ, nhưng phiên bản đồng bộ, chỉ có sẵn trong [web workers](/en-US/docs/Web/API/Web_Workers_API), được cung cấp bởi giao diện {{domxref("FileReaderSync")}}.

## Mối quan hệ với các API liên quan đến tệp khác

Có hai API lớn khác cũng xử lý tệp: [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) và [File System API](/en-US/docs/Web/API/File_System_API).

File API là cơ bản nhất. Nó hỗ trợ đọc và xử lý dữ liệu tệp được cung cấp rõ ràng bởi người dùng dưới dạng đầu vào phần tử form hoặc thao tác kéo và thả. Nó cũng cho phép xử lý dữ liệu nhị phân qua blob.

File and Directory Entries API, giống như File API, cũng xử lý các tệp được người dùng cung cấp qua đầu vào form hoặc thao tác kéo và thả. Tuy nhiên, thay vì một tệp, phần tử đầu vào bây giờ cho phép chọn thư mục hoặc nhiều tệp. API sau đó cung cấp cách xử lý thư mục hoặc tệp. Đây phần lớn là sáng tạo của riêng Chrome, bạn sẽ thấy các phần mở rộng của nó cho các giao diện khác đều có tiền tố `webkit`. [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API#history) có câu chuyện đầy đủ hơn về quá trình triển khai và chuẩn hóa. Ban đầu nó được dự định để hỗ trợ hệ thống tệp ảo đầy đủ, nhưng bây giờ chỉ hỗ trợ các thao tác đọc trên dữ liệu do người dùng cung cấp.

File System API cung cấp hệ thống tệp ảo cho các ứng dụng web, để chúng có thể lưu trữ dữ liệu liên tục trong hệ thống ảo riêng tư với nguồn gốc của tài liệu (được gọi là [Hệ thống tệp riêng tư nguồn gốc (OPFS)](/en-US/docs/Web/API/File_System_API/Origin_private_file_system)). File System Access API mở rộng thêm File System API để cho phép các trang web đọc và ghi tệp người dùng, phụ thuộc vào sự đồng ý của người dùng. Khác với File API và File and Directory Entries API, File System API là thuần JavaScript và không xử lý đầu vào form.

## Giao diện

- {{domxref("Blob")}}
  - : Đại diện cho "Binary Large Object", có nghĩa là đối tượng giống tệp gồm dữ liệu thô, bất biến; {{domxref("Blob")}} có thể được đọc dưới dạng văn bản hoặc dữ liệu nhị phân, hoặc chuyển đổi thành {{domxref("ReadableStream")}} để các phương thức của nó có thể được sử dụng để xử lý dữ liệu.
- {{domxref("File")}}
  - : Cung cấp thông tin về tệp và cho phép JavaScript trong trang web truy cập nội dung của nó.
- {{domxref("FileList")}}
  - : Được trả về bởi thuộc tính `files` của phần tử HTML {{HTMLElement("input")}}; điều này cho phép bạn truy cập danh sách tệp được chọn với phần tử `<input type="file">`. Nó cũng được sử dụng cho danh sách tệp được thả vào nội dung web khi sử dụng drag and drop API; xem đối tượng {{domxref("DataTransfer")}} để biết chi tiết về cách sử dụng này.
- {{domxref("FileReader")}}
  - : Cho phép các ứng dụng web đọc không đồng bộ nội dung tệp (hoặc bộ đệm dữ liệu thô) được lưu trữ trên máy tính của người dùng, sử dụng các đối tượng {{domxref("File")}} hoặc {{domxref("Blob")}} để chỉ định tệp hoặc dữ liệu cần đọc.
- {{domxref("FileReaderSync")}}
  - : Cho phép các ứng dụng web đọc đồng bộ nội dung tệp (hoặc bộ đệm dữ liệu thô) được lưu trữ trên máy tính của người dùng, sử dụng các đối tượng {{domxref("File")}} hoặc {{domxref("Blob")}} để chỉ định tệp hoặc dữ liệu cần đọc.

### Phần mở rộng cho các giao diện khác

- {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}
  - : Tạo URL có thể được sử dụng để tải đối tượng {{domxref("File")}} hoặc {{domxref("Blob")}}.
- {{domxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}}
  - : Giải phóng URL đối tượng hiện có đã được tạo trước đó bằng cách gọi {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}.

## Ví dụ

### Đọc tệp

Trong ví dụ này, chúng tôi cung cấp một [phần tử `<input>` kiểu file](/en-US/docs/Web/HTML/Reference/Elements/input/file), và khi người dùng chọn tệp, chúng tôi đọc nội dung tệp đầu tiên được chọn dưới dạng văn bản và hiển thị kết quả trong {{HTMLElement("div")}}.

#### HTML

```html
<input type="file" />
<div class="output"></div>
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
const fileInput = document.querySelector("input[type=file]");
const output = document.querySelector(".output");

fileInput.addEventListener("change", async () => {
  const [file] = fileInput.files;

  if (file) {
    output.innerText = await file.text();
  }
});
```

### Kết quả

{{EmbedLiveSample("Reading a file", "", "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file): phần tử đầu vào tệp
- {{domxref("Blob.text()")}}
- Giao diện {{domxref("DataTransfer")}}
