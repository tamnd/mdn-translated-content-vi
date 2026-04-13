---
title: "TextEncoder: encodeInto() method"
short-title: encodeInto()
slug: Web/API/TextEncoder/encodeInto
page-type: web-api-instance-method
browser-compat: api.TextEncoder.encodeInto
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Phương thức **`TextEncoder.encodeInto()`** nhận một chuỗi cần mã hóa và một {{jsxref("Uint8Array")}} đích để ghi văn bản đã mã hóa {{glossary("UTF-8")}} vào đó, rồi trả về một đối tượng cho biết tiến trình mã hóa.
Phương thức này có thể hiệu quả hơn phương thức {{domxref("TextEncoder.encode()", "encode()")}} - đặc biệt khi bộ đệm đích là một view trong heap [Wasm](/en-US/docs/WebAssembly).

## Cú pháp

```js-nolint
encodeInto(string, uint8Array)
```

### Tham số

- `string`
  - : Một chuỗi chứa văn bản cần mã hóa.
- `uint8Array`
  - : Một thể hiện {{jsxref("Uint8Array")}} để chứa văn bản UTF-8 kết quả.

### Giá trị trả về

Một đối tượng, chứa hai thành phần:

- `read`
  - : Số {{glossary("UTF-16", "đơn vị mã UTF-16")}} từ nguồn đã được chuyển thành UTF-8.
    Giá trị này có thể nhỏ hơn `string.length` nếu `uint8Array` không đủ chỗ.
- `written`
  - : Số byte đã được ghi vào `Uint8Array` đích.
    Các byte đã ghi được bảo đảm tạo thành các chuỗi byte UTF-8 hoàn chỉnh.

## Mã hóa vào một vị trí cụ thể

`encodeInto()` luôn ghi đầu ra ở đầu mảng.
Tuy nhiên, đôi khi cần để đầu ra bắt đầu ở một chỉ mục cụ thể.
Giải pháp là [`TypedArray.prototype.subarray()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/subarray):

```js
const encoder = new TextEncoder();

function encodeIntoAtPosition(string, u8array, position) {
  return encoder.encodeInto(
    string,
    position ? u8array.subarray(position | 0) : u8array,
  );
}

const u8array = new Uint8Array(8);
encodeIntoAtPosition("hello", u8array, 2);
console.log(u8array.join()); // 0,0,104,101,108,108,111,0
```

## Kích thước bộ đệm

Để chuyển đổi một chuỗi JavaScript `s`, không gian đầu ra cần cho việc chuyển đổi đầy đủ sẽ không bao giờ nhỏ hơn `s.length` byte và không bao giờ lớn hơn `s.length * 3` byte.
Tỷ lệ chính xác giữa UTF-8 và UTF-16 của chuỗi còn phụ thuộc vào ngôn ngữ bạn đang làm việc:

- Với văn bản tiếng Anh cơ bản chủ yếu dùng ký tự ASCII, tỷ lệ này gần bằng 1.
- Với văn bản dùng các ký tự từ U+0080 đến U+07FF, bao gồm tiếng Hy Lạp, Cyrillic, Hebrew, Ả Rập, v.v., tỷ lệ này khoảng 2.
- Với văn bản dùng các ký tự từ U+0800 đến U+FFFF, bao gồm tiếng Trung, Nhật, Hàn, v.v., tỷ lệ này khoảng 3.
- Không phổ biến khi cả một hệ chữ được viết bằng [ký tự ngoài BMP](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) (mặc dù chúng vẫn tồn tại). Các ký tự này thường là ký hiệu toán học, emoji, hệ chữ lịch sử, v.v. Tỷ lệ cho các ký tự này là 2, vì chúng chiếm 4 byte trong UTF-8 và 2 trong UTF-16.

Nếu vùng cấp phát đầu ra (thường nằm trong heap Wasm) chỉ tồn tại ngắn hạn, thì nên cấp phát `s.length * 3` byte cho đầu ra, khi đó lần chuyển đổi đầu tiên được bảo đảm sẽ chuyển đổi hết chuỗi.

Ví dụ, nếu văn bản của bạn chủ yếu là tiếng Anh, thì nhiều khả năng văn bản dài sẽ không vượt quá `s.length * 2` byte.
Vì vậy, một cách tiếp cận lạc quan hơn là cấp phát `s.length * 2 + 5` byte, rồi cấp phát lại trong trường hợp hiếm khi dự đoán lạc quan là sai.

Nếu đầu ra dự kiến tồn tại lâu dài, thì nên tính toán mức cấp phát tối thiểu `roundUpToBucketSize(s.length)`, kích thước cấp phát tối đa `s.length * 3`, và chọn một ngưỡng `t` sao cho nếu `roundUpToBucketSize(s.length) + t >= s.length * 3`, thì cấp phát cho `s.length * 3`.
Ngược lại, hãy cấp phát trước cho `roundUpToBucketSize(s.length)` rồi chuyển đổi.
Nếu mục `read` trong từ điển kết quả bằng `s.length`, thì việc chuyển đổi đã xong.
Nếu không, hãy cấp phát lại bộ đệm đích thành `written + (s.length - read) * 3` rồi chuyển đổi phần còn lại bằng cách lấy một chuỗi con của `s` bắt đầu từ chỉ mục `read` và một subbuffer của bộ đệm đích bắt đầu từ chỉ mục `written`.

Ở trên, `roundUpToBucketSize()` là một hàm làm tròn lên đến kích thước bucket của bộ cấp phát.
Ví dụ, nếu biết bộ cấp phát Wasm dùng bucket theo lũy thừa của 2, thì `roundUpToBucketSize()` nên trả về đối số nếu nó đã là lũy thừa của 2, hoặc lũy thừa của 2 kế tiếp nếu chưa phải.
Nếu hành vi của bộ cấp phát Wasm không rõ, `roundUpToBucketSize()` nên là một hàm đồng nhất.

Nếu hành vi của bộ cấp phát không rõ, bạn có thể muốn cho phép tối đa hai bước cấp phát lại và để bước cấp phát lại đầu tiên nhân độ dài _chưa chuyển đổi_ còn lại với 2 thay vì 3.
Tuy nhiên, trong trường hợp đó, không nên áp dụng cách nhân đôi chiều dài bộ đệm _đã ghi_ như thông thường, vì nếu cần cấp phát lại lần thứ hai thì nó sẽ luôn cấp phát thừa so với độ dài gốc nhân 3.
Lời khuyên trên giả định rằng bạn không cần cấp phát thêm byte kết thúc số 0.
Tức là, ở phía Wasm bạn đang làm việc với chuỗi Rust hoặc một lớp C++ không kết thúc bằng số 0.
Nếu bạn đang làm việc với `std::string` của C++, dù độ dài logic được hiển thị cho bạn, bạn vẫn cần tính thêm byte kết thúc khi làm tròn kích thước bucket của bộ cấp phát.
Xem phần tiếp theo về chuỗi C.

## Không có kết thúc số 0

Nếu chuỗi đầu vào chứa ký tự U+0000, `encodeInto()` sẽ ghi byte 0x00 vào đầu ra.
`encodeInto()` _không_ ghi thêm một byte sentinel 0x00 kiểu C ở sau đầu ra logic.

Nếu chương trình Wasm của bạn dùng chuỗi C, thì bạn phải tự ghi sentinel `0x00` và không thể ngăn chương trình Wasm nhìn thấy một chuỗi bị cắt cụt về mặt logic nếu chuỗi JavaScript chứa `U+0000`.
Xem ví dụ:

```js
const encoder = new TextEncoder();

function encodeIntoWithSentinel(string, u8array, position) {
  const stats = encoder.encodeInto(
    string,
    position ? u8array.subarray(position | 0) : u8array,
  );
  if (stats.written < u8array.length) u8array[stats.written] = 0; // append null if room
  return stats;
}
```

## Ví dụ

### Mã hóa vào bộ đệm

```html
<p class="source">This is a sample paragraph.</p>
<p class="result"></p>
```

```js
const sourcePara = document.querySelector(".source");
const resultPara = document.querySelector(".result");
const string = sourcePara.textContent;

const textEncoder = new TextEncoder();
const utf8 = new Uint8Array(string.length);

const encodedResults = textEncoder.encodeInto(string, utf8);
resultPara.textContent +=
  `Bytes read: ${encodedResults.read}` +
  ` | Bytes written: ${encodedResults.written}` +
  ` | Encoded result: ${utf8}`;
```

{{EmbedLiveSample('Mã hóa vào bộ đệm')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextEncoder")}} mà nó thuộc về.
- {{DOMxRef("TextEncoder.encode()")}}
