---
title: "CustomStateSet: add() method"
short-title: add()
slug: Web/API/CustomStateSet/add
page-type: web-api-instance-method
browser-compat: api.CustomStateSet.add
---

{{APIRef("Web Components")}}

Phương thức **`add`** của giao diện {{domxref("CustomStateSet")}} thêm một giá trị đại diện cho trạng thái tùy chỉnh vào `CustomStateSet`.

Các phần tử tùy chỉnh có một trạng thái cụ thể có thể được chọn bằng pseudo-class {{cssxref(":state()")}}, chỉ định trạng thái mong muốn làm đối số.

## Cú pháp

```js-nolint
add(value)
```

### Tham số

- `value`
  - : Một chuỗi đại diện cho trạng thái tùy chỉnh.

### Giá trị trả về

Undefined.

## Ví dụ

Hàm sau đây thêm trạng thái `checked` vào một `CustomStateSet`.

```js
class MyCustomElement extends HTMLElement {
  set checked(flag) {
    if (flag) {
      this._internals.states.add("checked");
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
