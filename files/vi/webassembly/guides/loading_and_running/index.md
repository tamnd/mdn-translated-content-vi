---
title: Tải và chạy code WebAssembly
slug: WebAssembly/Guides/Loading_and_running
page-type: guide
sidebar: webassemblysidebar
---

Để sử dụng WebAssembly trong JavaScript, bạn trước tiên cần kéo mô-đun của mình vào bộ nhớ trước khi biên dịch/khởi tạo. Bài viết này cung cấp tài liệu tham khảo về các cơ chế khác nhau có thể được sử dụng để tải bytecode WebAssembly, cũng như cách biên dịch/khởi tạo và chạy nó.

## Các tùy chọn là gì?

WebAssembly chưa được tích hợp với `<script type='module'>` hoặc các câu lệnh `import`, do đó không có con đường nào để trình duyệt tải các mô-đun cho bạn bằng cách sử dụng nhập khẩu.

Các phương thức cũ hơn [`WebAssembly.compile`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compile_static)/[`WebAssembly.instantiate`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) yêu cầu bạn tạo một {{jsxref("ArrayBuffer")}} chứa nhị phân mô-đun WebAssembly của bạn sau khi tải các byte thô, sau đó biên dịch/khởi tạo nó. Điều này tương tự như `new Function(string)`, ngoại trừ chúng ta đang thay thế một chuỗi ký tự (mã nguồn JavaScript) bằng một bộ đệm mảng byte (mã nguồn WebAssembly).

Các phương thức mới hơn [`WebAssembly.compileStreaming`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compileStreaming_static)/[`WebAssembly.instantiateStreaming`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static) hiệu quả hơn nhiều — chúng thực hiện hành động của mình trực tiếp trên luồng byte thô đến từ mạng, loại bỏ nhu cầu của bước {{jsxref("ArrayBuffer")}}.

Vậy làm thế nào để chúng ta lấy những byte đó vào một bộ đệm mảng và biên dịch? Các phần sau đây giải thích.

## Sử dụng Fetch

[Fetch](/en-US/docs/Web/API/Fetch_API) là một API hiện đại, tiện lợi để tải các tài nguyên mạng.

Cách nhanh nhất, hiệu quả nhất để tải một mô-đun Wasm là sử dụng phương thức mới hơn [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static), có thể lấy một lời gọi `fetch()` làm đối số đầu tiên của nó, và sẽ xử lý việc tải, biên dịch và khởi tạo mô-đun trong một bước, truy cập bytecode thô khi nó truyền trực tuyến từ máy chủ:

```js
WebAssembly.instantiateStreaming(fetch("simple.wasm"), importObject).then(
  (results) => {
    // Do something with the results!
  },
);
```

Nếu chúng ta sử dụng phương thức [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) cũ hơn, không hoạt động trên luồng trực tiếp, chúng ta cần một bước thêm để chuyển đổi bytecode đã tải thành {{jsxref("ArrayBuffer")}}, như sau:

```js
fetch("module.wasm")
  .then((response) => response.arrayBuffer())
  .then((bytes) => WebAssembly.instantiate(bytes, importObject))
  .then((results) => {
    // Do something with the results!
  });
```

### Ghi chú về các nạp chồng của instantiate()

Hàm [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) có hai dạng nạp chồng — dạng được hiển thị ở trên lấy bytecode để biên dịch làm đối số và trả về một Promise giải quyết thành một đối tượng chứa cả đối tượng mô-đun đã biên dịch và một phiên bản được khởi tạo của nó. Đối tượng trông như thế này:

```js
({
  module: Module, // The newly compiled WebAssembly.Module object,
  instance: Instance, // A new WebAssembly.Instance of the module object
});
```

> [!NOTE]
> Thường chúng ta chỉ quan tâm đến phiên bản, nhưng hữu ích khi có mô-đun trong trường hợp chúng ta muốn lưu vào bộ nhớ đệm, chia sẻ nó với một worker hoặc cửa sổ khác thông qua [`postMessage()`](/en-US/docs/Web/API/MessagePort/postMessage), hoặc tạo thêm các phiên bản.

> [!NOTE]
> Dạng nạp chồng thứ hai lấy một đối tượng [`WebAssembly.Module`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module) làm đối số, và trả về một promise chứa trực tiếp đối tượng phiên bản là kết quả. Xem [Ví dụ nạp chồng thứ hai](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static#second_overload_example).

### Chạy code WebAssembly của bạn

Khi bạn đã có phiên bản WebAssembly trong JavaScript, bạn có thể bắt đầu sử dụng các tính năng của nó đã được xuất khẩu thông qua thuộc tính [`WebAssembly.Instance.exports`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Instance/exports). Code của bạn có thể trông như thế này:

```js
WebAssembly.instantiateStreaming(fetch("myModule.wasm"), importObject).then(
  (obj) => {
    // Call an exported function:
    obj.instance.exports.exported_func();

    // or access the buffer contents of an exported memory:
    const dv = new DataView(obj.instance.exports.memory.buffer);

    // or access the elements of an exported table:
    const table = obj.instance.exports.table;
    console.log(table.get(0)());
  },
);
```

> [!NOTE]
> Để biết thêm thông tin về cách xuất khẩu từ mô-đun WebAssembly hoạt động, hãy đọc [Sử dụng JavaScript API WebAssembly](/en-US/docs/WebAssembly/Guides/Using_the_JavaScript_API), và [Hiểu định dạng văn bản WebAssembly](/en-US/docs/WebAssembly/Guides/Understanding_the_text_format).

## Sử dụng XMLHttpRequest

[`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest) cũ hơn Fetch một chút, nhưng vẫn có thể được sử dụng để lấy một mảng đã đánh máy. Một lần nữa, giả sử mô-đun của chúng ta được gọi là `simple.wasm`:

1. Tạo một phiên bản {{domxref("XMLHttpRequest()")}} mới, và sử dụng phương thức {{domxref("XMLHttpRequest.open","open()")}} của nó để mở một yêu cầu, đặt phương thức yêu cầu thành `GET`, và khai báo đường dẫn đến tệp chúng ta muốn tải.
2. Phần quan trọng là đặt kiểu phản hồi thành `'arraybuffer'` bằng cách sử dụng thuộc tính {{domxref("XMLHttpRequest.responseType","responseType")}}.
3. Tiếp theo, gửi yêu cầu bằng {{domxref("XMLHttpRequest.send()")}}.
4. Sau đó chúng ta sử dụng trình xử lý sự kiện {{domxref("XMLHttpRequestEventTarget/load_event", "load")}} để gọi một hàm khi phản hồi đã tải xuống xong — trong hàm này chúng ta lấy bộ đệm mảng từ thuộc tính {{domxref("XMLHttpRequest.response", "response")}}, sau đó đưa nó vào phương thức [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) của chúng ta như chúng ta đã làm với Fetch.

Code cuối cùng trông như thế này:

```js
const request = new XMLHttpRequest();
request.open("GET", "simple.wasm");
request.responseType = "arraybuffer";
request.send();

request.onload = () => {
  const bytes = request.response;
  WebAssembly.instantiate(bytes, importObject).then((results) => {
    results.instance.exports.exported_func();
  });
};
```

> [!NOTE]
> Bạn có thể xem ví dụ về điều này trong hoạt động tại [xhr-wasm.html](https://mdn.github.io/webassembly-examples/js-api-examples/xhr-wasm.html).
