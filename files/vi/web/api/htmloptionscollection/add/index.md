---
title: "HTMLOptionsCollection: add() method"
short-title: add()
slug: Web/API/HTMLOptionsCollection/add
page-type: web-api-instance-method
browser-compat: api.HTMLOptionsCollection.add
---

{{APIRef("HTML DOM")}}

Phương thức **`add()`** của giao diện {{DOMxRef("HTMLOptionsCollection")}} thêm một {{domxref("HTMLOptionElement")}} hoặc {{domxref("HTMLOptGroupElement")}} vào `HTMLOptionsCollection` này.

## Cú pháp

```js-nolint
add(item)
add(item, before)
```

### Tham số

- `item`
  - : Một {{domxref("HTMLOptionElement")}} hoặc {{domxref("HTMLOptGroupElement")}}.
- `before` {{optional_inline}}
  - : Một phần tử của tập hợp, hoặc chỉ số bắt đầu từ 0 dạng số đại diện cho phần tử mà `item` nên được chèn trước. Nếu bỏ qua, `null`, hoặc chỉ số không tồn tại, phần tử mới được thêm vào cuối tập hợp.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra nếu `item` được truyền vào phương thức là tổ tiên của phần tử mà nó được chèn vào.

## Mô tả

Theo mặc định, `add()` thêm {{HTMLelement("option")}} hoặc {{HTMLelement("optgroup")}} được truyền làm tham số vào cuối tập hợp. Bạn có thể xác định nơi `<option>` hoặc `<optgroup>` được thêm nên được đặt bằng cách chỉ định tham số `before`. `before` là phần tử `<option>` hoặc chỉ số `0` dựa trên số nguyên của phần tử `<option>` mà phần tử được thêm nên đứng trước.

Nếu tham số `before` là null hoặc vượt quá phạm vi (hoặc bị bỏ qua), `<option>` hoặc `<optgroup>` sẽ được thêm vào là phần tử cuối trong tập hợp, ngoài bất kỳ {{HTMLelement("optgroup")}} nào. Nếu `<option>` được tham chiếu bởi tham số `before` nằm trong `<optgroup>`, thì `HTMLOptionElement` được thêm sẽ nằm trong cùng nhóm.

Phần tử `<optgroup>` chỉ có thể chứa các phần tử `<option>` làm nút con. Phương thức `add()` sẽ thêm thành công một `HTMLOptGroupElement` vào cuối `HTMLOptionsCollection` hoặc giữa các phần tử `<optgroup>` chỉ khi `<option>` được tham chiếu bởi tham số `before` không phải là `<option>` đầu tiên trong `<optgroup>` của nó.

## Ví dụ

```js
const optionList = document.querySelector("select").options;
const firstOption = document.createElement("option");
firstOption.text = "new item";
optionList.add(firstOption, 0); // added as the first item
optionList.add(optionList[0]); // moves the first item to the end
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("select")}}
- {{DOMxRef("HTMLOptionsCollection.remove")}}
- {{DOMxRef("HTMLOptionsCollection.length")}}
- {{DOMxRef("HTMLOptionsCollection.selectedIndex")}}
