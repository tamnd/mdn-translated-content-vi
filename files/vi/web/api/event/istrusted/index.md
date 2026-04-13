---
title: "Event: thuộc tính isTrusted"
short-title: isTrusted
slug: Web/API/Event/isTrusted
page-type: web-api-instance-property
browser-compat: api.Event.isTrusted
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`isTrusted`** của giao diện {{domxref("Event")}} là một giá trị boolean có giá trị `true` khi sự kiện được tạo bởi user agent (bao gồm qua hành động của người dùng và các phương thức theo chương trình như {{domxref("HTMLElement.focus()")}}),
và là `false` khi sự kiện được gửi đi qua
{{domxref("EventTarget.dispatchEvent()")}}.
Ngoại lệ duy nhất là sự kiện `click`, vốn khởi tạo thuộc tính `isTrusted`
thành `false` trong các user agent.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
if (e.isTrusted) {
  /* Sự kiện này là sự kiện đáng tin cậy */
} else {
  /* Sự kiện này không phải là sự kiện đáng tin cậy */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
