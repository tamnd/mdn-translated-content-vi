---
title: Intl.Locale.prototype.collation
short-title: collation
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/collation
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.collation
sidebar: jsref
---

Thuộc tính truy cập **`collation`** của các instance {{jsxref("Intl.Locale")}} trả về [kiểu sắp xếp](https://www.unicode.org/reports/tr35/tr35-collation.html#CLDR_Collation) cho locale này, dùng để sắp xếp chuỗi theo quy tắc của locale.

## Mô tả

Sắp xếp (collation) là quá trình xếp thứ tự các chuỗi ký tự. Nó được dùng bất cứ khi nào cần sắp xếp và đặt chuỗi vào một thứ tự nhất định, từ kết quả truy vấn tìm kiếm đến sắp xếp bản ghi trong cơ sở dữ liệu. Mặc dù việc đặt chuỗi theo thứ tự có vẻ đơn giản, nhưng khái niệm thứ tự có thể khác nhau theo vùng và ngôn ngữ. Để biết danh sách các kiểu sắp xếp được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_collation_types).

Giá trị của thuộc tính `collation` được đặt lúc khởi tạo, thông qua khóa `co` của định danh locale hoặc thông qua tùy chọn `collation` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `collation` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, kiểu sắp xếp có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm kiểu sắp xếp qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `collation` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm kiểu sắp xếp vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-co` để chỉ ra rằng bạn đang thêm kiểu sắp xếp. Cuối cùng, thêm kiểu sắp xếp.

```js
const locale = new Intl.Locale("zh-Hant-u-co-zhuyin");
console.log(locale.collation); // "zhuyin"
```

### Thêm kiểu sắp xếp qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm kiểu sắp xếp. Đặt thuộc tính `collation` của đối tượng cấu hình thành kiểu sắp xếp mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("zh-Hant", { collation: "zhuyin" });
console.log(locale.collation); // "zhuyin"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.getCollations()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getCollations)
