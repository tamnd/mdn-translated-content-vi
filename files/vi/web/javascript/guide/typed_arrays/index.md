---
title: JavaScript typed arrays
slug: Web/JavaScript/Guide/Typed_arrays
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Using_promises", "Web/JavaScript/Guide/Iterators_and_generators")}}

Typed array trong JavaScript là các object giống mảng cung cấp cơ chế đọc và ghi dữ liệu nhị phân thô trong các vùng bộ nhớ đệm (memory buffer).

Typed array không được thiết kế để thay thế mảng cho bất kỳ chức năng nào. Thay vào đó, chúng cung cấp cho lập trình viên một giao diện quen thuộc để thao tác dữ liệu nhị phân. Điều này hữu ích khi tương tác với các tính năng của nền tảng, chẳng hạn như xử lý âm thanh và video, truy cập dữ liệu thô qua [WebSocket](/en-US/docs/Web/API/WebSockets_API), v.v. Mỗi phần tử trong typed array JavaScript là một giá trị nhị phân thô theo một trong nhiều định dạng được hỗ trợ, từ số nguyên 8-bit đến số thực dấu phẩy động 64-bit.

Các object typed array chia sẻ nhiều method giống mảng với ngữ nghĩa tương tự. Tuy nhiên, typed array _không_ được nhầm lẫn với mảng thông thường, vì gọi {{jsxref("Array.isArray()")}} trên typed array trả về `false`. Hơn nữa, không phải tất cả method của mảng thông thường đều được hỗ trợ trong typed array (ví dụ như push và pop).

Để đạt hiệu quả và linh hoạt tối đa, JavaScript typed array tách biệt triển khai thành _buffer_ và _view_. Buffer là một object đại diện cho một đoạn dữ liệu; nó không có định dạng cụ thể và không cung cấp cơ chế truy cập nội dung. Để truy cập bộ nhớ trong buffer, bạn cần dùng một [view](#views). View cung cấp _ngữ cảnh_ — tức là kiểu dữ liệu, offset bắt đầu và số phần tử.

![A diagram showing how different typed arrays may be views of the same underlying buffer. Each one has a different element number and width.](typed_arrays.png)

## Buffer

Có hai loại buffer: {{jsxref("ArrayBuffer")}} và {{jsxref("SharedArrayBuffer")}}. Cả hai đều là biểu diễn cấp thấp của một vùng bộ nhớ. Chúng có từ "array" trong tên nhưng không liên quan nhiều đến mảng — bạn không thể đọc hoặc ghi trực tiếp vào chúng. Thay vào đó, buffer là các object tổng quát chỉ chứa dữ liệu thô. Để truy cập bộ nhớ được đại diện bởi buffer, bạn cần dùng view.

Buffer hỗ trợ các thao tác sau:

- _Allocate_ (cấp phát): Ngay khi buffer mới được tạo, một vùng bộ nhớ mới được cấp phát và khởi tạo về `0`.
- _Copy_ (sao chép): Dùng method {{jsxref("ArrayBuffer/slice", "slice()")}}, bạn có thể sao chép hiệu quả một phần bộ nhớ mà không cần tạo view để sao chép từng byte thủ công.
- _Transfer_ (chuyển giao): Dùng method {{jsxref("ArrayBuffer/transfer", "transfer()")}} và {{jsxref("ArrayBuffer/transferToFixedLength", "transferToFixedLength()")}}, bạn có thể chuyển quyền sở hữu vùng bộ nhớ sang một object buffer mới. Điều này hữu ích khi truyền dữ liệu giữa các execution context khác nhau mà không cần sao chép. Sau khi chuyển giao, buffer gốc không còn dùng được nữa. `SharedArrayBuffer` không thể được chuyển giao (vì buffer đã được chia sẻ bởi tất cả execution context).
- _Resize_ (thay đổi kích thước): Dùng method {{jsxref("ArrayBuffer/resize", "resize()")}}, bạn có thể thay đổi kích thước vùng bộ nhớ (yêu cầu thêm bộ nhớ, miễn là không vượt giới hạn {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} được thiết lập trước, hoặc giải phóng bớt bộ nhớ). `SharedArrayBuffer` chỉ có thể được [mở rộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/grow) chứ không thể thu nhỏ.

Sự khác biệt giữa `ArrayBuffer` và `SharedArrayBuffer` là `ArrayBuffer` luôn thuộc sở hữu của một execution context duy nhất tại một thời điểm. Nếu bạn truyền `ArrayBuffer` sang execution context khác, nó được _chuyển giao_ và `ArrayBuffer` gốc trở nên không dùng được. Điều này đảm bảo chỉ một execution context có thể truy cập bộ nhớ tại một thời điểm. `SharedArrayBuffer` không được chuyển giao khi truyền sang execution context khác, vì vậy nhiều execution context có thể truy cập đồng thời. Điều này có thể tạo ra điều kiện tranh chấp (race condition) khi nhiều luồng truy cập cùng vùng bộ nhớ, vì vậy các thao tác như method {{jsxref("Atomics")}} trở nên hữu ích.

## View

Hiện có hai loại view chính: typed array view và {{jsxref("DataView")}}. Typed array cung cấp [các method tiện ích](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#instance_methods) cho phép bạn chuyển đổi dữ liệu nhị phân một cách thuận tiện. `DataView` ở mức thấp hơn và cho phép kiểm soát chi tiết cách dữ liệu được truy cập. Cách đọc và ghi dữ liệu dùng hai loại view này rất khác nhau.

Cả hai loại view đều khiến {{jsxref("ArrayBuffer.isView()")}} trả về `true`. Cả hai đều có các thuộc tính sau:

- `buffer`
  - : Buffer cơ bản mà view tham chiếu.
- `byteOffset`
  - : Offset tính bằng byte của view từ đầu buffer.
- `byteLength`
  - : Độ dài tính bằng byte của view.

Cả hai constructor đều chấp nhận ba tham số trên dưới dạng tham số riêng biệt, mặc dù constructor typed array chấp nhận `length` là số phần tử thay vì số byte.

### Typed array view

Typed array view có tên mô tả rõ ràng và cung cấp view cho tất cả các kiểu số thông thường như `Int8`, `Uint32`, `Float64`, v.v. Có một typed array view đặc biệt là {{jsxref("Uint8ClampedArray")}}, giới hạn giá trị trong khoảng `0` đến `255`. Điều này hữu ích cho việc [xử lý dữ liệu Canvas](/en-US/docs/Web/API/ImageData), ví dụ.

| Kiểu                            | Phạm vi giá trị                        | Kích thước (byte) | Kiểu Web IDL          |
| ------------------------------- | -------------------------------------- | ----------------- | --------------------- |
| {{jsxref("Int8Array")}}         | -128 đến 127                           | 1                 | `byte`                |
| {{jsxref("Uint8Array")}}        | 0 đến 255                              | 1                 | `octet`               |
| {{jsxref("Uint8ClampedArray")}} | 0 đến 255                              | 1                 | `octet`               |
| {{jsxref("Int16Array")}}        | -32768 đến 32767                       | 2                 | `short`               |
| {{jsxref("Uint16Array")}}       | 0 đến 65535                            | 2                 | `unsigned short`      |
| {{jsxref("Int32Array")}}        | -2147483648 đến 2147483647             | 4                 | `long`                |
| {{jsxref("Uint32Array")}}       | 0 đến 4294967295                       | 4                 | `unsigned long`       |
| {{jsxref("Float16Array")}}      | `-65504` đến `65504`                   | 2                 | N/A                   |
| {{jsxref("Float32Array")}}      | `-3.4e38` đến `3.4e38`                 | 4                 | `unrestricted float`  |
| {{jsxref("Float64Array")}}      | `-1.8e308` đến `1.8e308`               | 8                 | `unrestricted double` |
| {{jsxref("BigInt64Array")}}     | -2<sup>63</sup> đến 2<sup>63</sup> - 1 | 8                 | `bigint`              |
| {{jsxref("BigUint64Array")}}    | 0 đến 2<sup>64</sup> - 1               | 8                 | `bigint`              |

Tất cả typed array view đều có cùng method và thuộc tính, được định nghĩa bởi class {{jsxref("TypedArray")}}. Chúng chỉ khác nhau về kiểu dữ liệu cơ bản và kích thước byte. Điều này được thảo luận chi tiết hơn trong [Value encoding and normalization](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#value_encoding_and_normalization).

Về nguyên tắc, typed array có độ dài cố định, vì vậy các method mảng có thể thay đổi độ dài không khả dụng. Bao gồm `pop`, `push`, `shift`, `splice` và `unshift`. Ngoài ra, `flat` không khả dụng vì không có typed array lồng nhau, và các method liên quan như `concat` và `flatMap` không có trường hợp sử dụng tốt nên cũng không khả dụng. Vì `splice` không khả dụng, `toSpliced` cũng vậy. Tất cả các method mảng khác được chia sẻ giữa `Array` và `TypedArray`.

Mặt khác, `TypedArray` có thêm method `set` và `subarray` tối ưu hóa làm việc với nhiều typed array cùng xem một buffer. Method `set()` cho phép thiết lập nhiều index typed array cùng lúc, sử dụng dữ liệu từ một mảng hoặc typed array khác. Nếu hai typed array dùng chung buffer cơ bản, thao tác có thể hiệu quả hơn vì đó là di chuyển bộ nhớ nhanh. Method `subarray()` tạo một typed array view mới tham chiếu cùng buffer với typed array gốc, nhưng với phạm vi hẹp hơn.

Không có cách nào trực tiếp thay đổi độ dài của typed array mà không thay đổi buffer cơ bản. Tuy nhiên, khi typed array xem một resizable buffer và không có `byteLength` cố định, nó sẽ _length-tracking_ và tự động thay đổi kích thước để phù hợp với buffer cơ bản khi buffer được thay đổi kích thước. Xem [Behavior when viewing a resizable buffer](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#behavior_when_viewing_a_resizable_buffer) để biết chi tiết.

Tương tự như mảng thông thường, bạn có thể truy cập các phần tử typed array bằng [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation). Các byte tương ứng trong buffer cơ bản được lấy ra và diễn giải thành số. Bất kỳ truy cập thuộc tính nào dùng số (hoặc biểu diễn chuỗi của số, vì số luôn được chuyển thành chuỗi khi truy cập thuộc tính) sẽ được typed array ủy quyền — chúng không bao giờ tương tác với object trực tiếp. Điều này có nghĩa là, ví dụ:

- Truy cập index ngoài phạm vi luôn trả về `undefined`, mà không thực sự truy cập thuộc tính trên object.
- Bất kỳ cố gắng ghi vào thuộc tính ngoài phạm vi như vậy đều không có tác dụng: không ném lỗi nhưng cũng không thay đổi buffer hay typed array.
- Typed array index có vẻ có thể cấu hình và ghi được, nhưng bất kỳ cố gắng thay đổi thuộc tính của chúng đều thất bại.

```js
const uint8 = new Uint8Array([1, 2, 3]);
console.log(uint8[0]); // 1

// For illustrative purposes only. Not for production code.
uint8[-1] = 0;
uint8[2.5] = 0;
uint8[NaN] = 0;
console.log(Object.keys(uint8)); // ["0", "1", "2"]
console.log(uint8[NaN]); // undefined

// Non-numeric access still works
uint8[true] = 0;
console.log(uint8[true]); // 0

Object.freeze(uint8); // TypeError: Cannot freeze array buffer views with elements
```

### DataView

{{jsxref("DataView")}} là giao diện cấp thấp cung cấp API getter/setter để đọc và ghi dữ liệu tùy ý vào buffer. Điều này hữu ích khi xử lý các kiểu dữ liệu khác nhau, ví dụ vậy. Typed array view theo thứ tự byte gốc (native byte-order, xem [Endianness](/en-US/docs/Glossary/Endianness)) của nền tảng của bạn. Với `DataView`, thứ tự byte có thể được kiểm soát. Theo mặc định, nó là big-endian — các byte được sắp xếp từ quan trọng nhất đến ít quan trọng nhất. Điều này có thể đảo ngược, với các byte sắp xếp từ ít quan trọng nhất đến quan trọng nhất (little-endian), bằng các method getter/setter.

`DataView` không yêu cầu căn chỉnh; đọc và ghi nhiều byte có thể bắt đầu từ bất kỳ offset nào được chỉ định. Các method setter hoạt động theo cùng cách.

Ví dụ sau dùng `DataView` để lấy biểu diễn nhị phân của bất kỳ số nào:

```js
function toBinary(
  x,
  { type = "Float64", littleEndian = false, separator = " ", radix = 16 } = {},
) {
  const bytesNeeded = globalThis[`${type}Array`].BYTES_PER_ELEMENT;
  const dv = new DataView(new ArrayBuffer(bytesNeeded));
  dv[`set${type}`](0, x, littleEndian);
  const bytes = Array.from({ length: bytesNeeded }, (_, i) =>
    dv
      .getUint8(i)
      .toString(radix)
      .padStart(8 / Math.log2(radix), "0"),
  );
  return bytes.join(separator);
}

console.log(toBinary(1.1)); // 3f f1 99 99 99 99 99 9a
console.log(toBinary(1.1, { littleEndian: true })); // 9a 99 99 99 99 99 f1 3f
console.log(toBinary(20, { type: "Int8", radix: 2 })); // 00010100
```

## Web API sử dụng typed array

Dưới đây là một số ví dụ về các API sử dụng typed array; có nhiều API khác và ngày càng có thêm.

- [`FileReader.prototype.readAsArrayBuffer()`](/en-US/docs/Web/API/FileReader/readAsArrayBuffer)
  - : Method `FileReader.prototype.readAsArrayBuffer()` bắt đầu đọc nội dung của [`Blob`](/en-US/docs/Web/API/Blob) hoặc [`File`](/en-US/docs/Web/API/File) được chỉ định.
- [`fetch()`](/en-US/docs/Web/API/Window/fetch)
  - : Tùy chọn [`body`](/en-US/docs/Web/API/RequestInit#body) của `fetch()` có thể là typed array hoặc {{jsxref("ArrayBuffer")}}, cho phép bạn gửi các object này như payload của request {{HTTPMethod("POST")}}.
- [`ImageData.data`](/en-US/docs/Web/API/ImageData)
  - : Là {{jsxref("Uint8ClampedArray")}} đại diện cho mảng một chiều chứa dữ liệu theo thứ tự RGBA, với các giá trị nguyên từ `0` đến `255` bao gồm.

## Ví dụ

### Sử dụng view với buffer

Trước hết, chúng ta cần tạo buffer, ở đây với độ dài cố định 16 byte:

```js
const buffer = new ArrayBuffer(16);
```

Tại thời điểm này, chúng ta có một đoạn bộ nhớ mà tất cả byte đều được khởi tạo về 0. Tuy nhiên, chúng ta không thể làm gì nhiều với nó. Ví dụ, chúng ta có thể xác nhận buffer có kích thước đúng:

```js
if (buffer.byteLength === 16) {
  console.log("Yes, it's 16 bytes.");
} else {
  console.log("Oh no, it's the wrong size!");
}
```

Trước khi thực sự làm việc với buffer này, chúng ta cần tạo view. Hãy tạo một view coi dữ liệu trong buffer là mảng số nguyên có dấu 32-bit:

```js
const int32View = new Int32Array(buffer);
```

Bây giờ chúng ta có thể truy cập các phần tử trong mảng giống như mảng thông thường:

```js
for (let i = 0; i < int32View.length; i++) {
  int32View[i] = i * 2;
}
```

Thao tác này điền 4 phần tử vào mảng (4 phần tử x 4 byte mỗi phần tử = 16 byte tổng cộng) với các giá trị `0`, `2`, `4`, và `6`.

### Nhiều view trên cùng dữ liệu

Mọi thứ trở nên thú vị khi bạn xem xét việc tạo nhiều view trên cùng dữ liệu. Ví dụ, với code trên, chúng ta có thể tiếp tục như sau:

```js
const int16View = new Int16Array(buffer);

for (let i = 0; i < int16View.length; i++) {
  console.log(`Entry ${i}: ${int16View[i]}`);
}
```

Ở đây chúng ta tạo view số nguyên 16-bit chia sẻ cùng buffer với view 32-bit hiện tại và in tất cả giá trị trong buffer dưới dạng số nguyên 16-bit. Bây giờ chúng ta nhận được kết quả `0`, `0`, `2`, `0`, `4`, `0`, `6`, `0` (giả sử mã hóa little-endian):

```plain
Int16Array  |   0  |  0   |   2  |  0   |   4  |  0   |   6  |  0   |
Int32Array  |      0      |      2      |      4      |      6      |
ArrayBuffer | 00 00 00 00 | 02 00 00 00 | 04 00 00 00 | 06 00 00 00 |
```

Bạn có thể tiến xa hơn nữa. Hãy xem xét điều này:

```js
int16View[0] = 32;
console.log(`Entry 0 in the 32-bit array is now ${int32View[0]}`);
```

Kết quả là `"Entry 0 in the 32-bit array is now 32"`.

Nói cách khác, hai mảng này thực sự được xem trên cùng một data buffer, coi nó dưới các định dạng khác nhau.

```plain
Int16Array  |  32  |  0   |   2  |  0   |   4  |  0   |   6  |  0   |
Int32Array  |     32      |      2      |      4      |      6      |
ArrayBuffer | 20 00 00 00 | 02 00 00 00 | 04 00 00 00 | 06 00 00 00 |
```

Bạn có thể làm điều này với bất kỳ kiểu view nào, mặc dù nếu bạn gán một số nguyên và đọc nó lại như số thực dấu phẩy động, có thể bạn sẽ nhận kết quả lạ vì các bit được diễn giải khác nhau.

```js
const float32View = new Float32Array(buffer);
console.log(float32View[0]); // 4.484155085839415e-44
```

### Đọc văn bản từ buffer

Buffer không chỉ đại diện cho số. Ví dụ, đọc một tệp có thể cho bạn buffer dữ liệu văn bản. Bạn có thể đọc dữ liệu này ra từ buffer bằng typed array.

Đoạn sau đọc văn bản UTF-8 dùng web API {{domxref("TextDecoder")}}:

```js
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer);
// Data manually written here, but pretend it was already in the buffer
uint8.set([228, 189, 160, 229, 165, 189]);
const text = new TextDecoder().decode(uint8);
console.log(text); // "你好"
```

Đoạn sau đọc văn bản UTF-16 dùng method {{jsxref("String.fromCharCode()")}}:

```js
const buffer = new ArrayBuffer(8);
const uint16 = new Uint16Array(buffer);
// Data manually written here, but pretend it was already in the buffer
uint16.set([0x4f60, 0x597d]);
const text = String.fromCharCode(...uint16);
console.log(text); // "你好"
```

### Làm việc với cấu trúc dữ liệu phức tạp

Bằng cách kết hợp một buffer duy nhất với nhiều view của các kiểu khác nhau, bắt đầu tại các offset khác nhau trong buffer, bạn có thể tương tác với các object dữ liệu chứa nhiều kiểu dữ liệu. Điều này cho phép bạn, ví dụ, tương tác với các cấu trúc dữ liệu phức tạp từ [WebGL](/en-US/docs/Web/API/WebGL_API) hoặc các tệp dữ liệu.

Hãy xem cấu trúc C này:

```c
struct someStruct {
    unsigned long id;
    char username[16];
    float amountDue;
};
```

Bạn có thể truy cập buffer chứa dữ liệu theo định dạng này như sau:

```js
const buffer = new ArrayBuffer(24);

// … read the data into the buffer …

const idView = new Uint32Array(buffer, 0, 1);
const usernameView = new Uint8Array(buffer, 4, 16);
const amountDueView = new Float32Array(buffer, 20, 1);
```

Sau đó bạn có thể truy cập, ví dụ, số tiền nợ với `amountDueView[0]`.

> [!NOTE]
> [Căn chỉnh cấu trúc dữ liệu](https://en.wikipedia.org/wiki/Data_structure_alignment) trong cấu trúc C phụ thuộc vào nền tảng. Hãy chú ý và xem xét các khác biệt về padding này.

### Chuyển đổi sang mảng thông thường

Sau khi xử lý typed array, đôi khi hữu ích khi chuyển đổi nó trở lại thành mảng thông thường để tận dụng prototype {{jsxref("Array")}}. Điều này có thể thực hiện bằng {{jsxref("Array.from()")}}:

```js
const typedArray = new Uint8Array([1, 2, 3, 4]);
const normalArray = Array.from(typedArray);
```

cũng như bằng [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax):

```js
const typedArray = new Uint8Array([1, 2, 3, 4]);
const normalArray = [...typedArray];
```

## Xem thêm

- [Faster Canvas Pixel Manipulation with Typed Arrays](https://hacks.mozilla.org/2011/12/faster-canvas-pixel-manipulation-with-typed-arrays/) trên hacks.mozilla.org (2011)
- [Typed arrays - Binary data in the browser](https://web.dev/articles/webgl-typed-arrays) trên web.dev (2012)
- [Endianness](/en-US/docs/Glossary/Endianness)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
- {{jsxref("TypedArray")}}
- {{jsxref("SharedArrayBuffer")}}

{{PreviousNext("Web/JavaScript/Guide/Using_promises", "Web/JavaScript/Guide/Iterators_and_generators")}}
