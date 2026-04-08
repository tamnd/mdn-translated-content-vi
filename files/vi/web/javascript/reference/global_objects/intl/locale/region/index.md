---
title: Intl.Locale.prototype.region
short-title: region
slug: Web/JavaScript/Reference/Global_Objects/Intl/Locale/region
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Intl.Locale.region
sidebar: jsref
---

Thuộc tính truy cập **`region`** của các instance {{jsxref("Intl.Locale")}} trả về vùng lãnh thổ (thường là một quốc gia) liên kết với locale này.

## Mô tả

Vùng lãnh thổ là một trong những thuộc tính cốt lõi của locale. Nó cho phép phân biệt sự khác nhau của cùng một ngôn ngữ ở các quốc gia khác nhau. Ví dụ, tiếng Anh được nói ở Vương quốc Anh và Hoa Kỳ, nhưng có sự khác biệt về cách viết chính tả và các quy ước ngôn ngữ khác giữa hai quốc gia này. Biết vùng lãnh thổ của locale giúp lập trình viên JavaScript đảm bảo rằng nội dung từ trang web và ứng dụng của họ được hiển thị chính xác khi xem từ các khu vực khác nhau trên thế giới.

Giá trị của thuộc tính `region` được đặt lúc khởi tạo, thông qua phần của định danh locale sau `script` hoặc thông qua tùy chọn `region` của hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Tùy chọn sau có ưu tiên cao hơn nếu cả hai đều có mặt; nếu không có cái nào, thuộc tính có giá trị `undefined`.

Set accessor của `region` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

Cũng như các thẻ phụ locale khác, vùng lãnh thổ có thể được thêm vào đối tượng {{jsxref("Intl.Locale")}} thông qua chuỗi locale hoặc đối số đối tượng cấu hình trong hàm khởi tạo.

### Thêm vùng lãnh thổ qua chuỗi locale

Vùng lãnh thổ, nếu có, là phần thứ ba (nếu `script` có mặt, là phần thứ hai trong trường hợp ngược lại) của chuỗi định danh ngôn ngữ Unicode hợp lệ, và có thể được thêm vào chuỗi định danh locale ban đầu truyền vào hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}}. Lưu ý rằng vùng lãnh thổ không phải là phần bắt buộc của định danh locale.

```js
const locale = new Intl.Locale("en-Latn-US");
console.log(locale.region); // "US"
```

### Thêm vùng lãnh thổ qua đối số đối tượng cấu hình

Hàm khởi tạo {{jsxref("Intl/Locale/Locale", "Intl.Locale()")}} có đối số là đối tượng cấu hình tùy chọn. Đặt thuộc tính `region` của đối tượng cấu hình thành vùng lãnh thổ mong muốn, rồi truyền vào hàm khởi tạo.

```js
const locale = new Intl.Locale("fr-Latn", { region: "FR" });
console.log(locale.region); // "FR"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Locale")}}
- [Biểu đồ vùng Unicode](https://www.unicode.org/cldr/charts/47/supplemental/territory_containment_un_m_49.html)
