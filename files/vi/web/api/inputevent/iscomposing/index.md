---
title: "InputEvent: thuộc tính isComposing"
short-title: isComposing
slug: Web/API/InputEvent/isComposing
page-type: web-api-instance-property
browser-compat: api.InputEvent.isComposing
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`InputEvent.isComposing`** trả về một giá trị boolean cho biết sự kiện có được kích hoạt sau {{domxref("Element/compositionstart_event", "compositionstart")}} và trước {{domxref("Element/compositionend_event", "compositionend")}} hay không.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputEvent = new InputEvent("syntheticInput", false);
console.log(inputEvent.isComposing); // return false
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element/compositionstart_event", "compositionstart")}} và {{domxref("Element/compositionend_event", "compositionend")}}
- {{domxref("InputEvent")}}
