---
title: Intl.Locale.prototype.caseFirst
short-title: caseFirst
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/caseFirst
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.caseFirst
sidebar: jsref
---

Thuộc tính truy cập **`caseFirst`** của các instance {{jsxref("Intl.Locale")}} trả về thông tin liệu có xem xét chữ hoa/thường trong quy tắc sắp xếp của locale này hay không.

## Mô tả

Các quy tắc sắp xếp của locale được dùng để xác định thứ tự của chuỗi trong locale đó. Một số locale sử dụng chữ hoa/thường của ký tự trong quá trình sắp xếp. Quy tắc bổ sung này có thể được biểu thị trong thuộc tính `caseFirst` của đối tượng {{jsxref("Intl.Locale")}}. Thuộc tính `caseFirst` có 3 giá trị có thể, được nêu trong bảng dưới đây.

| Giá trị | Mô tả                                        |
| ------- | -------------------------------------------- |
| `upper` | Chữ hoa được sắp xếp trước chữ thường.       |
| `lower` | Chữ thường được sắp xếp trước chữ hoa.       |
| `false` | Không có thứ tự đặc biệt cho chữ hoa/thường. |

Giá trị của thuộc tính `caseFirst` được đặt lúc khởi tạo, thông qua khóa `kf` của định danh locale hoặc thông qua tùy chọn `caseFirst` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `caseFirst` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, giá trị `caseFirst` có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm giá trị caseFirst qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `caseFirst` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm giá trị `caseFirst` vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-kf` để chỉ ra rằng bạn đang thêm giá trị `caseFirst`. Cuối cùng, thêm giá trị `caseFirst`.

```js
const locale = new Intl.Locale("fr-Latn-FR-u-kf-upper");
console.log(locale.caseFirst); // "upper"
```

### Thêm giá trị caseFirst qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm `caseFirst`. Đặt thuộc tính `caseFirst` của đối tượng cấu hình thành giá trị `caseFirst` mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("en-Latn-US", { caseFirst: "lower" });
console.log(locale.caseFirst); // "lower"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Đặc tả sắp xếp chữ hoa/thường Unicode](https://github.com/unicode-org/cldr/blob/main/common/bcp47/collation.xml#L49)
