---
title: "HTMLElement: thuộc tính dataset"
short-title: dataset
slug: Web/API/HTMLElement/dataset
page-type: web-api-instance-property
browser-compat: api.HTMLElement.dataset
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`dataset`** của giao diện {{DOMxRef("HTMLElement")}} cung cấp quyền đọc/ghi đối với các [thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*)
(`data-*`) trên các phần tử. Nó hiển thị một ánh xạ các chuỗi
({{domxref("DOMStringMap")}}) với một mục cho mỗi thuộc tính `data-*`.

> [!NOTE]
> Bản thân thuộc tính `dataset` có thể được đọc, nhưng không thể ghi trực tiếp.
> Thay vào đó, tất cả các thao tác ghi phải thực hiện trên các thuộc tính riêng lẻ bên trong
> `dataset`, các thuộc tính này đại diện cho các thuộc tính dữ liệu.

## Giá trị

Một {{domxref("DOMStringMap")}}.

Một thuộc tính `data-*` trong HTML và thuộc tính `dataset.property` tương ứng trong DOM sửa đổi tên chung của chúng tùy thuộc vào nơi chúng được đọc hoặc ghi:

- Trong HTML
  - : Tên thuộc tính bắt đầu bằng `data-`. Nó chỉ có thể chứa các chữ cái,
    số, dấu gạch ngang (`-`), dấu chấm (`.`), dấu hai chấm (`:`),
    và dấu gạch dưới (`_`). Bất kỳ chữ hoa {{Glossary("ASCII")}} nào (`A` đến
    `Z`) đều được chuyển thành chữ thường.
- Trong JavaScript
  - : Tên thuộc tính của một thuộc tính dữ liệu tùy chỉnh giống với thuộc tính HTML
    mà không có tiền tố `data-`. Các dấu gạch ngang đơn (`-`) được xóa bỏ và ký tự ASCII
    tiếp theo sau dấu gạch ngang bị xóa được viết hoa để tạo thành tên camelCase của thuộc tính.

Chi tiết và ví dụ về việc chuyển đổi giữa các dạng HTML và JavaScript được mô tả chi tiết hơn trong phần tiếp theo.

Ngoài thông tin dưới đây, bạn sẽ tìm thấy hướng dẫn sử dụng thuộc tính dữ liệu HTML
trong bài viết [_Sử dụng thuộc tính dữ liệu_](/en-US/docs/Web/HTML/How_to/Use_data_attributes).

### Chuyển đổi tên

- Chuyển đổi `dash-style` sang `camelCase`
  - : Tên thuộc tính dữ liệu tùy chỉnh được chuyển đổi thành khóa cho mục
    {{domxref("DOMStringMap") }} theo cách sau:
    1. Viết thường tất cả các chữ hoa ASCII (`A` đến
       `Z`);
    2. Xóa tiền tố `data-` (bao gồm cả dấu gạch ngang);
    3. Đối với bất kỳ dấu gạch ngang (`U+002D`) nào theo sau là chữ thường ASCII
       `a` đến `z`, xóa dấu gạch ngang và viết hoa chữ cái đó;
    4. Các ký tự khác (bao gồm các dấu gạch ngang khác) được giữ nguyên.

- Chuyển đổi `camelCase` sang `dash-style`
  - : Phép biến đổi ngược lại, ánh xạ một khóa thành tên thuộc tính, sử dụng
    cách sau:
    1. **Hạn chế:** Trước khi biến đổi, dấu gạch ngang _không được_
       đứng ngay trước chữ thường ASCII `a` đến
       `z`;
    2. Thêm tiền tố `data-`;
    3. Thêm dấu gạch ngang trước bất kỳ chữ hoa ASCII nào `A` đến `Z`,
       sau đó viết thường chữ cái đó;
    4. Các ký tự khác được giữ nguyên.

Ví dụ: thuộc tính `data-abc-def` tương ứng với
`dataset.abcDef`.

### Truy cập giá trị

- Các thuộc tính có thể được đặt và đọc bằng tên/khóa camelCase dưới dạng thuộc tính đối tượng của
  dataset: `element.dataset.keyname`.
- Các thuộc tính cũng có thể được đặt và đọc bằng cú pháp dấu ngoặc vuông:
  `element.dataset['keyname']`.
- [Toán tử `in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) có thể kiểm tra xem một thuộc tính có tồn tại hay không:
  `'keyname' in element.dataset`. Lưu ý rằng điều này sẽ duyệt qua [prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của `dataset` và có thể không an toàn nếu bạn có mã bên ngoài có thể làm ô nhiễm prototype chain. Một số phương án thay thế tồn tại, chẳng hạn như {{jsxref("Object/hasOwn", "Object.hasOwn(element.dataset, 'keyname')")}}, hoặc chỉ cần kiểm tra xem `element.dataset.keyname !== undefined`.

### Thiết lập giá trị

- Khi thuộc tính được đặt, giá trị của nó luôn được chuyển đổi thành một chuỗi.
  Ví dụ: `element.dataset.example = null` được
  chuyển đổi thành `data-example="null"`.

- Để xóa một thuộc tính, bạn có thể sử dụng [toán tử `delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete): `delete element.dataset.keyname`.

## Ví dụ

```html
<div id="user" data-id="1234567890" data-user="carinaanand" data-date-of-birth>
  Carina Anand
</div>
```

```js
const el = document.querySelector("#user");

// el.id === 'user'
// el.dataset.id === '1234567890'
// el.dataset.user === 'carinaanand'
// el.dataset.dateOfBirth === ''

// set a data attribute
el.dataset.dateOfBirth = "1960-10-03";
// Kết quả trên JS: el.dataset.dateOfBirth === '1960-10-03'
// Kết quả trên HTML: <div id="user" data-id="1234567890" data-user="carinaanand" data-date-of-birth="1960-10-03">Carina Anand</div>

delete el.dataset.dateOfBirth;
// Kết quả trên JS: el.dataset.dateOfBirth === undefined
// Kết quả trên HTML: <div id="user" data-id="1234567890" data-user="carinaanand">Carina Anand</div>

if (el.dataset.someDataAttr === undefined) {
  el.dataset.someDataAttr = "mydata";
  // Kết quả trên JS: 'someDataAttr' in el.dataset === true
  // Kết quả trên HTML: <div id="user" data-id="1234567890" data-user="carinaanand" data-some-data-attr="mydata">Carina Anand</div>
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Nhóm thuộc tính toàn cục HTML [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*)
- [Sử dụng thuộc tính dữ liệu](/en-US/docs/Web/HTML/How_to/Use_data_attributes)
- {{DOMxRef("Element.getAttribute()")}} và {{DOMxRef("Element.setAttribute()")}}
