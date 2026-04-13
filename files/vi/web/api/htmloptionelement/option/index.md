---
title: "HTMLOptionElement: hàm khởi tạo Option()"
short-title: Option()
slug: Web/API/HTMLOptionElement/Option
page-type: web-api-constructor
browser-compat: api.HTMLOptionElement.Option
---

{{APIRef("HTML DOM")}}

Hàm khởi tạo **`Option()`** tạo một {{domxref("HTMLOptionElement")}} mới.

## Cú pháp

```js-nolint
new Option()
new Option(text)
new Option(text, value)
new Option(text, value, defaultSelected)
new Option(text, value, defaultSelected, selected)
```

### Tham số

- `text` {{optional_inline}}
  - : Một chuỗi đại diện cho nội dung của phần tử, tức là văn bản được hiển thị. Nếu không được chỉ định, giá trị mặc định là "" (chuỗi rỗng).
- `value` {{optional_inline}}
  - : Một chuỗi đại diện cho giá trị của {{domxref("HTMLOptionElement")}}, tức là thuộc tính value của phần tử {{htmlelement("option")}} tương đương. Nếu không được chỉ định, giá trị của `text` được dùng làm giá trị, ví dụ cho giá trị của phần tử {{htmlelement("select")}} liên quan khi biểu mẫu được gửi đến máy chủ.
- `defaultSelected` {{optional_inline}}
  - : Giá trị `true` hoặc `false` đặt giá trị của thuộc tính [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected), tức là để {{htmlelement("option")}} này trở thành giá trị mặc định được chọn trong phần tử {{htmlelement("select")}} khi trang được tải lần đầu. Nếu không được chỉ định, giá trị mặc định là false. Lưu ý rằng giá trị `true` không đặt tùy chọn thành đã chọn nếu nó chưa được chọn.
- `selected` {{optional_inline}}
  - : Giá trị `true` hoặc `false` đặt trạng thái được chọn của tùy chọn; mặc định là false (không được chọn). Nếu bị bỏ qua, ngay cả khi đối số `defaultSelected` là true, tùy chọn vẫn không được chọn.

## Ví dụ

### Chỉ thêm các tùy chọn mới

```js
/* giả sử chúng ta có HTML sau
<select id='s'>

</select>
*/

const s = document.getElementById("s");
const options = [Four, Five, Six];

options.forEach((element, key) => {
  s[key] = new Option(element, key);
});
```

### Thêm các tùy chọn với các tham số khác nhau

```html
<select id="s"></select>
```

```js
const s = document.getElementById("s");
const options = ["zero", "one", "two"];

options.forEach((element, key) => {
  if (element === "zero") {
    s[key] = new Option(element, s.options.length, false, false);
  }
  if (element === "one") {
    s[key] = new Option(element, s.options.length, true, false); // Sẽ thêm thuộc tính "selected"
  }
  if (element === "two") {
    s[key] = new Option(element, s.options.length, false, true); // Sẽ thực sự được chọn trong giao diện
  }
});
```

Kết quả:

```html
<select id="s">
  <option value="0">zero</option>
  <option value="1" selected>one</option>
  <option value="2">two</option>
  <!-- Người dùng sẽ thấy two là 'đã chọn' -->
</select>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
