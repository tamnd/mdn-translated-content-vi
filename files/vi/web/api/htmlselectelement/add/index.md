---
title: "HTMLSelectElement: phương thức add()"
short-title: add()
slug: Web/API/HTMLSelectElement/add
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.add
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLSelectElement.add()`** thêm một phần tử vào tập hợp các phần tử `option` của phần tử `select` này.

## Cú pháp

```js-nolint
add(item)
add(item, before)
```

### Tham số

- `item`
  - : Một {{domxref("HTMLOptionElement")}} hoặc {{domxref("HTMLOptGroupElement")}}
- `before` {{optional_inline}}
  - : Một phần tử của tập hợp, hoặc một chỉ số kiểu _long_, biểu thị vị trí mà _item_ sẽ được chèn trước đó. Nếu tham số này là `null` (hoặc chỉ số không tồn tại), phần tử mới sẽ được nối vào cuối tập hợp.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném nếu _item_ được truyền vào phương thức là một phần tử tổ tiên của {{domxref("HTMLSelectElement")}}.

## Ví dụ

### Tạo phần tử từ đầu

```js
const sel = document.createElement("select");
const opt1 = document.createElement("option");
const opt2 = document.createElement("option");

opt1.value = "1";
opt1.text = "Option: Value 1";

opt2.value = "2";
opt2.text = "Option: Value 2";

sel.add(opt1, null);
sel.add(opt2, null);

/*
  Produces the following, conceptually:

  <select>
    <option value="1">Option: Value 1</option>
    <option value="2">Option: Value 2</option>
  </select>
*/
```

Tham số before là tùy chọn. Vì vậy, những cách sau đều hợp lệ.

```js
sel.add(opt1);
sel.add(opt2);
```

### Nối vào một tập hợp hiện có

```js
const sel = document.getElementById("existingList");

const opt = document.createElement("option");
opt.value = "3";
opt.text = "Option: Value 3";

sel.add(opt, null);

/*
  Takes the existing following select object:

  <select id="existingList">
    <option value="1">Option: Value 1</option>
    <option value="2">Option: Value 2</option>
  </select>

  And changes it to:

  <select id="existingList">
    <option value="1">Option: Value 1</option>
    <option value="2">Option: Value 2</option>
    <option value="3">Option: Value 3</option>
  </select>
*/
```

Tham số before là tùy chọn. Vì vậy, những cách sau đều hợp lệ.

```js
sel.add(opt);
```

### Chèn vào một tập hợp hiện có

```js
const sel = document.getElementById("existingList");

const opt = document.createElement("option");
opt.value = "3";
opt.text = "Option: Value 3";

sel.add(opt, sel.options[1]);

/*
  Takes the existing following select object:

  <select id="existingList">
    <option value="1">Option: Value 1</option>
    <option value="2">Option: Value 2</option>
  </select>

  And changes it to:

  <select id="existingList">
    <option value="1">Option: Value 1</option>
    <option value="3">Option: Value 3</option>
    <option value="2">Option: Value 2</option>
  </select>
*/
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
