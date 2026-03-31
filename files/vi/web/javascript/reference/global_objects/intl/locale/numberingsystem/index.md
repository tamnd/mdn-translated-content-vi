---
title: Intl.Locale.prototype.numberingSystem
short-title: numberingSystem
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/numberingSystem
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.numberingSystem
sidebar: jsref
---

Thuộc tính truy cập **`numberingSystem`** của các instance {{jsxref("Intl.Locale")}} trả về [hệ thống đánh số](https://en.wikipedia.org/wiki/Numeral_system) cho locale này.

## Mô tả

Hệ thống đánh số là hệ thống để biểu diễn số. Để biết danh sách các loại hệ thống đánh số được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types).

Giá trị của thuộc tính `numberingSystem` được đặt lúc khởi tạo, thông qua khóa `nu` của định danh locale hoặc thông qua tùy chọn `numberingSystem` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `numberingSystem` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, loại hệ thống đánh số có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm hệ thống đánh số qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `numberingSystem` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm loại hệ thống đánh số vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-nu` để chỉ ra rằng bạn đang thêm hệ thống đánh số. Cuối cùng, thêm loại hệ thống đánh số.

```js
const locale = new Intl.Locale("fr-Latn-FR-u-nu-mong");
console.log(locale.numberingSystem); // "mong"
```

### Thêm hệ thống đánh số qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm loại hệ thống đánh số. Đặt thuộc tính `numberingSystem` của đối tượng cấu hình thành loại hệ thống đánh số mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("en-Latn-US", { numberingSystem: "latn" });
console.log(locale.numberingSystem); // "latn"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [`Intl.Locale.prototype.getNumberingSystems()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/getNumberingSystems)
- [Chi tiết về các hệ thống đánh số Unicode tiêu chuẩn](https://github.com/unicode-org/cldr/blob/main/common/supplemental/numberingSystems.xml)
