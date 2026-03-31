---
title: Intl.Locale.prototype.numeric
short-title: numeric
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/numeric
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.numeric
sidebar: jsref
---

Thuộc tính truy cập **`numeric`** của các instance {{jsxref("Intl.Locale")}} trả về thông tin liệu locale này có xử lý đặc biệt khi sắp xếp ký tự số hay không.

## Mô tả

Cũng như {{jsxref("Intl/Locale/caseFirst", "caseFirst")}}, `numeric` đại diện cho một sửa đổi đối với các quy tắc sắp xếp được locale sử dụng. `numeric` là giá trị boolean, nghĩa là nó có thể là `true` hoặc `false`. Nếu `numeric` được đặt là `false`, sẽ không có xử lý đặc biệt nào cho các giá trị số trong chuỗi. Nếu `numeric` được đặt là `true`, locale sẽ tính đến các ký tự số khi sắp xếp chuỗi. Xử lý số đặc biệt này có nghĩa là các chuỗi chữ số thập phân sẽ được so sánh như số. Ví dụ, chuỗi "A-21" sẽ được coi là nhỏ hơn "A-123".

Giá trị của thuộc tính `numeric` được đặt lúc khởi tạo, thông qua khóa `kn` của định danh locale hoặc thông qua tùy chọn `numeric` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `numeric` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, giá trị `numeric` có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm giá trị `numeric` qua chuỗi locale

Trong [đặc tả chuỗi locale Unicode](https://www.unicode.org/reports/tr35/), `numeric` là một "thẻ phụ mở rộng". Các thẻ phụ này thêm dữ liệu bổ sung về locale và được thêm vào định danh locale bằng khóa mở rộng `-u`. Để thêm giá trị `numeric` vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}, trước tiên hãy thêm khóa mở rộng `-u` nếu chưa có. Tiếp theo, thêm phần mở rộng `-kn` để chỉ ra rằng bạn đang thêm giá trị `numeric`. Cuối cùng, thêm giá trị `numeric`. Nếu bạn muốn đặt `numeric` là `true`, chỉ cần thêm khóa `kn` là đủ. Để đặt giá trị là `false`, bạn phải chỉ định bằng cách thêm `"false"` sau khóa `kn`.

```js
const locale = new Intl.Locale("fr-Latn-FR-u-kn-false");
console.log(locale.numeric); // "false"
```

### Thêm giá trị `numeric` qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn, có thể chứa bất kỳ loại mở rộng nào, bao gồm `numeric`. Đặt thuộc tính `numeric` của đối tượng cấu hình thành giá trị `numeric` mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("en-Latn-US", { numeric: true });
console.log(locale.numeric); // "true"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
