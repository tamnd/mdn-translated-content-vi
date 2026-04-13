---
title: "KeyboardEvent: thuộc tính isComposing"
short-title: isComposing
slug: Web/API/KeyboardEvent/isComposing
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.isComposing
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`KeyboardEvent.isComposing`** trả về
một giá trị boolean cho biết sự kiện có được kích hoạt trong một phiên
soạn thảo hay không, tức là, sau {{domxref("Element/compositionstart_event", "compositionstart")}}
và trước {{domxref("Element/compositionend_event", "compositionend")}}.

## Giá trị

Một boolean.

## Ví dụ

```js
const kbdEvent = new KeyboardEvent("syntheticKey", false);
console.log(kbdEvent.isComposing); // trả về false
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element/compositionstart_event", "compositionstart")}} và {{domxref("Element/compositionend_event", "compositionend")}}
- {{domxref("KeyboardEvent")}}
