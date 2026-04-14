---
title: Sử dụng JavaScript API WebAssembly
slug: WebAssembly/Guides/Using_the_JavaScript_API
page-type: guide
sidebar: webassemblysidebar
---

Bài viết này hướng dẫn bạn cách sử dụng các tính năng chính của JavaScript API WebAssembly, bao gồm tải mô-đun Wasm và thao tác với bộ nhớ, bảng và biến toàn cục của WebAssembly.

> [!NOTE]
> Nếu bạn chưa quen với các khái niệm cơ bản được đề cập trong bài viết này và cần giải thích thêm, hãy đọc [Khái niệm WebAssembly](/en-US/docs/WebAssembly/Guides/Concepts) trước, sau đó quay lại.

## Tải mô-đun Wasm trong JavaScript

Hãy thực hiện một số ví dụ giải thích cách sử dụng JavaScript API WebAssembly và cách sử dụng nó để tải mô-đun Wasm trong một trang web.

> [!NOTE]
> Bạn có thể tìm thấy code mẫu trong repo GitHub [webassembly-examples](https://github.com/mdn/webassembly-examples) của chúng tôi.

### Chuẩn bị ví dụ

1. Đầu tiên chúng ta cần một mô-đun Wasm! Lấy tệp [`simple.wasm`](https://raw.githubusercontent.com/mdn/webassembly-examples/master/js-api-examples/simple.wasm) của chúng ta và lưu một bản sao trong một thư mục mới trên máy cục bộ của bạn.
2. Tiếp theo, hãy tạo một tệp HTML đơn giản có tên `index.html` trong cùng thư mục với tệp Wasm của bạn (có thể sử dụng [mẫu đơn giản](https://github.com/mdn/webassembly-examples/blob/main/template/template.html) nếu bạn không có sẵn một cái).
3. Bây giờ, để giúp chúng ta hiểu những gì đang xảy ra ở đây, hãy xem biểu diễn văn bản của mô-đun Wasm của chúng ta (mà chúng ta cũng gặp trong [Chuyển đổi định dạng WebAssembly sang Wasm](/en-US/docs/WebAssembly/Guides/Text_format_to_Wasm#a_first_look_at_the_text_format)):

   ```wat
   (module
     (func $i (import "my_namespace" "imported_func") (param i32))
     (func (export "exported_func")
       i32.const 42
       call $i))
   ```

4. Trong dòng thứ hai, bạn sẽ thấy rằng nhập khẩu có không gian tên hai cấp — hàm nội bộ `$i` được nhập khẩu từ `my_namespace.imported_func`. Chúng ta cần phản ánh không gian tên hai cấp này trong JavaScript khi viết đối tượng để được nhập khẩu vào mô-đun Wasm. Tạo phần tử `<script></script>` trong tệp HTML của bạn và thêm code sau vào đó:

   ```js
   const importObject = {
     my_namespace: { imported_func: (arg) => console.log(arg) },
   };
   ```

### Truyền phát mô-đun WebAssembly

Mới trong Firefox 58 là khả năng biên dịch và khởi tạo các mô-đun WebAssembly trực tiếp từ các nguồn cơ bản. Điều này đạt được bằng cách sử dụng các phương thức [`WebAssembly.compileStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compileStreaming_static) và [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static). Các phương thức này dễ hơn so với các phương thức không phải streaming, vì chúng có thể chuyển đổi bytecode trực tiếp thành các phiên bản `Module`/`Instance`, loại bỏ nhu cầu đưa riêng biệt {{domxref("Response")}} vào {{jsxref("ArrayBuffer")}}.

Ví dụ này (xem bản demo [instantiate-streaming.html](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/instantiate-streaming.html) trên GitHub, và [xem nó trực tiếp](https://mdn.github.io/webassembly-examples/js-api-examples/instantiate-streaming.html)) cho thấy cách sử dụng `instantiateStreaming()` để tải mô-đun Wasm, nhập khẩu một hàm JavaScript vào nó, biên dịch và khởi tạo nó, và truy cập hàm được xuất khẩu của nó — tất cả trong một bước.

Thêm code sau vào script của bạn, bên dưới khối đầu tiên:

```js
WebAssembly.instantiateStreaming(fetch("simple.wasm"), importObject).then(
  (obj) => obj.instance.exports.exported_func(),
);
```

Kết quả cuối cùng là chúng ta gọi hàm WebAssembly được xuất khẩu `exported_func`, lần lượt gọi hàm JavaScript được nhập khẩu `imported_func`, ghi lại giá trị được cung cấp bên trong phiên bản WebAssembly (42) vào bảng điều khiển. Nếu bạn lưu code ví dụ ngay bây giờ và tải nó trong trình duyệt hỗ trợ WebAssembly, bạn sẽ thấy điều này trong hành động!

> [!NOTE]
> Đây là một ví dụ rắc rối, dài dòng đạt được rất ít, nhưng nó phục vụ để minh họa những gì có thể — sử dụng code WebAssembly cùng với JavaScript trong các ứng dụng web của bạn. Như chúng ta đã nói ở nơi khác, WebAssembly không nhằm mục đích thay thế JavaScript; hai cái thay vào đó có thể làm việc cùng nhau, khai thác điểm mạnh của mỗi cái.

### Tải mô-đun Wasm của chúng ta mà không cần streaming

Nếu bạn không thể hoặc không muốn sử dụng các phương thức streaming như được mô tả ở trên, bạn có thể sử dụng các phương thức không phải streaming [`WebAssembly.compile()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/compile_static) / [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) thay thế.

Các phương thức này không trực tiếp truy cập bytecode, vì vậy yêu cầu một bước thêm để chuyển đổi phản hồi thành {{jsxref("ArrayBuffer")}} trước khi biên dịch/khởi tạo mô-đun Wasm.

Code tương đương sẽ trông như thế này:

```js
fetch("simple.wasm")
  .then((response) => response.arrayBuffer())
  .then((bytes) => WebAssembly.instantiate(bytes, importObject))
  .then((results) => {
    results.instance.exports.exported_func();
  });
```

### Xem Wasm trong công cụ phát triển

Trong Firefox 54+, Bảng điều khiển Debugger của Công cụ Phát triển có chức năng để hiển thị biểu diễn văn bản của bất kỳ code Wasm nào được bao gồm trong một trang web. Để xem nó, bạn có thể đến Bảng điều khiển Debugger và nhấp vào mục "wasm://".

![Bảng điều khiển debugger của công cụ phát triển làm nổi bật một mô-đun.](wasm-debug.png)

Ngoài việc xem WebAssembly dưới dạng văn bản, các nhà phát triển có thể debug (đặt breakpoint, kiểm tra callstack, từng bước, v.v.) WebAssembly bằng cách sử dụng định dạng văn bản.

## Bộ nhớ

Trong mô hình bộ nhớ cấp thấp của WebAssembly, bộ nhớ được biểu diễn như một phạm vi liên tiếp của các byte không có kiểu gọi là [Bộ nhớ tuyến tính](https://webassembly.github.io/spec/core/exec/index.html) được đọc và viết bởi [các hướng dẫn tải và lưu](https://webassembly.github.io/spec/core/exec/instructions.html#memory-instructions) bên trong mô-đun. Trong mô hình bộ nhớ này, bất kỳ tải hoặc lưu nào cũng có thể truy cập bất kỳ byte nào trong toàn bộ bộ nhớ tuyến tính, điều cần thiết để trung thực biểu diễn các khái niệm C/C++ như con trỏ.

Không giống như một chương trình C/C++ native, tuy nhiên, nơi phạm vi bộ nhớ có sẵn trải dài toàn bộ tiến trình, bộ nhớ có thể truy cập bởi một Phiên bản WebAssembly cụ thể bị giới hạn trong một phạm vi cụ thể — có thể rất nhỏ — được chứa bởi một đối tượng Bộ nhớ WebAssembly. Điều này cho phép một ứng dụng web duy nhất sử dụng nhiều thư viện độc lập — mỗi thư viện sử dụng WebAssembly nội bộ — để có các bộ nhớ riêng biệt hoàn toàn cô lập với nhau. Ngoài ra, các triển khai mới hơn cũng có thể tạo [bộ nhớ được chia sẻ](/en-US/docs/WebAssembly/Guides/Understanding_the_text_format#shared_memories), có thể được chuyển giữa các ngữ cảnh Window và Worker bằng [`postMessage()`](/en-US/docs/Web/API/Window/postMessage) và được sử dụng ở nhiều nơi.

Trong JavaScript, một phiên bản Bộ nhớ có thể được coi là một [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) có thể thay đổi kích thước (hoặc [`SharedArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer), trong trường hợp bộ nhớ được chia sẻ) và, giống như với `ArrayBuffer`, một ứng dụng web duy nhất có thể tạo nhiều đối tượng Bộ nhớ độc lập. Bạn có thể tạo một bằng cách sử dụng constructor [`WebAssembly.Memory()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory), lấy làm đối số kích thước ban đầu và (tùy chọn) kích thước tối đa và thuộc tính `shared` cho biết đó có phải là bộ nhớ được chia sẻ hay không.

Hãy bắt đầu khám phá điều này bằng cách xem xét một ví dụ nhanh.

1. Tạo một trang HTML đơn giản mới khác (sao chép [mẫu đơn giản](https://github.com/mdn/webassembly-examples/blob/main/template/template.html) của chúng ta) và gọi nó là `memory.html`. Thêm phần tử `<script></script>` vào trang.
2. Bây giờ thêm dòng sau vào đầu script của bạn để tạo một phiên bản bộ nhớ:

   ```js
   const memory = new WebAssembly.Memory({ initial: 10, maximum: 100 });
   ```

   Đơn vị của `initial` và `maximum` là các trang WebAssembly — chúng được cố định ở kích thước 64KB. Điều đó có nghĩa là phiên bản bộ nhớ ở trên có kích thước ban đầu là 640KB và kích thước tối đa là 6.4MB.

   Bộ nhớ WebAssembly hiển thị các byte của nó bằng cách cung cấp getter/setter bộ đệm trả về ArrayBuffer. Ví dụ: để ghi 42 trực tiếp vào từ đầu tiên của bộ nhớ tuyến tính, bạn có thể làm điều này:

   ```js
   const data = new DataView(memory.buffer);
   data.setUint32(0, 42, true);
   ```

   Lưu ý việc sử dụng `true`, buộc đọc và ghi little-endian, vì bộ nhớ WebAssembly luôn là little-endian. Sau đó bạn có thể trả về cùng giá trị bằng cách sử dụng:

   ```js
   data.getUint32(0, true);
   ```

3. Thử điều này ngay bây giờ trong bản demo của bạn — lưu những gì bạn đã thêm cho đến nay, tải nó trong trình duyệt, sau đó thử nhập hai dòng trên vào bảng điều khiển JavaScript của bạn.

### Tăng bộ nhớ

Một phiên bản bộ nhớ có thể được tăng bằng các lời gọi [`Memory.prototype.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/grow), trong đó một lần nữa đối số được chỉ định theo đơn vị các trang WebAssembly:

```js
memory.grow(1);
```

Nếu giá trị tối đa được cung cấp khi tạo phiên bản bộ nhớ, các nỗ lực để tăng vượt quá giá trị tối đa này sẽ ném ra ngoại lệ {{jsxref("RangeError")}}. Engine tận dụng giới hạn trên được cung cấp này để đặt trước bộ nhớ trước, điều này có thể làm cho việc thay đổi kích thước hiệu quả hơn.

Lưu ý: Vì byteLength của {{jsxref("ArrayBuffer")}} là bất biến, sau thao tác [`Memory.prototype.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/grow) thành công getter bộ đệm sẽ trả về một đối tượng ArrayBuffer mới (với byteLength mới) và bất kỳ đối tượng ArrayBuffer trước đó nào đều bị "tách rời" hoặc ngắt kết nối với bộ nhớ cơ bản mà chúng trỏ vào trước đó.

Cũng giống như các hàm, bộ nhớ tuyến tính có thể được định nghĩa bên trong mô-đun hoặc được nhập khẩu. Tương tự, một mô-đun cũng có thể tùy chọn xuất khẩu bộ nhớ của nó. Điều này có nghĩa là JavaScript có thể truy cập bộ nhớ của một phiên bản WebAssembly bằng cách tạo một `WebAssembly.Memory` mới và truyền nó như một nhập khẩu hoặc bằng cách nhận một xuất khẩu Bộ nhớ (thông qua [`Instance.prototype.exports`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Instance/exports)).

### Ví dụ bộ nhớ phức tạp hơn

Hãy làm rõ các khẳng định ở trên bằng cách xem xét một ví dụ bộ nhớ phức tạp hơn — một mô-đun WebAssembly nhập khẩu phiên bản bộ nhớ chúng ta đã định nghĩa trước đó, điền vào đó một mảng số nguyên, sau đó tổng hợp chúng. Bạn có thể tìm thấy điều này tại [memory.wasm.](https://raw.githubusercontent.com/mdn/webassembly-examples/master/js-api-examples/memory.wasm)

1. Tạo một bản sao cục bộ của `memory.wasm` trong cùng thư mục như trước.

   > [!NOTE]
   > Bạn có thể xem biểu diễn văn bản của mô-đun tại [memory.wat](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/memory.wat).

2. Quay lại tệp mẫu `memory.html` của bạn và tải, biên dịch và khởi tạo mô-đun Wasm của bạn như trước — thêm code sau vào cuối script:

   ```js
   WebAssembly.instantiateStreaming(fetch("memory.wasm"), {
     js: { mem: memory },
   }).then((results) => {
     // add code here
   });
   ```

3. Vì mô-đun này xuất khẩu bộ nhớ của nó, cho một Phiên bản của mô-đun này có tên instance chúng ta có thể sử dụng hàm được xuất khẩu `accumulate()` để tạo và điền vào một mảng đầu vào trực tiếp trong bộ nhớ tuyến tính của phiên bản mô-đun (`mem`). Thêm code sau vào code của bạn, nơi được chỉ ra:

   ```js
   const summands = new DataView(memory.buffer);
   for (let i = 0; i < 10; i++) {
     summands.setUint32(i * 4, i, true);
   }
   const sum = results.instance.exports.accumulate(0, 10);
   console.log(sum);
   ```

Lưu ý cách chúng ta tạo view {{jsxref("DataView")}} trên bộ đệm của đối tượng Bộ nhớ ([`Memory.prototype.buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer)), không phải trên Bộ nhớ chính nó.

Nhập khẩu bộ nhớ hoạt động giống như nhập khẩu hàm, chỉ là các đối tượng Bộ nhớ được truyền làm giá trị thay vì các hàm JavaScript. Nhập khẩu bộ nhớ hữu ích vì hai lý do:

- Chúng cho phép JavaScript tải và tạo nội dung ban đầu của bộ nhớ trước hoặc đồng thời với biên dịch mô-đun.
- Chúng cho phép một đối tượng Bộ nhớ duy nhất được nhập khẩu bởi nhiều phiên bản mô-đun, là một yếu tố cơ bản quan trọng để triển khai liên kết động trong WebAssembly.

> [!NOTE]
> Bạn có thể tìm thấy bản demo đầy đủ của chúng tôi tại [memory.html](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/memory.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/js-api-examples/memory.html)).

## Bảng

Bảng WebAssembly là một mảng có kiểu có thể thay đổi kích thước của [tham chiếu](<https://en.wikipedia.org/wiki/Reference_(computer_science)>) có thể được truy cập bởi cả JavaScript và code WebAssembly. Trong khi Bộ nhớ cung cấp một mảng có kiểu có thể thay đổi kích thước của byte thô, không an toàn khi lưu trữ các tham chiếu trong Bộ nhớ vì tham chiếu là một giá trị được engine tin tưởng mà các byte của nó không được đọc hoặc viết trực tiếp bởi nội dung vì lý do an toàn, di động và ổn định.

Bảng có kiểu phần tử, giới hạn các kiểu tham chiếu có thể được lưu trữ trong bảng. Trong lần lặp hiện tại của WebAssembly, chỉ có một loại tham chiếu cần thiết bởi code WebAssembly — hàm — và do đó chỉ có một kiểu phần tử hợp lệ. Trong các lần lặp tương lai, nhiều kiểu phần tử hơn sẽ được thêm vào.

Tham chiếu hàm cần thiết để biên dịch các ngôn ngữ như C/C++ có con trỏ hàm. Trong một triển khai native của C/C++, một con trỏ hàm được biểu diễn bởi địa chỉ thô của code hàm trong không gian địa chỉ ảo của tiến trình và do đó, vì lý do an toàn đã đề cập, không thể được lưu trữ trực tiếp trong bộ nhớ tuyến tính. Thay vào đó, các tham chiếu hàm được lưu trữ trong một bảng và các chỉ số của chúng, là các số nguyên và có thể được lưu trữ trong bộ nhớ tuyến tính, được truyền xung quanh thay thế.

Khi đến lúc gọi một con trỏ hàm, người gọi WebAssembly cung cấp chỉ số, sau đó có thể được kiểm tra giới hạn an toàn đối với bảng trước khi lập chỉ mục và gọi tham chiếu hàm đã lập chỉ mục. Do đó, bảng hiện là một nguyên thủy cấp thấp khá được sử dụng để biên dịch các tính năng ngôn ngữ lập trình cấp thấp một cách an toàn và di động.

Bảng có thể được thay đổi thông qua [`Table.prototype.set()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/set), cập nhật một trong các giá trị trong bảng, và [`Table.prototype.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/grow), tăng số lượng giá trị có thể được lưu trữ trong bảng. Điều này cho phép tập hợp hàm có thể gọi gián tiếp thay đổi theo thời gian, điều cần thiết cho [các kỹ thuật liên kết động](https://github.com/WebAssembly/tool-conventions/blob/main/DynamicLinking.md). Các thay đổi có thể truy cập ngay lập tức thông qua [`Table.prototype.get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get) trong JavaScript và cho các mô-đun Wasm.

### Ví dụ về bảng

Hãy xem một ví dụ bảng đơn giản — một mô-đun WebAssembly tạo và xuất khẩu một bảng với hai phần tử: phần tử 0 trả về 13 và phần tử 1 trả về 42. Bạn có thể tìm thấy điều này tại [table.wasm](https://raw.githubusercontent.com/mdn/webassembly-examples/master/js-api-examples/table.wasm).

1. Tạo một bản sao cục bộ của `table.wasm` trong một thư mục mới.

   > [!NOTE]
   > Bạn có thể xem biểu diễn văn bản của mô-đun tại [table.wat](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/table.wat).

2. Tạo một bản sao mới của [mẫu HTML](https://github.com/mdn/webassembly-examples/blob/main/template/template.html) trong cùng thư mục và gọi nó là `table.html`.
3. Như trước, tải, biên dịch và khởi tạo mô-đun Wasm của bạn — thêm code sau vào phần tử {{htmlelement("script")}} ở cuối thân HTML:

   ```js
   WebAssembly.instantiateStreaming(fetch("table.wasm")).then((results) => {
     // add code here
   });
   ```

4. Bây giờ hãy truy cập dữ liệu trong các bảng — thêm các dòng sau vào code của bạn ở nơi được chỉ ra:

   ```js
   const tbl = results.instance.exports.tbl;
   console.log(tbl.get(0)()); // 13
   console.log(tbl.get(1)()); // 42
   ```

Code này truy cập từng tham chiếu hàm được lưu trữ trong bảng lần lượt và khởi tạo chúng để in các giá trị chúng giữ vào bảng điều khiển — lưu ý cách mỗi tham chiếu hàm được lấy với lời gọi [`Table.prototype.get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get), sau đó chúng ta thêm một bộ dấu ngoặc đơn thêm vào cuối để thực sự gọi hàm.

> [!NOTE]
> Bạn có thể tìm thấy bản demo đầy đủ của chúng tôi tại [table.html](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/table.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/js-api-examples/table.html)).

## Biến toàn cục

WebAssembly có khả năng tạo các phiên bản biến toàn cục, có thể truy cập từ cả JavaScript và có thể nhập khẩu/xuất khẩu trên một hoặc nhiều phiên bản [`WebAssembly.Module`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module). Điều này rất hữu ích vì nó cho phép liên kết động của nhiều mô-đun.

Để tạo một phiên bản toàn cục WebAssembly từ bên trong JavaScript, bạn sử dụng constructor [`WebAssembly.Global()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Global), trông như thế này:

```js
const global = new WebAssembly.Global({ value: "i32", mutable: true }, 0);
```

Bạn có thể thấy rằng nó lấy hai tham số:

- Một đối tượng chứa hai thuộc tính mô tả biến toàn cục:
  - `value`: kiểu dữ liệu của nó, có thể là bất kỳ kiểu dữ liệu nào được chấp nhận trong các mô-đun WebAssembly — `i32`, `i64`, `f32`, hoặc `f64`.
  - `mutable`: một boolean xác định liệu giá trị có thể thay đổi hay không.

- Một giá trị chứa giá trị thực tế của biến. Đây có thể là bất kỳ giá trị nào, miễn là kiểu của nó khớp với kiểu dữ liệu được chỉ định.

Vậy làm thế nào chúng ta sử dụng điều này? Trong ví dụ sau, chúng ta định nghĩa một toàn cục như kiểu `i32` có thể thay đổi, với giá trị là 0.

Giá trị của toàn cục sau đó được thay đổi, đầu tiên thành `42` bằng cách sử dụng thuộc tính `Global.value`, và sau đó thành 43 bằng cách sử dụng hàm `incGlobal()` được xuất khẩu từ mô-đun `global.wasm` (điều này thêm 1 vào bất kỳ giá trị nào được cung cấp cho nó và sau đó trả về giá trị mới).

```js
const output = document.getElementById("output");

function assertEq(msg, got, expected) {
  const result =
    got === expected
      ? `SUCCESS! Got: ${got}\n`
      : `FAIL!\nGot: ${got}\nExpected: ${expected}\n`;
  output.innerText += `Testing ${msg}: ${result}`;
}

assertEq("WebAssembly.Global exists", typeof WebAssembly.Global, "function");

const global = new WebAssembly.Global({ value: "i32", mutable: true }, 0);

WebAssembly.instantiateStreaming(fetch("global.wasm"), { js: { global } }).then(
  ({ instance }) => {
    assertEq(
      "getting initial value from wasm",
      instance.exports.getGlobal(),
      0,
    );
    global.value = 42;
    assertEq(
      "getting JS-updated value from wasm",
      instance.exports.getGlobal(),
      42,
    );
    instance.exports.incGlobal();
    assertEq("getting wasm-updated value from JS", global.value, 43);
  },
);
```

> [!NOTE]
> Bạn có thể xem ví dụ [chạy trực tiếp trên GitHub](https://mdn.github.io/webassembly-examples/js-api-examples/global.html); xem thêm [mã nguồn](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/global.html).

## Đa dạng

Bây giờ chúng ta đã minh họa cách sử dụng các khối xây dựng chính của WebAssembly, đây là nơi tốt để đề cập đến khái niệm đa dạng. Điều này cung cấp cho WebAssembly nhiều tiến bộ về mặt hiệu quả kiến trúc:

- Một mô-đun có thể có N phiên bản, theo cách tương tự như một hàm literal có thể tạo ra N giá trị closure.
- Một phiên bản mô-đun có thể sử dụng 0–1 phiên bản bộ nhớ, cung cấp "không gian địa chỉ" của phiên bản. Các phiên bản WebAssembly tương lai có thể cho phép 0–N phiên bản bộ nhớ trên mỗi phiên bản mô-đun (xem [Multiple Memories](https://webassembly.org/features/)).
- Một phiên bản mô-đun có thể sử dụng 0–1 phiên bản bảng — đây là "không gian địa chỉ hàm" của phiên bản, được sử dụng để triển khai con trỏ hàm C. Các phiên bản WebAssembly tương lai có thể cho phép 0–N phiên bản bảng trên mỗi phiên bản mô-đun.
- Một phiên bản bộ nhớ hoặc bảng có thể được sử dụng bởi 0–N phiên bản mô-đun — các phiên bản này đều chia sẻ cùng không gian địa chỉ, cho phép [liên kết động](https://github.com/WebAssembly/tool-conventions/blob/main/DynamicLinking.md).

Bạn có thể thấy đa dạng trong hành động trong bài viết Hiểu định dạng văn bản của chúng tôi — xem [phần Thay đổi bảng và liên kết động](/en-US/docs/WebAssembly/Guides/Understanding_the_text_format#mutating_tables_and_dynamic_linking).

## Tóm tắt

Bài viết này đã đưa bạn qua những điều cơ bản về việc sử dụng JavaScript API WebAssembly để bao gồm mô-đun WebAssembly trong ngữ cảnh JavaScript và tận dụng các hàm của nó, và cách sử dụng bộ nhớ và bảng WebAssembly trong JavaScript. Chúng ta cũng đã đề cập đến khái niệm đa dạng.

## Xem thêm

- [webassembly.org](https://webassembly.org/)
- [Khái niệm WebAssembly](/en-US/docs/WebAssembly/Guides/Concepts)
- [WebAssembly trên Mozilla Research](https://research.mozilla.org/)
