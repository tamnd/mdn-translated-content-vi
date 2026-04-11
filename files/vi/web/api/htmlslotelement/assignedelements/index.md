---
title: "HTMLSlotElement: phương thức assignedElements()"
short-title: assignedElements()
slug: Web/API/HTMLSlotElement/assignedElements
page-type: web-api-instance-method
browser-compat: api.HTMLSlotElement.assignedElements
---

{{APIRef("Shadow DOM API")}}

Phương thức **`assignedElements()`** của giao diện {{domxref("HTMLSlotElement")}} trả về một chuỗi các phần tử được gán cho slot này (và không có nút nào khác).

Nếu tùy chọn `flatten` được đặt thành `true`, nó trả về một chuỗi gồm cả các phần tử được gán cho slot này và các phần tử được gán cho bất kỳ slot nào khác là phần tử con của slot này. Nếu không tìm thấy phần tử nào được gán, nó trả về nội dung dự phòng của slot.

## Cú pháp

```js-nolint
assignedElements()
assignedElements(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng đặt các tùy chọn cho các nút sẽ được trả về. Các tùy chọn khả dụng là:
    - `flatten`
      - : Một giá trị logic cho biết có trả về các phần tử được gán của bất kỳ phần tử `<slot>` con nào hiện có (`true`) hay không (`false`). Mặc định là `false`.

### Giá trị trả về

Một mảng các phần tử.

## Ví dụ

```js
let slots = this.shadowRoot.querySelector("slot");
let elements = slots.assignedElements({ flatten: true });
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
