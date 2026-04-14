---
title: Hiểu định dạng văn bản WebAssembly
slug: WebAssembly/Guides/Understanding_the_text_format
page-type: guide
sidebar: webassemblysidebar
---

Để WebAssembly có thể được đọc và chỉnh sửa bởi con người, có một biểu diễn văn bản của định dạng nhị phân Wasm. Đây là dạng trung gian được thiết kế để hiển thị trong các trình soạn thảo văn bản, công cụ phát triển trình duyệt và các môi trường tương tự. Bài viết này giải thích cách định dạng văn bản hoạt động về mặt cú pháp thô, và cách nó liên quan đến bytecode cơ bản mà nó đại diện và các đối tượng bọc đại diện cho Wasm trong JavaScript.

> [!NOTE]
> Điều này có thể quá mức nếu bạn là một nhà phát triển web muốn tải một mô-đun Wasm vào trang và sử dụng nó trong code của bạn (xem [Sử dụng JavaScript API WebAssembly](/en-US/docs/WebAssembly/Guides/Using_the_JavaScript_API)). Nó hữu ích hơn nếu, ví dụ, bạn muốn viết các mô-đun Wasm để tối ưu hóa hiệu suất thư viện JavaScript của bạn hoặc xây dựng trình biên dịch WebAssembly của riêng bạn.

## S-expressions

Trong cả hai định dạng nhị phân và văn bản, đơn vị cơ bản của code trong WebAssembly là một mô-đun. Trong định dạng văn bản, một mô-đun được biểu diễn như một S-expression lớn. S-expression là một định dạng văn bản cũ, đơn giản để biểu diễn cây; do đó chúng ta có thể coi một mô-đun là một cây của các nút mô tả cấu trúc và code của mô-đun. Không giống như Cây Cú pháp Trừu tượng của một ngôn ngữ lập trình, tuy nhiên, cây WebAssembly khá phẳng, chủ yếu bao gồm các danh sách hướng dẫn.

Đầu tiên, hãy xem S-expression trông như thế nào. Mỗi nút trong cây nằm bên trong một cặp dấu ngoặc đơn — `( ... )`. Nhãn đầu tiên bên trong dấu ngoặc cho bạn biết loại nút nào đó là, và sau đó có một danh sách được phân tách bằng dấu cách của các thuộc tính hoặc nút con. Vì vậy, điều đó có nghĩa là S-expression WebAssembly:

```wat
(module (memory 1) (func))
```

biểu diễn một cây với nút gốc "module" và hai nút con, một nút "memory" với thuộc tính "1" và một nút "func". Chúng ta sẽ thấy ngay sau những nút này thực sự có nghĩa là gì.

### Mô-đun đơn giản nhất

Hãy bắt đầu với mô-đun Wasm đơn giản nhất, ngắn nhất có thể.

```wat
(module)
```

Mô-đun này trống, nhưng nó vẫn là một mô-đun hợp lệ.

Nếu chúng ta chuyển đổi mô-đun của mình thành nhị phân bây giờ (xem [Chuyển đổi định dạng văn bản WebAssembly sang Wasm](/en-US/docs/WebAssembly/Guides/Text_format_to_Wasm)), chúng ta sẽ chỉ thấy header mô-đun 8 byte được mô tả trong [định dạng nhị phân](https://webassembly.github.io/spec/core/binary/modules.html#binary-module):

```plain
0000000: 0061 736d              ; WASM_BINARY_MAGIC
0000004: 0100 0000              ; WASM_BINARY_VERSION
```

### Thêm chức năng vào mô-đun của bạn

Được rồi, điều đó không thú vị lắm, hãy thêm một số code có thể thực thi vào mô-đun này.

Tất cả code trong mô-đun WebAssembly được nhóm thành các hàm, có cấu trúc mã giả sau:

```wat
( func <signature> <locals> <body> )
```

- **Chữ ký** (signature) khai báo hàm nhận gì (tham số) và trả về gì (giá trị trả về).
- **Biến cục bộ** (locals) giống như vars trong JavaScript, nhưng với các kiểu được khai báo rõ ràng.
- **Thân hàm** (body) chỉ là một danh sách tuyến tính các hướng dẫn cấp thấp.

Điều này tương tự như các hàm trong các ngôn ngữ khác, mặc dù nó trông hơi khác.

## Chữ ký và tham số

Chữ ký là một chuỗi khai báo kiểu tham số theo sau bởi danh sách khai báo kiểu trả về. Đáng chú ý ở đây là:

- Sự vắng mặt của `(result)` có nghĩa là hàm không trả về gì.
- Trong lần lặp hiện tại, có thể có nhiều nhất 1 kiểu trả về, nhưng [sau này sẽ được nới lỏng](https://github.com/WebAssembly/spec/blob/main/proposals/multi-value/Overview.md) thành bất kỳ số lượng nào.

Mỗi tham số có một kiểu được khai báo rõ ràng; Wasm [Kiểu số](#kiểu_số), [Kiểu tham chiếu](#kiểu_tham_chiếu), [Kiểu vector](#kiểu_vector).
Các kiểu số là:

- `i32`: Số nguyên 32-bit
- `i64`: Số nguyên 64-bit
- `f32`: Số thực 32-bit
- `f64`: Số thực 64-bit

Một tham số đơn được viết `(param i32)` và kiểu trả về được viết `(result i32)`, do đó một hàm nhị phân lấy hai số nguyên 32-bit và trả về một số thực 64-bit sẽ được viết như thế này:

```wat
(func (param i32) (param i32) (result f64) ...)
```

Sau chữ ký, các biến cục bộ được liệt kê với kiểu của chúng, ví dụ `(local i32)`. Các tham số về cơ bản chỉ là các biến cục bộ được khởi tạo với giá trị của đối số tương ứng được truyền bởi người gọi.

## Lấy và đặt các biến cục bộ và tham số

Các biến cục bộ/tham số có thể được đọc và viết bởi thân của hàm với các hướng dẫn `local.get` và `local.set`.

Các lệnh `local.get`/`local.set` tham chiếu đến mục cần lấy/đặt theo chỉ số số của nó: các tham số được tham chiếu trước, theo thứ tự khai báo, tiếp theo là các biến cục bộ theo thứ tự khai báo. Vì vậy với hàm sau:

```wat
(func (param i32) (param f32) (local f64)
  local.get 0
  local.get 1
  local.get 2
)
```

Hướng dẫn `local.get 0` sẽ lấy tham số i32, `local.get 1` sẽ lấy tham số f32, và `local.get 2` sẽ lấy biến cục bộ f64.

Có một vấn đề khác ở đây — sử dụng chỉ số số để tham chiếu đến các mục có thể gây nhầm lẫn và khó chịu. Để giảm thiểu điều này, bạn có thể đặt tên cho các tham số, biến cục bộ và hầu hết các mục khác bằng cách bao gồm một tên có tiền tố là ký hiệu đô la (`$`) ngay trước khai báo kiểu.

Do đó, bạn có thể viết lại chữ ký trước của chúng ta như sau:

```wat
(func (param $p1 i32) (param $p2 f32) (local $loc f64) …)
```

Và sau đó có thể viết `local.get $p1` thay vì `local.get 0`, v.v. (Lưu ý rằng khi văn bản này được chuyển đổi sang nhị phân, nhị phân sẽ chỉ chứa số nguyên.)

## Máy ngăn xếp

Trước khi chúng ta viết thân hàm, có một khái niệm quan trọng khác cần thảo luận: **máy ngăn xếp** (stack machine). Mặc dù trình duyệt biên dịch nó thành thứ gì đó hiệu quả hơn, thực thi Wasm được định nghĩa theo ngăn xếp máy nơi ý tưởng cơ bản là mọi loại hướng dẫn đẩy và/hoặc bật một số lượng nhất định giá trị `i32`/`i64`/`f32`/`f64` vào/từ một ngăn xếp.

Ví dụ: `local.get` được định nghĩa để đẩy giá trị của biến cục bộ mà nó đọc lên ngăn xếp, và `i32.add` bật hai giá trị `i32` (nó ngầm lấy hai giá trị trước đó được đẩy lên ngăn xếp), tính tổng của chúng (modulo 2^32), và đẩy giá trị i32 kết quả.

Khi một hàm được gọi, nó bắt đầu với một ngăn xếp trống, dần dần được lấp đầy và làm trống khi các hướng dẫn của thân được thực thi. Vì vậy, ví dụ, sau khi thực thi hàm sau:

```wat
(func (param $p i32)
  (result i32)
  local.get $p
  local.get $p
  i32.add
)
```

Ngăn xếp chứa chính xác một giá trị `i32` — kết quả của biểu thức (`$p + $p`), được xử lý bởi `i32.add`. Giá trị trả về của hàm chỉ là giá trị cuối cùng còn lại trên ngăn xếp.

Các quy tắc xác thực WebAssembly đảm bảo ngăn xếp khớp chính xác: nếu bạn khai báo `(result f32)`, thì ngăn xếp phải chứa chính xác một `f32` ở cuối. Nếu không có kiểu kết quả, ngăn xếp phải trống.

## Thân hàm đầu tiên của chúng ta

Thân hàm là một danh sách các hướng dẫn được thực hiện khi hàm được gọi. Kết hợp điều này với những gì chúng ta đã học, cuối cùng chúng ta có thể định nghĩa một mô-đun chứa hàm cơ bản của riêng chúng ta:

```wat
(module
  (func (param $lhs i32) (param $rhs i32) (result i32)
    local.get $lhs
    local.get $rhs
    i32.add
  )
)
```

Hàm này lấy hai tham số, cộng chúng lại và trả về kết quả.

Nhiều thứ có thể được đặt bên trong thân hàm, nhưng chúng ta sẽ bắt đầu với một hàm cơ bản cho bây giờ. Bạn sẽ thấy nhiều ví dụ hơn khi tiếp tục. Để có danh sách đầy đủ các opcode có sẵn, hãy tham khảo [tài liệu tham khảo Ngữ nghĩa webassembly.org](https://webassembly.github.io/spec/core/exec/index.html).

### Gọi hàm

Hàm của chúng ta sẽ không làm được nhiều điều một mình — bây giờ chúng ta cần gọi nó. Làm thế nào chúng ta làm điều đó? Giống như trong một mô-đun ES, các hàm Wasm phải được xuất khẩu rõ ràng bằng một câu lệnh `export` bên trong mô-đun.

Giống như các biến cục bộ, các hàm được xác định bởi chỉ số theo mặc định, nhưng để thuận tiện, chúng có thể được đặt tên. Hãy bắt đầu bằng cách làm điều này — trước tiên, chúng ta sẽ thêm một tên có tiền tố là ký hiệu đô la, ngay sau từ khóa `func`:

```wat
(func $add …)
```

Bây giờ chúng ta cần thêm một khai báo xuất khẩu — điều này trông như sau:

```wat
(export "add" (func $add))
```

Ở đây, `add` là tên mà hàm sẽ được xác định trong JavaScript, trong khi `$add` chọn ra hàm WebAssembly nào bên trong Mô-đun đang được xuất khẩu.

Vì vậy mô-đun cuối cùng của chúng ta (tạm thời) trông như thế này:

```wat
(module
  (func $add (param $lhs i32) (param $rhs i32) (result i32)
    local.get $lhs
    local.get $rhs
    i32.add
  )
  (export "add" (func $add))
)
```

Nếu bạn muốn theo dõi ví dụ, hãy lưu mô-đun ở trên vào một tệp có tên `add.wat`, sau đó chuyển đổi nó thành tệp nhị phân có tên `add.wasm` bằng wabt (xem [Chuyển đổi định dạng văn bản WebAssembly sang Wasm](/en-US/docs/WebAssembly/Guides/Text_format_to_Wasm) để biết chi tiết).

Tiếp theo, chúng ta sẽ không đồng bộ khởi tạo nhị phân (xem [Tải và chạy code WebAssembly](/en-US/docs/WebAssembly/Guides/Loading_and_running)) và thực thi hàm `add` của chúng ta trong JavaScript (bây giờ chúng ta có thể tìm thấy `add()` trong thuộc tính [`exports`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Instance/exports) của phiên bản):

```js
WebAssembly.instantiateStreaming(fetch("add.wasm")).then((obj) => {
  console.log(obj.instance.exports.add(1, 2)); // "3"
});
```

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub dưới dạng [add.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/add.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/add.html)). Xem thêm [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static) để biết thêm chi tiết về hàm khởi tạo.

## Khám phá các kiến thức cơ bản

Bây giờ chúng ta đã đề cập đến những điều cơ bản, hãy xem một số tính năng nâng cao hơn.

### Gọi hàm từ các hàm khác trong cùng mô-đun

Hướng dẫn `call` gọi một hàm đơn, với chỉ số hoặc tên của nó. Ví dụ: mô-đun sau chứa hai hàm — một trả về giá trị `42`, cái kia trả về kết quả của việc gọi hàm đầu tiên cộng thêm một:

```wat
(module
  (func $getAnswer (result i32)
    i32.const 42
  )
  (func (export "getAnswerPlus1") (result i32)
    call $getAnswer
    i32.const 1
    i32.add
  )
)
```

> [!NOTE]
> `i32.const` định nghĩa một số nguyên 32-bit và đẩy nó lên ngăn xếp. Bạn có thể hoán đổi `i32` với bất kỳ kiểu nào khác có sẵn, và thay đổi giá trị của hằng số thành bất kỳ giá trị nào bạn muốn (ở đây chúng ta đặt giá trị là `42`).

Trong ví dụ này, bạn sẽ nhận thấy một phần `(export "getAnswerPlus1")`, được khai báo ngay sau câu lệnh `func` trong hàm thứ hai — đây là cách viết tắt để khai báo rằng chúng ta muốn xuất khẩu hàm này, và định nghĩa tên chúng ta muốn xuất khẩu nó như thế nào.

Điều này tương đương về mặt chức năng với việc bao gồm một câu lệnh hàm riêng biệt bên ngoài hàm, ở nơi khác trong mô-đun theo cùng cách chúng ta đã làm trước đó, ví dụ:

```wat
(export "getAnswerPlus1" (func $functionName))
```

Code JavaScript để gọi mô-đun trên trông như thế này:

```js
WebAssembly.instantiateStreaming(fetch("call.wasm")).then((obj) => {
  console.log(obj.instance.exports.getAnswerPlus1()); // "43"
});
```

### Nhập khẩu hàm từ JavaScript

Chúng ta đã thấy JavaScript gọi các hàm WebAssembly, nhưng còn WebAssembly gọi các hàm JavaScript thì sao? WebAssembly không có bất kỳ kiến thức tích hợp nào về JavaScript, nhưng nó có cách chung để nhập khẩu các hàm có thể chấp nhận các hàm JavaScript hoặc Wasm. Hãy xem một ví dụ:

```wat
(module
  (import "console" "log" (func $log (param i32)))
  (func (export "logIt")
    i32.const 13
    call $log
  )
)
```

WebAssembly có không gian tên hai cấp, vì vậy câu lệnh nhập khẩu ở đây nhập khẩu hàm `log` từ mô-đun `console`. Bạn cũng có thể thấy rằng hàm `logIt` được xuất khẩu gọi hàm được nhập khẩu bằng hướng dẫn `call` chúng ta đã giới thiệu ở trên.

Các hàm được nhập khẩu giống như các hàm bình thường: chúng có chữ ký mà WebAssembly kiểm tra tĩnh, và chúng được gán chỉ số và có thể được đặt tên và gọi.

Các hàm JavaScript không có khái niệm về chữ ký, vì vậy bất kỳ hàm JavaScript nào cũng có thể được truyền, bất kể chữ ký được khai báo của nhập khẩu. Khi một mô-đun khai báo nhập khẩu, người gọi [`WebAssembly.instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static) phải truyền vào một đối tượng nhập khẩu có các thuộc tính tương ứng.

Nhập khẩu ở trên yêu cầu một đối tượng (hãy gọi nó là `importObject`) sao cho `importObject.console.log` là một hàm JavaScript.

Điều này trông như thế này trong JavaScript:

```js
const importObject = {
  console: {
    log(arg) {
      console.log(arg);
    },
  },
};

WebAssembly.instantiateStreaming(fetch("logger.wasm"), importObject).then(
  (obj) => {
    obj.instance.exports.logIt();
  },
);
```

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub dưới dạng [logger.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/logger.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/logger.html)).

### Khai báo toàn cục trong WebAssembly

WebAssembly có thể tạo các phiên bản biến toàn cục, có thể truy cập từ cả JavaScript và có thể nhập khẩu/xuất khẩu trên một hoặc nhiều phiên bản [`WebAssembly.Module`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Module). Điều này rất hữu ích vì nó cho phép liên kết động của nhiều mô-đun.

Trong định dạng văn bản WebAssembly, nó trông giống như thế này (xem [global.wat](https://github.com/mdn/webassembly-examples/blob/main/js-api-examples/global.wat) trong repo GitHub của chúng tôi; xem thêm [global.html](https://mdn.github.io/webassembly-examples/js-api-examples/global.html) để có ví dụ JavaScript trực tiếp):

```wat
(module
  (global $g (import "js" "global") (mut i32))
  (func (export "getGlobal") (result i32)
    (global.get $g)
  )
  (func (export "incGlobal")
    (global.set $g (i32.add (global.get $g) (i32.const 1)))
  )
)
```

Điều này trông tương tự như những gì chúng ta đã thấy trước đó, ngoại trừ chúng ta chỉ định một giá trị toàn cục bằng từ khóa `global`, và chúng ta cũng chỉ định từ khóa `mut` cùng với kiểu dữ liệu của giá trị nếu chúng ta muốn nó có thể thay đổi.

Để tạo một giá trị tương đương bằng JavaScript, bạn sẽ sử dụng constructor [`WebAssembly.Global()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Global):

```js
const global = new WebAssembly.Global({ value: "i32", mutable: true }, 0);
```

### Bộ nhớ WebAssembly

Các ví dụ trên cho thấy cách làm việc với số trong code hợp ngữ, cộng chúng vào [ngăn xếp](#máy_ngăn_xếp), thực hiện các phép toán trên chúng và sau đó ghi lại kết quả bằng cách gọi một phương thức trong JavaScript.

Để làm việc với chuỗi và các kiểu dữ liệu phức tạp hơn, chúng ta sử dụng `memory`, có thể được tạo trong WebAssembly hoặc JavaScript và được chia sẻ giữa các môi trường (các phiên bản gần đây hơn của WebAssembly cũng có thể sử dụng [Kiểu tham chiếu](#kiểu_tham_chiếu)).

Trong WebAssembly, `memory` chỉ là một mảng byte thô có thể thay đổi lớn, liên tục có thể lớn theo thời gian (xem [linear memory](https://webassembly.github.io/spec/core/intro/overview.html?highlight=linear+memory) trong đặc tả). WebAssembly chứa [các hướng dẫn bộ nhớ](/en-US/docs/WebAssembly/Reference/Memory) như [`i32.load`](/en-US/docs/WebAssembly/Reference/Memory/load) và [`i32.store`](/en-US/docs/WebAssembly/Reference/Memory/store) để đọc và ghi byte giữa ngăn xếp và bất kỳ vị trí nào trong bộ nhớ.

Từ góc độ JavaScript, cứ như thể bộ nhớ nằm bên trong một {{jsxref("ArrayBuffer")}} lớn có thể lớn.
JavaScript có thể tạo các phiên bản bộ nhớ tuyến tính WebAssembly thông qua giao diện [`WebAssembly.Memory()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) và xuất khẩu chúng sang một phiên bản bộ nhớ, hoặc truy cập một phiên bản bộ nhớ được tạo trong code WebAssembly và được xuất khẩu. Các phiên bản `Memory` JavaScript có một getter [`buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer), trả về một `ArrayBuffer` trỏ đến toàn bộ bộ nhớ tuyến tính.

Các phiên bản bộ nhớ cũng có thể tăng, ví dụ thông qua phương thức [`Memory.grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/grow) trong JavaScript hoặc [`memory.grow`](/en-US/docs/WebAssembly/Reference/Memory/grow) trong WebAssembly.
Vì các đối tượng `ArrayBuffer` không thể thay đổi kích thước, `ArrayBuffer` hiện tại bị tách rời và một `ArrayBuffer` mới được tạo để trỏ đến bộ nhớ mới, lớn hơn.

Lưu ý rằng khi bạn tạo bộ nhớ, bạn cần định nghĩa kích thước ban đầu và bạn có thể tùy chọn chỉ định kích thước tối đa mà bộ nhớ có thể tăng lên.
WebAssembly sẽ cố gắng đặt trước kích thước tối đa (nếu được chỉ định), và nếu có thể làm vậy, nó có thể tăng bộ đệm hiệu quả hơn trong tương lai. Ngay cả khi nó không thể phân bổ kích thước tối đa bây giờ, nó vẫn có thể tăng sau này.
Phương thức sẽ chỉ thất bại nếu nó không thể phân bổ kích thước _ban đầu_.

> [!NOTE]
> Ban đầu, WebAssembly chỉ cho phép một bộ nhớ trên mỗi phiên bản mô-đun.
> Bây giờ bạn có thể có [nhiều bộ nhớ](#nhiều_bộ_nhớ) khi được trình duyệt hỗ trợ.
> Code không sử dụng nhiều bộ nhớ không cần thay đổi!

Để minh họa một số hành vi này, hãy xem xét trường hợp chúng ta muốn làm việc với một chuỗi trong code WebAssembly.
Một chuỗi chỉ là một chuỗi byte ở đâu đó bên trong bộ nhớ tuyến tính này.
Giả sử chúng ta đã viết một chuỗi byte phù hợp vào bộ nhớ WebAssembly, chúng ta có thể truyền chuỗi đó cho JavaScript bằng cách chia sẻ bộ nhớ, offset của chuỗi trong bộ nhớ và một chỉ báo về độ dài của nó.

Đầu tiên, hãy tạo một số bộ nhớ và chia sẻ nó giữa WebAssembly và JavaScript.
WebAssembly cho chúng ta rất nhiều linh hoạt ở đây: chúng ta có thể tạo một đối tượng [`Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) trong JavaScript và để mô-đun WebAssembly nhập khẩu bộ nhớ, hoặc chúng ta có thể để mô-đun WebAssembly tạo bộ nhớ và xuất khẩu nó cho JavaScript.

Đối với ví dụ này, chúng ta sẽ tạo bộ nhớ trong JavaScript sau đó nhập khẩu nó vào WebAssembly.
Đầu tiên, chúng ta tạo một đối tượng `Memory` với 1 trang và thêm nó vào `importObject` của chúng ta dưới khóa `js.mem`.
Sau đó chúng ta khởi tạo mô-đun web assembly của mình, trong trường hợp này là "the_wasm_to_import.wasm", bằng cách sử dụng phương thức [`WebAssembly.instantiateStreaming()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiateStreaming_static) và truyền đối tượng nhập khẩu:

```js
const memory = new WebAssembly.Memory({ initial: 1 });

const importObject = {
  js: { mem: memory },
};

WebAssembly.instantiateStreaming(
  fetch("the_wasm_to_import.wasm"),
  importObject,
).then((obj) => {
  // Call exported functions ...
});
```

Trong tệp WebAssembly của chúng ta, chúng ta nhập khẩu bộ nhớ này. Sử dụng định dạng văn bản WebAssembly, câu lệnh `import` được viết như sau:

```wat
(import "js" "mem" (memory 1))
```

Bộ nhớ phải được nhập khẩu bằng khóa hai cấp tương tự được chỉ định trong `importObject` (`js.mem`).
`1` chỉ ra rằng bộ nhớ được nhập khẩu phải có ít nhất 1 trang bộ nhớ (WebAssembly hiện định nghĩa một trang là 64KB).

> [!NOTE]
> Vì đây là bộ nhớ đầu tiên được nhập khẩu vào mô-đun WebAssembly, nó có chỉ số bộ nhớ là `0`.
> Bạn có thể tham chiếu bộ nhớ cụ thể này bằng chỉ số trong [hướng dẫn bộ nhớ](/en-US/docs/WebAssembly/Reference/Memory), nhưng vì `0` là chỉ số mặc định, trong các ứng dụng bộ nhớ đơn bạn không cần phải làm vậy.

Bây giờ chúng ta có một phiên bản bộ nhớ được chia sẻ, bước tiếp theo là viết một chuỗi dữ liệu vào nó.
Sau đó chúng ta sẽ truyền thông tin về vị trí của chuỗi và độ dài của nó cho JavaScript (chúng ta có thể thay thế bằng cách mã hóa độ dài chuỗi trong chuỗi chính, nhưng truyền độ dài dễ triển khai hơn cho chúng ta).

Đầu tiên, hãy thêm một chuỗi dữ liệu vào bộ nhớ của chúng ta, trong trường hợp này là "Hi".
Vì chúng ta sở hữu toàn bộ bộ nhớ tuyến tính, chúng ta chỉ có thể viết nội dung chuỗi vào bộ nhớ toàn cục bằng cách sử dụng phần `data`.
Các phần data cho phép một chuỗi byte được viết tại một offset nhất định tại thời điểm khởi tạo và tương tự như các phần `.data` trong định dạng thực thi native.
Ở đây chúng ta đang viết dữ liệu vào bộ nhớ mặc định (mà chúng ta không cần chỉ định) tại offset 0:

```wat
(module
  (import "js" "mem" (memory 1))
  ;; ...
  (data (i32.const 0) "Hi")
  ;;
)
```

> [!NOTE]
> Cú pháp dấu chấm phẩy kép (`;;`) ở trên được sử dụng để chỉ ra các comment trong các tệp WebAssembly.
> Trong trường hợp này, chúng ta chỉ sử dụng chúng để chỉ ra placeholder cho code khác.

Để chia sẻ dữ liệu này với JavaScript, chúng ta sẽ định nghĩa hai hàm.
Đầu tiên, chúng ta nhập khẩu một hàm từ JavaScript, mà chúng ta sẽ sử dụng để ghi chuỗi vào bảng điều khiển.
Điều này sẽ cần được ánh xạ tới `console.log` trong `importObject` được sử dụng để khởi tạo mô-đun WebAssembly.
Hàm được đặt tên là `$log` trong WebAssembly và lấy các tham số `i32` cho offset chuỗi và độ dài trong bộ nhớ.

Hàm WebAssembly thứ hai, `writeHi()`, gọi hàm `$log` được nhập khẩu với offset và độ dài của chuỗi trong bộ nhớ (`0` và `2`).
Điều này được xuất khẩu từ mô-đun để nó có thể được gọi từ JavaScript.

Mô-đun WebAssembly cuối cùng của chúng ta (trong định dạng văn bản) trông như thế này.

```wat
(module
  (import "console" "log" (func $log (param i32 i32)))
  (import "js" "mem" (memory 1))
  (data (i32.const 0) "Hi")
  (func (export "writeHi")
    i32.const 0  ;; pass offset 0 to log
    i32.const 2  ;; pass length 2 to log
    call $log
  )
)
```

Ở phía JavaScript, chúng ta cần định nghĩa hàm ghi nhật ký, truyền nó cho WebAssembly và sau đó gọi phương thức `writeHi()` được xuất khẩu.
Code đầy đủ được hiển thị bên dưới:

```js
const memory = new WebAssembly.Memory({ initial: 1 });

// Logging function ($log) called from WebAssembly
function consoleLogString(offset, length) {
  const bytes = new Uint8Array(memory.buffer, offset, length);
  const string = new TextDecoder("utf8").decode(bytes);
  console.log(string);
}

const importObject = {
  console: { log: consoleLogString },
  js: { mem: memory },
};

WebAssembly.instantiateStreaming(fetch("logger2.wasm"), importObject).then(
  (obj) => {
    // Call the function exported from logger2.wasm
    obj.instance.exports.writeHi();
  },
);
```

Lưu ý rằng hàm ghi nhật ký `consoleLogString()` được truyền cho `importObject` trong thuộc tính `console.log` và được nhập khẩu bởi mô-đun WebAssembly.
Hàm tạo một view trên chuỗi trong bộ nhớ được chia sẻ bằng cách sử dụng `Uint8Array` tại offset được truyền và với độ dài đã cho.
Các byte sau đó được giải mã từ UTF-8 thành một chuỗi bằng cách sử dụng [TextDecoder API](/en-US/docs/Web/API/TextDecoder) (chúng ta chỉ định `utf8` ở đây, nhưng nhiều mã hóa khác được hỗ trợ).
Chuỗi sau đó được ghi vào bảng điều khiển với `console.log()`.

Bước cuối cùng là gọi hàm `writeHi()` được xuất khẩu, được thực hiện sau khi đối tượng được khởi tạo.
Khi bạn chạy code, bảng điều khiển sẽ hiển thị văn bản "Hi".

> [!NOTE]
> Bạn có thể tìm thấy mã nguồn đầy đủ trên GitHub dưới dạng [logger2.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/logger2.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/logger2.html)).

#### Nhiều bộ nhớ

Các triển khai gần đây hơn cho phép bạn sử dụng nhiều đối tượng bộ nhớ trong WebAssembly và JavaScript, theo cách tương thích với code được viết cho các triển khai chỉ hỗ trợ một bộ nhớ.
Nhiều bộ nhớ có thể hữu ích để phân tách dữ liệu cần được xử lý khác biệt với dữ liệu ứng dụng khác, chẳng hạn như dữ liệu công khai so với riêng tư, dữ liệu cần được lưu trữ và dữ liệu cần được chia sẻ giữa các luồng.
Nó cũng có thể hữu ích cho các ứng dụng rất lớn cần mở rộng vượt quá không gian địa chỉ 32-bit Wasm và cho các mục đích khác.

Các bộ nhớ được cung cấp cho code WebAssembly, dù được khai báo trực tiếp hay được nhập khẩu, được gán một số chỉ số bộ nhớ được phân bổ tuần tự, bắt đầu từ không. Tất cả [hướng dẫn bộ nhớ](/en-US/docs/WebAssembly/Reference/Memory), chẳng hạn như [`load`](/en-US/docs/WebAssembly/Reference/Memory/load) hoặc [`store`](/en-US/docs/WebAssembly/Reference/Memory/store), có thể tham chiếu bất kỳ bộ nhớ cụ thể nào thông qua chỉ số của nó để bạn có thể kiểm soát bộ nhớ nào bạn đang làm việc.

Các hướng dẫn bộ nhớ có chỉ số mặc định là 0, chỉ số của bộ nhớ đầu tiên được thêm vào phiên bản WebAssembly.
Kết quả là, nếu bạn chỉ thêm một bộ nhớ, code của bạn không cần phải chỉ định chỉ số.

Để giải thích điều này chi tiết hơn, chúng ta sẽ mở rộng ví dụ trước để viết chuỗi vào ba bộ nhớ khác nhau và ghi lại kết quả.
Code bên dưới cho thấy cách chúng ta đầu tiên nhập khẩu hai phiên bản bộ nhớ, sử dụng cùng cách tiếp cận như trong ví dụ trước.
Để cho thấy cách bạn có thể tạo bộ nhớ trong mô-đun WebAssembly, chúng ta đã tạo một phiên bản bộ nhớ thứ ba có tên `$mem2` trong mô-đun và _xuất khẩu_ nó.

> [!NOTE]
> Nếu bạn đang sử dụng [wabt](https://github.com/WebAssembly/wabt) (ví dụ: `wat2wasm`) để chuyển đổi định dạng văn bản sang Wasm, bạn có thể cần truyền `--enable-multi-memory` vì hỗ trợ đa bộ nhớ vẫn là tùy chọn.

```wat
(module
  ;; ...

  (import "js" "mem0" (memory 1))
  (import "js" "mem1" (memory 1))

  ;; Create and export a third memory
  (memory $mem2 1)
  (export "memory2" (memory $mem2))

  ;; ...
)
```

Ba phiên bản bộ nhớ được tự động gán chỉ số bộ nhớ dựa trên thứ tự tạo của chúng.
Code bên dưới cho thấy cách chúng ta có thể chỉ định chỉ số này (ví dụ: `(memory 1)`) trong hướng dẫn `data` để chọn bộ nhớ chúng ta muốn viết một chuỗi vào (bạn có thể sử dụng cùng cách tiếp cận cho tất cả các hướng dẫn bộ nhớ khác, chẳng hạn như `load` và `grow`).
Ở đây chúng ta viết một chuỗi chỉ ra mỗi loại bộ nhớ.

```wat
  (data (memory 0) (i32.const 0) "Memory 0 data")
  (data (memory 1) (i32.const 0) "Memory 1 data")
  (data (memory 2) (i32.const 0) "Memory 2 data")

  ;; Add text to default (0-index) memory
  (data (i32.const 13) " (Default)")
```

Lưu ý rằng `(memory 0)` là mặc định, và do đó là tùy chọn.
Để minh họa điều này, chúng ta viết văn bản `" (Default)"` mà không chỉ định chỉ số bộ nhớ, và nó sẽ được thêm vào sau `"Memory 0 data"` khi nội dung bộ nhớ được ghi lại.

Code ghi nhật ký WebAssembly tương tự như ví dụ trước, ngoại trừ chúng ta cần truyền chỉ số của bộ nhớ chứa chuỗi cùng với offset và độ dài chuỗi.
Chúng ta cũng ghi lại tất cả ba phiên bản bộ nhớ.

Mô-đun đầy đủ được hiển thị bên dưới:

```wat
(module
  (import "console" "log" (func $log (param i32 i32 i32)))

  (import "js" "mem0" (memory 1))
  (import "js" "mem1" (memory 1))

  ;; Create and export a third memory
  (memory $mem2 1)
  (export "memory2" (memory $mem2))

  (data (memory 0) (i32.const 0) "Memory 0 data")
  (data (memory 1) (i32.const 0) "Memory 1 data")
  (data (memory 2) (i32.const 0) "Memory 2 data")

  ;; Add text to default (0-index) memory
  (data (i32.const 13) " (Default)")

  (func $logMemory (param $memIndex i32) (param $memOffSet i32) (param $stringLength i32)
    local.get $memIndex
    local.get $memOffSet
    local.get $stringLength
    call $log
  )

  (func (export "logAllMemory")
    ;; Log memory index 0, offset 0
    (i32.const 0)  ;; memory index 0
    (i32.const 0)  ;; memory offset 0
    (i32.const 23)  ;; string length 23
    (call $logMemory)

    ;; Log memory index 1, offset 0
    i32.const 1  ;; memory index 1
    i32.const 0  ;; memory offset 0
    i32.const 20  ;; string length 20 - overruns the length of the data for illustration
    call $logMemory

    ;; Log memory index 2, offset 0
    i32.const 2  ;; memory index 2
    i32.const 0  ;; memory offset 0
    i32.const 13  ;; string length 13
    call $logMemory
  )
)
```

Code JavaScript cũng rất tương tự như ví dụ trước, ngoại trừ chúng ta tạo và truyền hai phiên bản bộ nhớ cho `importObject()` và bộ nhớ được xuất khẩu bởi phiên bản mô-đun được truy cập sau khi nó được khởi tạo bằng promise đã giải quyết (`obj.instance.exports`).
Code để ghi nhật ký mỗi chuỗi cũng phức tạp hơn một chút vì chúng ta cần khớp số phiên bản bộ nhớ từ WebAssembly với một đối tượng `Memory` cụ thể.

```js
const memory0 = new WebAssembly.Memory({ initial: 1 });
const memory1 = new WebAssembly.Memory({ initial: 1 });
let memory2; // Created by module

function consoleLogString(memoryInstance, offset, length) {
  let memory;
  switch (memoryInstance) {
    case 0:
      memory = memory0;
      break;
    case 1:
      memory = memory1;
      break;
    case 2:
      memory = memory2;
      break;
    // code block
  }
  const bytes = new Uint8Array(memory.buffer, offset, length);
  const string = new TextDecoder("utf8").decode(bytes);
  log(string); // implementation not shown - could call console.log()
}

const importObject = {
  console: { log: consoleLogString },
  js: { mem0: memory0, mem1: memory1 },
};

WebAssembly.instantiateStreaming(fetch("multi-memory.wasm"), importObject).then(
  (obj) => {
    // Get exported memory
    memory2 = obj.instance.exports.memory2;
    // Log memory
    obj.instance.exports.logAllMemory();
  },
);
```

Đầu ra của ví dụ sẽ tương tự như văn bản bên dưới, ngoại trừ "Memory 1 data" có thể có một số "ký tự rác" theo sau, vì bộ giải mã văn bản được truyền nhiều byte hơn được sử dụng để mã hóa chuỗi.

```plain
Memory 0 data (Default)
Memory 1 data
Memory 2 data
```

Bạn có thể tìm thấy mã nguồn đầy đủ trên GitHub dưới dạng [multi-memory.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/multi-memory.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/multi-memory.html))

> [!NOTE]
> Xem [`webassembly.multiMemory` trong trang chủ](/en-US/docs/WebAssembly#webassembly.multimemory) để biết thông tin tương thích trình duyệt cho tính năng này.

### Bảng WebAssembly

Để kết thúc chuyến tham quan về định dạng văn bản WebAssembly, hãy xem phần phức tạp và thường gây nhầm lẫn nhất của WebAssembly: **bảng** (table). Bảng về cơ bản là các mảng tham chiếu có thể thay đổi kích thước có thể được truy cập bởi chỉ số từ code WebAssembly.

Để thấy tại sao bảng là cần thiết, chúng ta cần quan sát rằng hướng dẫn `call` chúng ta đã thấy trước đó (xem [Gọi hàm từ các hàm khác trong cùng mô-đun](#gọi_hàm_từ_các_hàm_khác_trong_cùng_mô-đun)) lấy chỉ số hàm tĩnh và do đó chỉ có thể gọi một hàm — nhưng điều gì nếu callee là một giá trị runtime?

- Trong JavaScript, chúng ta thấy điều này mọi lúc: các hàm là các giá trị đầu tiên.
- Trong C/C++, chúng ta thấy điều này với con trỏ hàm.
- Trong C++, chúng ta thấy điều này với các hàm ảo.

WebAssembly cần một loại hướng dẫn gọi để đạt được điều này, vì vậy chúng ta cung cấp cho nó `call_indirect`, lấy một toán tử hàm động. Vấn đề là các kiểu duy nhất chúng ta có thể cung cấp cho toán tử trong WebAssembly là (hiện tại) `i32`/`i64`/`f32`/`f64`.

WebAssembly có thể thêm kiểu `anyfunc` ("any" vì kiểu có thể giữ các hàm với bất kỳ chữ ký nào), nhưng thật không may, kiểu `anyfunc` này không thể được lưu trữ trong bộ nhớ tuyến tính vì lý do bảo mật. Bộ nhớ tuyến tính hiển thị nội dung thô của các giá trị được lưu trữ dưới dạng byte, do đó, nội dung Wasm có thể tùy ý quan sát và làm hỏng các địa chỉ hàm thô, điều không được phép trên web.

Giải pháp là lưu trữ các tham chiếu hàm trong một bảng và truyền các chỉ số bảng thay thế, chỉ là các giá trị i32. Toán tử của `call_indirect` do đó có thể là một giá trị chỉ số i32.

#### Định nghĩa một bảng trong Wasm

Vậy, làm thế nào chúng ta đặt các hàm Wasm vào bảng của chúng ta? Cũng giống như các phần `data` có thể được sử dụng để khởi tạo các vùng bộ nhớ tuyến tính bằng byte, các phần `elem` có thể được sử dụng để khởi tạo các vùng của bảng với các hàm:

```wat
(module
  (table 2 funcref)
  (elem (i32.const 0) $f1 $f2)
  (func $f1 (result i32)
    i32.const 42)
  (func $f2 (result i32)
    i32.const 13)
  ...
)
```

- Trong `(table 2 funcref)`, `2` là kích thước ban đầu của bảng (nghĩa là nó sẽ lưu trữ hai tham chiếu) và `funcref` khai báo kiểu phần tử của các tham chiếu này là tham chiếu hàm.
- Các phần hàm (`func`) giống như bất kỳ hàm Wasm được khai báo nào khác. Đây là các hàm chúng ta sẽ tham chiếu trong bảng của mình (ví dụ, mỗi hàm trả về một giá trị hằng số). Lưu ý rằng thứ tự các phần được khai báo không quan trọng ở đây — bạn có thể khai báo các hàm của mình ở bất cứ đâu và vẫn tham chiếu chúng trong phần `elem`.
- Phần `elem` có thể liệt kê bất kỳ tập hợp con nào của các hàm trong một mô-đun, theo bất kỳ thứ tự nào, cho phép các bản sao. Đây là danh sách các hàm được tham chiếu bởi bảng, theo thứ tự chúng sẽ được tham chiếu.
- Giá trị `(i32.const 0)` bên trong phần `elem` là một offset — điều này cần được khai báo ở đầu phần và chỉ định tại chỉ số nào trong bảng tham chiếu hàm bắt đầu được điền vào. Ở đây chúng ta đã chỉ định 0 và kích thước là 2 (xem ở trên), vì vậy chúng ta có thể điền hai tham chiếu tại các chỉ số 0 và 1. Nếu chúng ta muốn bắt đầu viết các tham chiếu tại offset 1, chúng ta phải viết `(i32.const 1)`, và kích thước bảng phải là 3.

> [!NOTE]
> Các phần tử chưa được khởi tạo được gán một giá trị mặc định ném-khi-gọi.

Trong JavaScript, các lời gọi tương đương để tạo phiên bản bảng như vậy sẽ trông giống như thế này:

```js
function module() {
  // table section
  const tbl = new WebAssembly.Table({ initial: 2, element: "anyfunc" });

  // function sections:
  const f1 = () => 42; /* some imported WebAssembly function */
  const f2 = () => 13; /* some imported WebAssembly function */

  // elem section
  tbl.set(0, f1);
  tbl.set(1, f2);
}
```

#### Sử dụng bảng

Tiếp tục, bây giờ chúng ta đã định nghĩa bảng, chúng ta cần sử dụng nó theo một cách nào đó. Hãy sử dụng phần code này để làm vậy:

```wat
...
(type $return_i32 (func (result i32))) ;; if this was f32, type checking would fail
(func (export "callByIndex") (param $i i32) (result i32)
  local.get $i
  call_indirect (type $return_i32)
)
```

- Khối `(type $return_i32 (func (result i32)))` chỉ định một kiểu, với tên tham chiếu. Kiểu này được sử dụng khi thực hiện kiểm tra kiểu của các lời gọi tham chiếu hàm bảng sau này. Ở đây chúng ta nói rằng các tham chiếu cần là các hàm trả về `i32` là kết quả.
- Tiếp theo, chúng ta định nghĩa một hàm sẽ được xuất khẩu với tên `callByIndex`. Điều này sẽ lấy một `i32` làm tham số, được gán tên đối số `$i`.
- Bên trong hàm, chúng ta thêm một giá trị vào ngăn xếp — bất kỳ giá trị nào được truyền vào làm tham số `$i`.
- Cuối cùng, chúng ta sử dụng `call_indirect` để gọi một hàm từ bảng — nó ngầm bật giá trị của `$i` ra khỏi ngăn xếp. Kết quả cuối cùng là hàm `callByIndex` gọi hàm thứ `$i` trong bảng.

Bạn cũng có thể khai báo tham số `call_indirect` một cách rõ ràng trong cuộc gọi lệnh thay vì trước nó, như thế này:

```wat
(call_indirect (type $return_i32) (local.get $i))
```

Trong một ngôn ngữ cấp cao hơn, biểu cảm hơn như JavaScript, bạn có thể tưởng tượng làm điều tương tự với một mảng (hoặc có thể là một đối tượng) chứa các hàm. Mã giả sẽ trông giống như `tbl[i]()`.

Vậy, quay lại kiểm tra kiểu. Vì WebAssembly được kiểm tra kiểu, và `funcref` có thể có bất kỳ chữ ký hàm nào, chúng ta phải cung cấp chữ ký được giả định của callee tại callsite. Do đó chúng ta bao gồm kiểu `$return_i32` để chỉ định rằng một hàm trả về `i32` được mong đợi. Nếu callee không có chữ ký khớp (ví dụ: `f32` được trả về thay thế), một [`WebAssembly.RuntimeError`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/RuntimeError) sẽ được ném ra.

Vậy điều gì liên kết `call_indirect` với bảng chúng ta đang gọi? Câu trả lời là hiện tại chỉ có một bảng được phép trên mỗi phiên bản mô-đun, và đó là những gì `call_indirect` đang ngầm gọi. Trong tương lai, khi nhiều bảng được cho phép, chúng ta cũng sẽ cần chỉ định một số loại định danh bảng, theo dạng:

```wat
call_indirect $my_spicy_table (type $i32_to_void)
```

Mô-đun đầy đủ trông như thế này và có thể được tìm thấy trong tệp ví dụ [wasm-table.wat](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/wasm-table.wat) của chúng tôi:

```wat
(module
  (table 2 funcref)
  (func $f1 (result i32)
    i32.const 42
  )
  (func $f2 (result i32)
    i32.const 13
  )
  (elem (i32.const 0) $f1 $f2)
  (type $return_i32 (func (result i32)))
  (func (export "callByIndex") (param $i i32) (result i32)
    local.get $i
    call_indirect (type $return_i32)
  )
)
```

Chúng ta tải nó vào một trang web bằng cách sử dụng JavaScript sau:

```js
WebAssembly.instantiateStreaming(fetch("wasm-table.wasm")).then((obj) => {
  console.log(obj.instance.exports.callByIndex(0)); // returns 42
  console.log(obj.instance.exports.callByIndex(1)); // returns 13
  console.log(obj.instance.exports.callByIndex(2)); // returns an error, because there is no index position 2 in the table
});
```

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub dưới dạng [wasm-table.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/wasm-table.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/wasm-table.html)).

> [!NOTE]
> Cũng giống như Bộ nhớ, Bảng cũng có thể được tạo từ JavaScript (xem [`WebAssembly.Table()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table)) cũng như được nhập khẩu vào/từ mô-đun Wasm khác.

### Thay đổi bảng và liên kết động

Vì JavaScript có toàn quyền truy cập vào các tham chiếu hàm, đối tượng Table có thể được thay đổi từ JavaScript bằng cách sử dụng các phương thức [`grow()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/grow), [`get()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/get) và [`set()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Table/set). Và code WebAssembly tự nó có thể thao tác các bảng bằng cách sử dụng các hướng dẫn được thêm vào như một phần của [Kiểu tham chiếu](#kiểu_tham_chiếu), chẳng hạn như `table.get` và `table.set`.

Vì bảng có thể thay đổi, chúng có thể được sử dụng để thực hiện các [sơ đồ liên kết động](https://github.com/WebAssembly/tool-conventions/blob/main/DynamicLinking.md) phức tạp tại thời gian tải và chạy. Khi một chương trình được liên kết động, nhiều phiên bản chia sẻ cùng bộ nhớ và bảng. Điều này tương tự như một ứng dụng native nơi nhiều `.dll` được biên dịch chia sẻ không gian địa chỉ của một tiến trình duy nhất.

Để thấy điều này trong hành động, chúng ta sẽ tạo một đối tượng nhập khẩu duy nhất chứa đối tượng Memory và đối tượng Table, và truyền cùng đối tượng nhập khẩu này cho nhiều lời gọi [`instantiate()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/instantiate_static).

Các ví dụ `.wat` của chúng ta trông như sau:

`shared0.wat`:

```wat
(module
  (import "js" "memory" (memory 1))
  (import "js" "table" (table 1 funcref))
  (elem (i32.const 0) $shared0func)
  (func $shared0func (result i32)
    i32.const 0
    i32.load
  )
)
```

`shared1.wat`:

```wat
(module
  (import "js" "memory" (memory 1))
  (import "js" "table" (table 1 funcref))
  (type $void_to_i32 (func (result i32)))
  (func (export "doIt") (result i32)
   i32.const 0
   i32.const 42
   i32.store  ;; store 42 at address 0
   i32.const 0
   call_indirect (type $void_to_i32)
  )
)
```

Chúng hoạt động như sau:

1. Hàm `shared0func` được định nghĩa trong `shared0.wat` và được lưu trữ trong bảng được nhập khẩu của chúng ta.
2. Hàm này tạo một hằng số chứa giá trị `0`, và sau đó sử dụng lệnh `i32.load` để tải giá trị chứa trong chỉ số bộ nhớ được cung cấp. Chỉ số được cung cấp là `0` — một lần nữa, nó ngầm bật giá trị trước đó ra khỏi ngăn xếp. Vì vậy, `shared0func` tải và trả về giá trị được lưu trữ tại chỉ số bộ nhớ `0`.
3. Trong `shared1.wat`, chúng ta xuất khẩu một hàm có tên `doIt` — hàm này tạo hai hằng số chứa các giá trị `0` và `42`, sau đó gọi `i32.store` để lưu trữ một giá trị được cung cấp tại một chỉ số được cung cấp của bộ nhớ được nhập khẩu. Một lần nữa, nó ngầm bật các giá trị này ra khỏi ngăn xếp, vì vậy kết quả là nó lưu trữ giá trị `42` trong chỉ số bộ nhớ `0`,
4. Trong phần cuối cùng của hàm, chúng ta tạo một hằng số với giá trị `0`, sau đó gọi hàm tại chỉ số 0 của bảng, đó là `shared0func`, được lưu ở đó trước bởi khối `elem` trong `shared0.wat`.
5. Khi được gọi, `shared0func` tải `42` chúng ta đã lưu trữ trong bộ nhớ bằng lệnh `i32.store` trong `shared1.wat`.

> [!NOTE]
> Các biểu thức trên một lần nữa bật các giá trị từ ngăn xếp ngầm, nhưng bạn có thể khai báo các giá trị này một cách rõ ràng bên trong các lời gọi lệnh thay thế, ví dụ:
>
> ```wat
> (i32.store (i32.const 0) (i32.const 42))
> (call_indirect (type $void_to_i32) (i32.const 0))
> ```

Sau khi chuyển đổi sang nhị phân WebAssembly (Wasm), chúng ta sẽ sử dụng `shared0.wasm` và `shared1.wasm` trong JavaScript thông qua code sau:

```js
const importObj = {
  js: {
    memory: new WebAssembly.Memory({ initial: 1 }),
    table: new WebAssembly.Table({ initial: 1, element: "anyfunc" }),
  },
};

Promise.all([
  WebAssembly.instantiateStreaming(fetch("shared0.wasm"), importObj),
  WebAssembly.instantiateStreaming(fetch("shared1.wasm"), importObj),
]).then((results) => {
  console.log(results[1].instance.exports.doIt()); // prints 42
});
```

Mỗi mô-đun đang được biên dịch có thể nhập khẩu cùng các đối tượng bộ nhớ và bảng và do đó chia sẻ cùng bộ nhớ tuyến tính và "không gian địa chỉ" bảng.

> [!NOTE]
> Bạn có thể tìm thấy ví dụ này trên GitHub dưới dạng [shared-address-space.html](https://github.com/mdn/webassembly-examples/blob/main/understanding-text-format/shared-address-space.html) ([xem nó trực tiếp](https://mdn.github.io/webassembly-examples/understanding-text-format/shared-address-space.html)).

## Các phép toán bộ nhớ hàng loạt

Các phép toán bộ nhớ hàng loạt là một bổ sung mới hơn cho ngôn ngữ. Bảy phép toán tích hợp mới được cung cấp cho các phép toán bộ nhớ hàng loạt, chẳng hạn như sao chép và khởi tạo, để cho phép WebAssembly mô hình hóa các hàm native như `memcpy` và `memmove` theo cách hiệu quả và có hiệu suất hơn.

> [!NOTE]
> Xem [`webassembly.bulk-memory-operations` trong trang chủ](/en-US/docs/WebAssembly#webassembly.bulk-memory-operations) để biết thông tin tương thích trình duyệt.

Các phép toán mới là:

- `data.drop`: Loại bỏ dữ liệu trong phân đoạn dữ liệu.
- `elem.drop`: Loại bỏ dữ liệu trong phân đoạn phần tử.
- `memory.copy`: Sao chép từ vùng bộ nhớ tuyến tính này sang vùng khác.
- `memory.fill`: Lấp đầy vùng bộ nhớ tuyến tính bằng giá trị byte đã cho.
- `memory.init`: Sao chép một vùng từ phân đoạn dữ liệu.
- `table.copy`: Sao chép từ vùng bảng này sang vùng khác.
- `table.init`: Sao chép một vùng từ phân đoạn phần tử.

> [!NOTE]
> Bạn có thể tìm thấy thêm thông tin trong đề xuất [Bulk Memory Operations and Conditional Segment Initialization](https://github.com/WebAssembly/bulk-memory-operations/blob/master/proposals/bulk-memory-operations/Overview.md).

## Kiểu

### Kiểu số

WebAssembly hiện có bốn _kiểu số_ có sẵn:

- `i32`: Số nguyên 32-bit
- `i64`: Số nguyên 64-bit
- `f32`: Số thực 32-bit
- `f64`: Số thực 64-bit

### Kiểu vector

- `v128`: Vector 128-bit của số nguyên, dữ liệu dấu phẩy động, hoặc một kiểu 128-bit duy nhất.

### Kiểu tham chiếu

[Đề xuất kiểu tham chiếu](https://github.com/WebAssembly/reference-types/blob/master/proposals/reference-types/Overview.md) cung cấp hai tính năng chính:

- Một kiểu mới, `externref`, có thể giữ _bất kỳ_ giá trị JavaScript nào, ví dụ: chuỗi, tham chiếu DOM, đối tượng, v.v. `externref` không minh bạch từ góc độ của WebAssembly — một mô-đun Wasm không thể truy cập và thao tác các giá trị này và thay vào đó chỉ có thể nhận chúng và truyền chúng trở lại. Điều này vẫn rất hữu ích để cho phép các mô-đun Wasm gọi các hàm JavaScript, các DOM API, v.v. và nói chung để mở đường cho khả năng tương tác dễ dàng hơn với môi trường host. `externref` có thể được sử dụng cho các kiểu giá trị và các phần tử bảng.
- Một số hướng dẫn mới cho phép các mô-đun Wasm trực tiếp thao tác [các bảng WebAssembly](#bảng_webassembly), thay vì phải làm thông qua JavaScript API.

> [!NOTE]
> Tài liệu [wasm-bindgen](https://rustwasm.github.io/docs/wasm-bindgen/) chứa một số thông tin hữu ích về cách tận dụng `externref` từ Rust.

> [!NOTE]
> Xem [`webassembly.reference-types` trong trang chủ](/en-US/docs/WebAssembly#webassembly.reference-types) để biết thông tin tương thích trình duyệt.

## WebAssembly đa giá trị

Một bổ sung gần đây hơn cho ngôn ngữ là WebAssembly đa giá trị, có nghĩa là các hàm WebAssembly bây giờ có thể trả về nhiều giá trị và các chuỗi hướng dẫn có thể tiêu thụ và tạo ra nhiều giá trị ngăn xếp.

> [!NOTE]
> Xem [`webassembly.multi-value` trong trang chủ](/en-US/docs/WebAssembly#webassembly.multi-value) để biết thông tin tương thích trình duyệt.

Tại thời điểm viết (tháng 6 năm 2020) điều này đang ở giai đoạn đầu và các hướng dẫn đa giá trị duy nhất có sẵn là các lời gọi đến các hàm trả về nhiều giá trị. Ví dụ:

```wat
(module
  (func $get_two_numbers (result i32 i32)
    i32.const 1
    i32.const 2
  )
  (func (export "add_two_numbers") (result i32)
    call $get_two_numbers
    i32.add
  )
)
```

Nhưng điều này sẽ mở đường cho các loại hướng dẫn hữu ích hơn và các thứ khác ngoài ra. Để có bài viết hữu ích về tiến trình cho đến nay và cách thức hoạt động của nó, hãy xem [Multi-Value All The Wasm!](https://hacks.mozilla.org/2019/11/multi-value-all-the-wasm/) bởi Nick Fitzgerald.

## Luồng WebAssembly

Luồng WebAssembly cho phép các đối tượng Bộ nhớ WebAssembly được chia sẻ trên nhiều phiên bản WebAssembly chạy trong các Web Worker riêng biệt, theo cùng cách như [`SharedArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer) trong JavaScript. Điều này cho phép giao tiếp nhanh giữa các Worker và tăng hiệu suất đáng kể trong các ứng dụng web.

Đề xuất luồng có hai phần: bộ nhớ được chia sẻ và các truy cập bộ nhớ nguyên tử.

> [!NOTE]
> Xem [`webassembly.threads-and-atomics` trong trang chủ](/en-US/docs/WebAssembly#webassembly.threads-and-atomics) để biết thông tin tương thích trình duyệt.

### Bộ nhớ được chia sẻ

Như đã mô tả ở trên, bạn có thể tạo các đối tượng [`Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) WebAssembly được chia sẻ, có thể được chuyển giữa các ngữ cảnh Window và Worker bằng [`postMessage()`](/en-US/docs/Web/API/Window/postMessage), theo cùng cách như [`SharedArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer).

Ở phía JavaScript API, đối tượng khởi tạo của constructor [`WebAssembly.Memory()`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/Memory) bây giờ có thuộc tính `shared`, khi được đặt thành `true` sẽ tạo một bộ nhớ được chia sẻ:

```js
const memory = new WebAssembly.Memory({
  initial: 10,
  maximum: 100,
  shared: true,
});
```

thuộc tính [`buffer`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory/buffer) của bộ nhớ bây giờ sẽ trả về một `SharedArrayBuffer`, thay vì `ArrayBuffer` thông thường:

```js
memory.buffer; // returns SharedArrayBuffer
```

Trong định dạng văn bản, bạn có thể tạo một bộ nhớ được chia sẻ bằng từ khóa `shared`, như thế này:

```wat
(memory 1 2 shared)
```

Không giống như các bộ nhớ không được chia sẻ, các bộ nhớ được chia sẻ phải chỉ định kích thước "tối đa", trong cả constructor JavaScript API và định dạng văn bản Wasm.

> [!NOTE]
> Bạn có thể tìm thấy nhiều chi tiết hơn trong [Đề xuất luồng cho WebAssembly](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md).

### Các truy cập bộ nhớ nguyên tử

Một số hướng dẫn Wasm mới đã được thêm vào có thể được sử dụng để thực hiện các tính năng cấp cao hơn như mutex, biến điều kiện, v.v. Bạn có thể [tìm thấy chúng được liệt kê ở đây](https://github.com/WebAssembly/threads/blob/main/proposals/threads/Overview.md#atomic-memory-accesses).

> [!NOTE]
> [Trang hỗ trợ Emscripten Pthreads](https://emscripten.org/docs/porting/pthreads.html) cho thấy cách tận dụng chức năng mới này từ Emscripten.

## Tóm tắt

Điều này kết thúc chuyến tham quan cấp cao của chúng ta về các thành phần chính của định dạng văn bản WebAssembly và cách chúng được phản ánh trong JavaScript API WebAssembly.

## Xem thêm

- Điều chính không được bao gồm là danh sách toàn diện của tất cả các hướng dẫn có thể xuất hiện trong thân hàm. Xem [Ngữ nghĩa WebAssembly](https://webassembly.github.io/spec/core/exec/index.html) để xem từng hướng dẫn.
- Xem thêm [ngữ pháp của định dạng văn bản](https://github.com/WebAssembly/spec/blob/main/interpreter/README.md#s-expression-syntax) được triển khai bởi trình thông dịch đặc tả.
