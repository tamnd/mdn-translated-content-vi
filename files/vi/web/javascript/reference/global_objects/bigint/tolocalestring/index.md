---
title: BigInt.prototype.toLocaleString()
short-title: toLocaleString()
slug: Web/JavaScript/Reference/Global_Objects/BigInt/toLocaleString
page-type: javascript-instance-method
browser-compat: javascript.builtins.BigInt.toLocaleString
sidebar: jsref
---

Phương thức **`toLocaleString()`** của các giá trị {{jsxref("BigInt")}} trả về một chuỗi với biểu diễn phụ thuộc ngôn ngữ của BigInt này. Trong các triển khai hỗ trợ [API `Intl.NumberFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat), phương thức này ủy quyền cho `Intl.NumberFormat`.

Mỗi lần `toLocaleString` được gọi, nó phải thực hiện tìm kiếm trong cơ sở dữ liệu lớn các chuỗi bản địa hóa, điều này có thể không hiệu quả. Khi phương thức được gọi nhiều lần với các đối số giống nhau, tốt hơn là tạo đối tượng {{jsxref("Intl.NumberFormat")}} và dùng phương thức {{jsxref("Intl/NumberFormat/format", "format()")}} của nó, vì đối tượng `NumberFormat` ghi nhớ các đối số được truyền vào và có thể quyết định cache một phần cơ sở dữ liệu, vì vậy các lần gọi `format` trong tương lai có thể tìm kiếm các chuỗi bản địa hóa trong một ngữ cảnh bị hạn chế hơn.

{{InteractiveExample("JavaScript Demo: BigInt.prototype.toLocaleString()")}}

```js interactive-example
const bigint = 123456789123456789n;

// German uses period for thousands
console.log(bigint.toLocaleString("de-DE"));
// Expected output: "123.456.789.123.456.789"

// Request a currency format
console.log(
  bigint.toLocaleString("de-DE", { style: "currency", currency: "EUR" }),
);
// Expected output: "123.456.789.123.456.789,00 €"
```

## Cú pháp

```js-nolint
toLocaleString()
toLocaleString(locales)
toLocaleString(locales, options)
```

### Tham số

Các tham số `locales` và `options` tùy chỉnh hành vi của hàm và cho phép các ứng dụng chỉ định ngôn ngữ có các quy ước định dạng sẽ được dùng.

Trong các triển khai hỗ trợ [API `Intl.NumberFormat`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat), các tham số này tương ứng chính xác với các tham số của constructor [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat). Các triển khai không hỗ trợ `Intl.NumberFormat` được yêu cầu bỏ qua cả hai tham số, làm cho locale được dùng và dạng chuỗi được trả về hoàn toàn phụ thuộc vào triển khai.

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Tương ứng với tham số [`locales`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#locales) của constructor `Intl.NumberFormat()`.

    Trong các triển khai không hỗ trợ `Intl.NumberFormat`, tham số này bị bỏ qua và locale của máy chủ thường được dùng.

- `options` {{optional_inline}}
  - : Một đối tượng điều chỉnh định dạng đầu ra. Tương ứng với tham số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#options) của constructor `Intl.NumberFormat()`.

    Trong các triển khai không hỗ trợ `Intl.NumberFormat`, tham số này bị bỏ qua.

Xem [constructor `Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat) để biết chi tiết về các tham số này và cách dùng chúng.

### Giá trị trả về

Một chuỗi đại diện cho BigInt đã cho theo các quy ước dành riêng cho ngôn ngữ.

Trong các triển khai có `Intl.NumberFormat`, điều này tương đương với `new Intl.NumberFormat(locales, options).format(number)`.

> [!NOTE]
> Hầu hết thời gian, định dạng trả về bởi `toLocaleString()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một locale — các biến thể đầu ra là do thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể dùng khoảng trắng không phá vỡ hoặc được bao quanh bởi các ký tự kiểm soát hướng hai chiều. Bạn không nên so sánh kết quả của `toLocaleString()` với các hằng số được mã hóa cứng.

## Ví dụ

### Sử dụng toLocaleString()

Cách sử dụng cơ bản của phương thức này mà không chỉ định `locale` trả về một chuỗi được định dạng theo locale mặc định và với các tùy chọn mặc định.

```js
const bigint = 3500n;

console.log(bigint.toLocaleString());
// "3,500" nếu ở locale tiếng Anh Mỹ
```

### Kiểm tra hỗ trợ tham số locales và options

Các tham số `locales` và `options` có thể không được hỗ trợ trong tất cả các triển khai, vì hỗ trợ cho API quốc tế hóa là tùy chọn, và một số hệ thống có thể không có dữ liệu cần thiết. Đối với các triển khai không hỗ trợ quốc tế hóa, `toLocaleString()` luôn dùng locale của hệ thống, có thể không phải là điều bạn muốn. Vì bất kỳ triển khai nào hỗ trợ tham số `locales` và `options` phải hỗ trợ API {{jsxref("Intl")}}, bạn có thể kiểm tra sự tồn tại của cái sau để hỗ trợ:

```js
function toLocaleStringSupportsLocales() {
  return (
    typeof Intl === "object" &&
    !!Intl &&
    typeof Intl.NumberFormat === "function"
  );
}
```

### Sử dụng locales

Ví dụ này cho thấy một số biến thể trong các định dạng số bản địa hóa. Để lấy định dạng của ngôn ngữ được dùng trong giao diện người dùng ứng dụng của bạn, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng đối số `locales`:

```js
const bigint = 123456789123456789n;

// Tiếng Đức dùng dấu chấm cho hàng nghìn
console.log(bigint.toLocaleString("de-DE"));
// 123.456.789.123.456.789

// Tiếng Ả Rập ở hầu hết các nước nói tiếng Ả Rập dùng chữ số Ả Rập phương Đông
console.log(bigint.toLocaleString("ar-EG"));
// ١٢٣٬٤٥٦٬٧٨٩٬١٢٣٬٤٥٦٬٧٨٩

// Ấn Độ dùng các dấu tách nghìn/lakh/crore
console.log(bigint.toLocaleString("en-IN"));
// 1,23,45,67,89,12,34,56,789

// Khóa mở rộng nu yêu cầu hệ thống số, ví dụ: chữ số thập phân Trung Quốc
console.log(bigint.toLocaleString("zh-Hans-CN-u-nu-hanidec"));
// 一二三,四五六,七八九,一二三,四五六,七八九

// khi yêu cầu ngôn ngữ có thể không được hỗ trợ, chẳng hạn như
// Tiếng Bali, bao gồm ngôn ngữ dự phòng, trong trường hợp này là tiếng Indonesia
console.log(bigint.toLocaleString(["ban", "id"]));
// 123.456.789.123.456.789
```

### Sử dụng options

Các kết quả được cung cấp bởi `toLocaleString()` có thể được tùy chỉnh bằng tham số `options`:

```js
const bigint = 123456789123456789n;

// yêu cầu định dạng tiền tệ
console.log(
  bigint.toLocaleString("de-DE", { style: "currency", currency: "EUR" }),
);
// 123.456.789.123.456.789,00 €

// đồng yên Nhật không dùng đơn vị nhỏ
console.log(
  bigint.toLocaleString("ja-JP", { style: "currency", currency: "JPY" }),
);
// ￥123,456,789,123,456,789

// giới hạn ở ba chữ số có nghĩa
console.log(bigint.toLocaleString("en-IN", { maximumSignificantDigits: 3 }));
// 1,23,00,00,00,00,00,00,000
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("BigInt.prototype.toString()")}}
