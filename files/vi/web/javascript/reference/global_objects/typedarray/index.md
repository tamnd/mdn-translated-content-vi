---
title: TypedArray
slug: Web/JavaScript/Reference/Global_Objects/TypedArray
page-type: javascript-class
browser-compat: javascript.builtins.TypedArray
sidebar: jsref
---

Đối tượng **_TypedArray_** mô tả một khung nhìn dạng mảng trên một [bộ đệm dữ liệu nhị phân](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) cơ bản. Không có thuộc tính toàn cục nào có tên `TypedArray`, cũng không có constructor `TypedArray` nào hiển thị trực tiếp. Thay vào đó, có một số thuộc tính toàn cục khác nhau, có giá trị là các constructor mảng được gõ kiểu cho các kiểu phần tử cụ thể, được liệt kê bên dưới. Trong các trang tiếp theo, bạn sẽ tìm thấy các thuộc tính và phương thức chung có thể được sử dụng với bất kỳ mảng được gõ kiểu nào chứa các phần tử thuộc bất kỳ kiểu nào.

## Mô tả

Constructor `TypedArray` (thường được gọi là `%TypedArray%` để chỉ ra tính "nội tại" của nó, vì nó không tương ứng với bất kỳ global nào được hiển thị cho chương trình JavaScript) đóng vai trò là lớp cha chung của tất cả các lớp con `TypedArray`. Hãy nghĩ về `%TypedArray%` như một "lớp trừu tượng" cung cấp giao diện chung của các phương thức tiện ích cho tất cả các lớp con mảng được gõ kiểu. Constructor này không được hiển thị trực tiếp: không có thuộc tính `TypedArray` toàn cục. Nó chỉ có thể truy cập được thông qua `Object.getPrototypeOf(Int8Array)` và tương tự.

Khi tạo một instance của lớp con `TypedArray` (ví dụ: `Int8Array`), một bộ đệm mảng sẽ được tạo nội bộ trong bộ nhớ, hoặc nếu một đối tượng `ArrayBuffer` được truyền làm đối số constructor, thì `ArrayBuffer` đó sẽ được sử dụng thay thế. Địa chỉ bộ đệm được lưu dưới dạng thuộc tính nội bộ của instance và tất cả các phương thức của `%TypedArray%.prototype` sẽ thiết lập và lấy giá trị dựa trên địa chỉ bộ đệm mảng đó.

### Các đối tượng TypedArray

| Kiểu                            | Phạm vi giá trị                       | Kích thước (byte) | Kiểu Web IDL          |
| ------------------------------- | ------------------------------------- | ----------------- | --------------------- |
| {{jsxref("Int8Array")}}         | -128 đến 127                          | 1                 | `byte`                |
| {{jsxref("Uint8Array")}}        | 0 đến 255                             | 1                 | `octet`               |
| {{jsxref("Uint8ClampedArray")}} | 0 đến 255                             | 1                 | `octet`               |
| {{jsxref("Int16Array")}}        | -32768 đến 32767                      | 2                 | `short`               |
| {{jsxref("Uint16Array")}}       | 0 đến 65535                           | 2                 | `unsigned short`      |
| {{jsxref("Int32Array")}}        | -2147483648 đến 2147483647            | 4                 | `long`                |
| {{jsxref("Uint32Array")}}       | 0 đến 4294967295                      | 4                 | `unsigned long`       |
| {{jsxref("Float16Array")}}      | `-65504` đến `65504`                  | 2                 | N/A                   |
| {{jsxref("Float32Array")}}      | `-3.4e38` đến `3.4e38`                | 4                 | `unrestricted float`  |
| {{jsxref("Float64Array")}}      | `-1.8e308` đến `1.8e308`              | 8                 | `unrestricted double` |
| {{jsxref("BigInt64Array")}}     | -2<sup>63</sup> đến 2<sup>63</sup> - 1 | 8                | `bigint`              |
| {{jsxref("BigUint64Array")}}    | 0 đến 2<sup>64</sup> - 1              | 8                 | `bigint`              |

### Mã hóa giá trị và chuẩn hóa

Tất cả mảng được gõ kiểu đều hoạt động trên `ArrayBuffer`, nơi bạn có thể quan sát biểu diễn byte chính xác của từng phần tử, vì vậy cách số được mã hóa ở định dạng nhị phân là quan trọng.

- Mảng số nguyên không dấu (`Uint8Array`, `Uint16Array`, `Uint32Array`, và `BigUint64Array`) lưu trữ số trực tiếp ở dạng nhị phân.
- Mảng số nguyên có dấu (`Int8Array`, `Int16Array`, `Int32Array`, và `BigInt64Array`) lưu trữ số sử dụng [bù hai](https://en.wikipedia.org/wiki/Two's_complement).
- Mảng dấu phẩy động (`Float16Array`, `Float32Array`, và `Float64Array`) lưu trữ số sử dụng định dạng dấu phẩy động [IEEE 754](https://en.wikipedia.org/wiki/IEEE_754). Tài liệu tham chiếu [`Number`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_encoding) có thêm thông tin về định dạng chính xác. Số JavaScript sử dụng định dạng dấu phẩy động độ chính xác kép theo mặc định, giống với `Float64Array`. `Float32Array` sử dụng 23 (thay vì 52) bit cho phần mantissa và 8 (thay vì 11) bit cho số mũ. `Float16Array` sử dụng 10 bit cho phần mantissa và 5 bit cho số mũ. Lưu ý rằng đặc tả yêu cầu tất cả giá trị {{jsxref("NaN")}} phải sử dụng cùng một mã hóa bit, nhưng mẫu bit chính xác phụ thuộc vào việc triển khai.
- `Uint8ClampedArray` là trường hợp đặc biệt. Nó lưu trữ số ở dạng nhị phân như `Uint8Array`, nhưng khi bạn lưu trữ số ngoài phạm vi, nó _kẹp_ số vào phạm vi 0 đến 255 theo giá trị toán học, thay vì cắt bỏ các bit quan trọng nhất.

Tất cả mảng được gõ kiểu trừ `Int8Array`, `Uint8Array`, và `Uint8ClampedArray` lưu trữ mỗi phần tử bằng nhiều byte. Các byte này có thể được sắp xếp từ quan trọng nhất đến ít quan trọng nhất (big-endian) hoặc từ ít quan trọng nhất đến quan trọng nhất (little-endian). Xem [Endianness](/en-US/docs/Glossary/Endianness) để biết thêm. Mảng được gõ kiểu luôn sử dụng thứ tự byte gốc của nền tảng. Nếu bạn muốn chỉ định thứ tự byte khi ghi và đọc từ bộ đệm, bạn nên sử dụng {{jsxref("DataView")}} thay thế.

Khi ghi vào các mảng được gõ kiểu này, các giá trị nằm ngoài phạm vi có thể biểu diễn sẽ được chuẩn hóa.

- Tất cả mảng số nguyên (trừ `Uint8ClampedArray`) sử dụng [chuyển đổi số chiều rộng cố định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#fixed-width_number_conversion), trước tiên cắt bỏ phần thập phân của số và sau đó lấy các bit thấp nhất.
- `Uint8ClampedArray` trước tiên kẹp số vào phạm vi 0 đến 255 (các giá trị lớn hơn 255 thành 255 và các giá trị nhỏ hơn 0 thành 0). Sau đó nó _làm tròn_ (thay vì làm tròn xuống) kết quả đến số nguyên gần nhất, với quy tắc làm tròn đến chẵn; nghĩa là nếu số chính xác nằm giữa hai số nguyên, nó làm tròn đến số nguyên chẵn gần nhất. Ví dụ, `0.5` thành `0`, `1.5` thành `2`, và `2.5` thành `2`.
- `Float16Array` và `Float32Array` thực hiện "làm tròn đến chẵn" để chuyển đổi số dấu phẩy động 64-bit thành 32-bit và 16-bit. Đây là thuật toán giống như được cung cấp bởi {{jsxref("Math.fround()")}} và {{jsxref("Math.f16round()")}}.

### Hành vi khi xem bộ đệm có thể thay đổi kích thước

Khi một `TypedArray` được tạo như một khung nhìn trên [bộ đệm có thể thay đổi kích thước](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer#resizing_arraybuffers), việc thay đổi kích thước bộ đệm cơ bản sẽ có các hiệu ứng khác nhau lên kích thước của `TypedArray` tùy thuộc vào việc `TypedArray` được xây dựng có theo dõi độ dài hay không.

Nếu một mảng được gõ kiểu được tạo mà không có kích thước cụ thể bằng cách bỏ qua tham số thứ ba hoặc truyền `undefined`, mảng được gõ kiểu sẽ trở thành _theo dõi độ dài_, và sẽ tự động thay đổi kích thước để phù hợp với `buffer` cơ bản khi sau này được thay đổi kích thước:

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const float32 = new Float32Array(buffer);

console.log(float32.byteLength); // 8
console.log(float32.length); // 2

buffer.resize(12);

console.log(float32.byteLength); // 12
console.log(float32.length); // 3
```

Nếu một mảng được gõ kiểu được tạo với kích thước cụ thể bằng tham số `length` thứ ba, nó sẽ không thay đổi kích thước để chứa `buffer` khi bộ đệm được mở rộng:

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const float32 = new Float32Array(buffer, 0, 2);

console.log(float32.byteLength); // 8
console.log(float32.length); // 2
console.log(float32[0]); // 0, the initial value

buffer.resize(12);

console.log(float32.byteLength); // 8
console.log(float32.length); // 2
console.log(float32[0]); // 0, the initial value
```

Khi một `buffer` bị thu nhỏ, mảng được gõ kiểu đang xem có thể vượt ra ngoài giới hạn, trong trường hợp đó kích thước quan sát được của mảng được gõ kiểu sẽ giảm về 0. Đây là trường hợp duy nhất mà độ dài của mảng được gõ kiểu không theo dõi độ dài có thể thay đổi.

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const float32 = new Float32Array(buffer, 0, 2);

buffer.resize(7);

console.log(float32.byteLength); // 0
console.log(float32.length); // 0
console.log(float32[0]); // undefined
```

Nếu sau đó bạn mở rộng `buffer` trở lại để đưa mảng được gõ kiểu trở lại trong giới hạn, kích thước của mảng được gõ kiểu sẽ được khôi phục về giá trị ban đầu.

```js
buffer.resize(8);

console.log(float32.byteLength); // 8
console.log(float32.length); // 2
console.log(float32[0]); // 0 - back in bounds again!
```

Điều tương tự cũng có thể xảy ra với các mảng được gõ kiểu theo dõi độ dài, nếu bộ đệm bị thu nhỏ vượt quá `byteOffset`.

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });
const float32 = new Float32Array(buffer, 4);
// float32 is length-tracking, but it only extends from the 4th byte
// to the end of the buffer, so if the buffer is resized to be shorter
// than 4 bytes, the typed array will become out of bounds
buffer.resize(3);
console.log(float32.byteLength); // 0
```

## Constructor

Đối tượng này không thể được khởi tạo trực tiếp — cố gắng xây dựng nó với `new` sẽ ném ra {{jsxref("TypeError")}}.

```js
new (Object.getPrototypeOf(Int8Array))();
// TypeError: Abstract class TypedArray not directly constructable
```

Thay vào đó, bạn tạo một instance của mảng được gõ kiểu với kiểu cụ thể, chẳng hạn như {{jsxref("Int8Array")}} hay {{jsxref("BigInt64Array")}}. Tất cả các đối tượng này có cú pháp chung cho các constructor:

```js-nolint
new TypedArray()
new TypedArray(length)
new TypedArray(typedArray)
new TypedArray(object)

new TypedArray(buffer)
new TypedArray(buffer, byteOffset)
new TypedArray(buffer, byteOffset, length)
```

Trong đó `TypedArray` là constructor cho một trong các kiểu cụ thể.

> [!NOTE]
> Tất cả các constructor lớp con `TypedArray` chỉ có thể được xây dựng bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `typedArray`
  - : Khi được gọi với một instance của lớp con `TypedArray`, `typedArray` sẽ được sao chép vào mảng được gõ kiểu mới. Đối với constructor `TypedArray` không phải [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt), tham số `typedArray` chỉ có thể là một trong các kiểu không phải [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) (chẳng hạn như {{jsxref("Int32Array")}}). Tương tự, đối với constructor `TypedArray` là [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) ({{jsxref("BigInt64Array")}} hay {{jsxref("BigUint64Array")}}), tham số `typedArray` chỉ có thể là một trong các kiểu [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Mỗi giá trị trong `typedArray` được chuyển đổi sang kiểu tương ứng của constructor trước khi được sao chép vào mảng mới. Độ dài của mảng được gõ kiểu mới sẽ bằng độ dài của đối số `typedArray`.
- `object`
  - : Khi được gọi với đối tượng không phải là instance `TypedArray`, mảng được gõ kiểu mới được tạo theo cách giống như phương thức [`TypedArray.from()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/from).
- `length` {{optional_inline}}
  - : Khi được gọi với giá trị không phải đối tượng, tham số sẽ được xử lý như số chỉ định độ dài của mảng được gõ kiểu. Một bộ đệm mảng nội bộ được tạo trong bộ nhớ, có kích thước bằng `length` nhân với số byte [`BYTES_PER_ELEMENT`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT), được điền bằng số không. Bỏ qua tất cả tham số tương đương với sử dụng `0` làm `length`.
- `buffer`, `byteOffset` {{optional_inline}}, `length` {{optional_inline}}
  - : Khi được gọi với instance [`ArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer) hoặc [`SharedArrayBuffer`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer), và tùy chọn đối số `byteOffset` và `length`, một khung nhìn mảng được gõ kiểu mới được tạo để xem bộ đệm được chỉ định. Các tham số `byteOffset` (tính bằng byte) và `length` (theo số phần tử, mỗi phần tử chiếm số byte [`BYTES_PER_ELEMENT`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT)) chỉ định phạm vi bộ nhớ sẽ được hiển thị bởi khung nhìn mảng được gõ kiểu. Nếu cả hai đều bị bỏ qua, toàn bộ `buffer` được xem; nếu chỉ bỏ qua `length`, phần còn lại của `buffer` bắt đầu từ `byteOffset` được xem. Nếu `length` bị bỏ qua, mảng được gõ kiểu trở thành [theo dõi độ dài](#behavior_when_viewing_a_resizable_buffer).

### Ngoại lệ

Tất cả các constructor lớp con `TypeArray` hoạt động theo cùng một cách. Tất cả chúng sẽ ném ra các ngoại lệ sau:

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Một `typedArray` được truyền nhưng nó là kiểu [bigint](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) trong khi constructor hiện tại không phải, hoặc ngược lại.
    - Một `typedArray` được truyền nhưng bộ đệm nó đang xem bị tách rời, hoặc `buffer` bị tách rời được truyền trực tiếp.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Độ dài của mảng được gõ kiểu mới quá lớn.
    - Độ dài của `buffer` (nếu tham số `length` không được chỉ định) hoặc `byteOffset` không phải là bội số nguyên của kích thước phần tử của mảng được gõ kiểu mới.
    - `byteOffset` không phải là chỉ số mảng hợp lệ (số nguyên trong khoảng 0 đến 2<sup>53</sup> - 1).
    - Khi tạo khung nhìn từ bộ đệm, các giới hạn nằm ngoài bộ đệm. Nói cách khác, `byteOffset + length * TypedArray.BYTES_PER_ELEMENT > buffer.byteLength`.

## Thuộc tính tĩnh

Các thuộc tính này được định nghĩa trên đối tượng constructor `TypedArray` và do đó được chia sẻ bởi tất cả các constructor lớp con `TypedArray`.

- [`TypedArray[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.species)
  - : Hàm constructor được sử dụng để tạo các đối tượng dẫn xuất.

Tất cả các lớp con `TypedArray` cũng có các thuộc tính tĩnh sau:

- {{jsxref("TypedArray.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử cho các đối tượng `TypedArray` khác nhau.

## Phương thức tĩnh

Các phương thức này được định nghĩa trên đối tượng constructor `TypedArray` và do đó được chia sẻ bởi tất cả các constructor lớp con `TypedArray`.

- {{jsxref("TypedArray.from()")}}
  - : Tạo `TypedArray` mới từ đối tượng dạng mảng hoặc đối tượng có thể lặp. Xem thêm {{jsxref("Array.from()")}}.
- {{jsxref("TypedArray.of()")}}
  - : Tạo `TypedArray` mới với số lượng đối số thay đổi. Xem thêm {{jsxref("Array.of()")}}.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `TypedArray.prototype` và được chia sẻ bởi tất cả các instance lớp con `TypedArray`.

- {{jsxref("TypedArray.prototype.buffer")}}
  - : Trả về {{jsxref("ArrayBuffer")}} được tham chiếu bởi mảng được gõ kiểu.
- {{jsxref("TypedArray.prototype.byteLength")}}
  - : Trả về độ dài (tính bằng byte) của mảng được gõ kiểu.
- {{jsxref("TypedArray.prototype.byteOffset")}}
  - : Trả về độ lệch (tính bằng byte) của mảng được gõ kiểu từ đầu {{jsxref("ArrayBuffer")}} của nó.
- {{jsxref("Object/constructor", "TypedArray.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. `TypedArray.prototype.constructor` là hàm constructor `TypedArray` ẩn, nhưng mỗi lớp con mảng được gõ kiểu cũng định nghĩa thuộc tính `constructor` riêng của nó.
- {{jsxref("TypedArray.prototype.length")}}
  - : Trả về số phần tử được giữ trong mảng được gõ kiểu.
- `TypedArray.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`TypedArray.prototype[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là getter trả về chuỗi giống tên của constructor mảng được gõ kiểu. Nó trả về `undefined` nếu giá trị `this` không phải là một trong các lớp con mảng được gõ kiểu. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}. Tuy nhiên, vì `TypedArray` cũng có phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/toString) riêng, thuộc tính này không được sử dụng trừ khi bạn gọi [`Object.prototype.toString.call()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) với mảng được gõ kiểu là `thisArg`.

Tất cả các lớp con `TypedArray` cũng có các thuộc tính instance sau:

- {{jsxref("TypedArray.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử cho các đối tượng `TypedArray` khác nhau.

## Phương thức instance

Các phương thức này được định nghĩa trên đối tượng prototype `TypedArray` và do đó được chia sẻ bởi tất cả các instance lớp con `TypedArray`.

- {{jsxref("TypedArray.prototype.at()")}}
  - : Nhận một giá trị số nguyên và trả về phần tử tại chỉ số đó. Phương thức này cho phép số nguyên âm, đếm ngược từ phần tử cuối.
- {{jsxref("TypedArray.prototype.copyWithin()")}}
  - : Sao chép một chuỗi phần tử mảng trong mảng. Xem thêm {{jsxref("Array.prototype.copyWithin()")}}.
- {{jsxref("TypedArray.prototype.entries()")}}
  - : Trả về đối tượng _array iterator_ mới chứa các cặp khóa/giá trị cho mỗi chỉ số trong mảng. Xem thêm {{jsxref("Array.prototype.entries()")}}.
- {{jsxref("TypedArray.prototype.every()")}}
  - : Trả về `false` nếu tìm thấy phần tử trong mảng không thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, trả về `true`. Xem thêm {{jsxref("Array.prototype.every()")}}.
- {{jsxref("TypedArray.prototype.fill()")}}
  - : Điền tất cả các phần tử của mảng từ chỉ số đầu đến chỉ số cuối bằng một giá trị tĩnh. Xem thêm {{jsxref("Array.prototype.fill()")}}.
- {{jsxref("TypedArray.prototype.filter()")}}
  - : Tạo mảng mới với tất cả các phần tử của mảng này mà hàm lọc được cung cấp trả về `true`. Xem thêm {{jsxref("Array.prototype.filter()")}}.
- {{jsxref("TypedArray.prototype.find()")}}
  - : Trả về `element` đầu tiên trong mảng thỏa mãn hàm kiểm tra được cung cấp, hoặc `undefined` nếu không tìm thấy phần tử phù hợp. Xem thêm {{jsxref("Array.prototype.find()")}}.
- {{jsxref("TypedArray.prototype.findIndex()")}}
  - : Trả về giá trị chỉ số đầu tiên trong mảng có phần tử thỏa mãn hàm kiểm tra được cung cấp, hoặc `-1` nếu không tìm thấy phần tử phù hợp. Xem thêm {{jsxref("Array.prototype.findIndex()")}}.
- {{jsxref("TypedArray.prototype.findLast()")}}
  - : Trả về giá trị của phần tử cuối cùng trong mảng thỏa mãn hàm kiểm tra được cung cấp, hoặc `undefined` nếu không tìm thấy phần tử phù hợp. Xem thêm {{jsxref("Array.prototype.findLast()")}}.
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
  - : Trả về chỉ số của phần tử cuối cùng trong mảng thỏa mãn hàm kiểm tra được cung cấp, hoặc `-1` nếu không tìm thấy phần tử phù hợp. Xem thêm {{jsxref("Array.prototype.findLastIndex()")}}.
- {{jsxref("TypedArray.prototype.forEach()")}}
  - : Gọi hàm cho mỗi phần tử trong mảng. Xem thêm {{jsxref("Array.prototype.forEach()")}}.
- {{jsxref("TypedArray.prototype.includes()")}}
  - : Xác định xem mảng được gõ kiểu có bao gồm một phần tử nhất định hay không, trả về `true` hoặc `false` khi thích hợp. Xem thêm {{jsxref("Array.prototype.includes()")}}.
- {{jsxref("TypedArray.prototype.indexOf()")}}
  - : Trả về chỉ số đầu tiên (nhỏ nhất) của phần tử trong mảng bằng giá trị được chỉ định, hoặc `-1` nếu không tìm thấy. Xem thêm {{jsxref("Array.prototype.indexOf()")}}.
- {{jsxref("TypedArray.prototype.join()")}}
  - : Nối tất cả các phần tử của mảng thành chuỗi. Xem thêm {{jsxref("Array.prototype.join()")}}.
- {{jsxref("TypedArray.prototype.keys()")}}
  - : Trả về array iterator mới chứa các khóa cho mỗi chỉ số trong mảng. Xem thêm {{jsxref("Array.prototype.keys()")}}.
- {{jsxref("TypedArray.prototype.lastIndexOf()")}}
  - : Trả về chỉ số cuối cùng (lớn nhất) của phần tử trong mảng bằng giá trị được chỉ định, hoặc `-1` nếu không tìm thấy. Xem thêm {{jsxref("Array.prototype.lastIndexOf()")}}.
- {{jsxref("TypedArray.prototype.map()")}}
  - : Tạo mảng mới với kết quả của việc gọi hàm được cung cấp trên mỗi phần tử trong mảng này. Xem thêm {{jsxref("Array.prototype.map()")}}.
- {{jsxref("TypedArray.prototype.reduce()")}}
  - : Áp dụng hàm lên bộ tích lũy và từng giá trị của mảng (từ trái sang phải) để rút gọn thành một giá trị. Xem thêm {{jsxref("Array.prototype.reduce()")}}.
- {{jsxref("TypedArray.prototype.reduceRight()")}}
  - : Áp dụng hàm lên bộ tích lũy và từng giá trị của mảng (từ phải sang trái) để rút gọn thành một giá trị. Xem thêm {{jsxref("Array.prototype.reduceRight()")}}.
- {{jsxref("TypedArray.prototype.reverse()")}}
  - : Đảo ngược thứ tự các phần tử của mảng — phần tử đầu tiên trở thành cuối cùng và ngược lại. Xem thêm {{jsxref("Array.prototype.reverse()")}}.
- {{jsxref("TypedArray.prototype.set()")}}
  - : Lưu nhiều giá trị trong mảng được gõ kiểu, đọc các giá trị đầu vào từ mảng được chỉ định.
- {{jsxref("TypedArray.prototype.slice()")}}
  - : Trích xuất một phần của mảng và trả về mảng mới. Xem thêm {{jsxref("Array.prototype.slice()")}}.
- {{jsxref("TypedArray.prototype.some()")}}
  - : Trả về `true` nếu tìm thấy ít nhất một phần tử trong mảng thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, trả về `false`. Xem thêm {{jsxref("Array.prototype.some()")}}.
- {{jsxref("TypedArray.prototype.sort()")}}
  - : Sắp xếp các phần tử của mảng tại chỗ và trả về mảng. Xem thêm {{jsxref("Array.prototype.sort()")}}.
- {{jsxref("TypedArray.prototype.subarray()")}}
  - : Trả về `TypedArray` mới từ chỉ số phần tử đầu và cuối được chỉ định.
- {{jsxref("TypedArray.prototype.toLocaleString()")}}
  - : Trả về chuỗi được bản địa hóa biểu diễn mảng và các phần tử của nó. Xem thêm {{jsxref("Array.prototype.toLocaleString()")}}.
- {{jsxref("TypedArray.prototype.toReversed()")}}
  - : Trả về mảng mới với các phần tử theo thứ tự đảo ngược, mà không thay đổi mảng gốc.
- {{jsxref("TypedArray.prototype.toSorted()")}}
  - : Trả về mảng mới với các phần tử được sắp xếp theo thứ tự tăng dần, mà không thay đổi mảng gốc.
- {{jsxref("TypedArray.prototype.toString()")}}
  - : Trả về chuỗi biểu diễn mảng và các phần tử của nó. Xem thêm {{jsxref("Array.prototype.toString()")}}.
- {{jsxref("TypedArray.prototype.values()")}}
  - : Trả về đối tượng _array iterator_ mới chứa các giá trị cho mỗi chỉ số trong mảng. Xem thêm {{jsxref("Array.prototype.values()")}}.
- {{jsxref("TypedArray.prototype.with()")}}
  - : Trả về mảng mới với phần tử tại chỉ số được chỉ định được thay thế bằng giá trị được chỉ định, mà không thay đổi mảng gốc.
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
  - : Trả về đối tượng _array iterator_ mới chứa các giá trị cho mỗi chỉ số trong mảng.

## Ví dụ

### Truy cập thuộc tính

Bạn có thể tham chiếu các phần tử trong mảng bằng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc vuông). Tuy nhiên, việc lấy hoặc thiết lập các thuộc tính được lập chỉ số trên mảng được gõ kiểu sẽ không tìm kiếm trong chuỗi prototype cho thuộc tính này, ngay cả khi các chỉ số vượt ra ngoài phạm vi. Các thuộc tính được lập chỉ số sẽ tham chiếu đến {{jsxref("ArrayBuffer")}} và sẽ không bao giờ xem xét các thuộc tính đối tượng. Bạn vẫn có thể sử dụng các thuộc tính được đặt tên, giống như với tất cả các đối tượng khác.

```js
// Setting and getting using standard array syntax
const int16 = new Int16Array(2);
int16[0] = 42;
console.log(int16[0]); // 42

// Indexed properties on prototypes are not consulted (Fx 25)
Int8Array.prototype[20] = "foo";
new Int8Array(32)[20]; // 0
// even when out of bound
Int8Array.prototype[20] = "foo";
new Int8Array(8)[20]; // undefined
// or with negative integers
Int8Array.prototype[-1] = "foo";
new Int8Array(8)[-1]; // undefined

// Named properties are allowed, though (Fx 30)
Int8Array.prototype.foo = "bar";
new Int8Array(32).foo; // "bar"
```

### Không thể đóng băng

`TypedArray` không rỗng không thể bị đóng băng, vì `ArrayBuffer` cơ bản của chúng có thể bị thay đổi thông qua một khung nhìn `TypedArray` khác của bộ đệm. Điều này có nghĩa là đối tượng sẽ không bao giờ thực sự bị đóng băng.

```js example-bad
const i8 = Int8Array.of(1, 2, 3);
Object.freeze(i8);
// TypeError: Cannot freeze array buffer views with elements
```

### ByteOffset phải được căn chỉnh

Khi xây dựng `TypedArray` như một khung nhìn trên `ArrayBuffer`, đối số `byteOffset` phải được căn chỉnh theo kích thước phần tử của nó; nói cách khác, độ lệch phải là bội số của `BYTES_PER_ELEMENT`.

```js example-bad
const i32 = new Int32Array(new ArrayBuffer(4), 1);
// RangeError: start offset of Int32Array should be a multiple of 4
```

```js example-good
const i32 = new Int32Array(new ArrayBuffer(4), 0);
```

### ByteLength phải được căn chỉnh

Giống như tham số `byteOffset`, thuộc tính `byteLength` của `ArrayBuffer` được truyền vào constructor `TypedArray` phải là bội số của `BYTES_PER_ELEMENT` của constructor.

```js example-bad
const i32 = new Int32Array(new ArrayBuffer(3));
// RangeError: byte length of Int32Array should be a multiple of 4
```

```js example-good
const i32 = new Int32Array(new ArrayBuffer(4));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of typed arrays in `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [JavaScript typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
- {{domxref("TextDecoder")}}
