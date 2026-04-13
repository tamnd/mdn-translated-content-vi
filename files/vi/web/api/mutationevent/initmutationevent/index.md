---
title: "MutationEvent: phương thức initMutationEvent()"
short-title: initMutationEvent()
slug: Web/API/MutationEvent/initMutationEvent
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent.initMutationEvent
---

{{APIRef("UI Events")}}{{deprecated_header}}{{non-standard_header}}

Phương thức **`initMutationEvent()`** của giao diện {{domxref("MutationEvent")}} khởi tạo giá trị của một mutation event sau khi nó được tạo (thường sử dụng phương thức {{domxref("Document.createEvent()")}}).

Phương thức này phải được gọi để thiết lập sự kiện trước khi nó được gửi đi, sử dụng {{ domxref("EventTarget.dispatchEvent()") }}.

> [!NOTE]
> Nói chung, bạn sẽ không tự tạo các sự kiện này; chúng được tạo bởi trình duyệt.

## Cú pháp

```js-nolint
initMutationEvent(type, canBubble, cancelable, relatedNode,
                  prevValue, newValue, attrName, attrChange)
```

### Tham số

- `type`
  - : Một chuỗi để đặt {{domxref("Event.type", "type")}} của sự kiện. Các trình duyệt đặt các giá trị sau cho {{domxref("MutationEvent")}}: `DOMAttrModified`, `DOMAttributeNameChanged`, `DOMCharacterDataModified`, `DOMElementNameChanged`, `DOMNodeInserted`, `DOMNodeInsertedIntoDocument`, `DOMNodeRemoved`, `DOMNodeRemovedFromDocument`, `DOMSubtreeModified`.
- `canBubble`
  - : Một giá trị boolean cho biết liệu sự kiện có thể nổi bọt hay không. Đặt giá trị của {{domxref("Event.bubbles")}}.
- `cancelable`
  - : Một giá trị boolean cho biết liệu hành động mặc định của sự kiện có thể bị ngăn chặn hay không. Đặt giá trị của {{domxref("Event.cancelable")}}.
- `relatedNode`
  - : Một chuỗi đại diện cho giá trị mới của nút được sửa đổi, nếu có. Đặt giá trị của {{domxref("MutationEvent.relatedNode")}}.
- `prevValue`
  - : Một chuỗi đại diện cho giá trị trước của nút được sửa đổi, nếu có. Đặt giá trị của {{domxref("MutationEvent.prevValue")}}.
- `newValue`
  - : Một chuỗi đại diện cho giá trị mới của nút được sửa đổi, nếu có. Đặt giá trị của {{domxref("MutationEvent.newValue")}}.
- `attrName`
  - : Một chuỗi đại diện cho tên của nút {{domxref("Attr")}} đã thay đổi, nếu có. Đặt giá trị của {{domxref("MutationEvent.attrName")}}.
- `attrChange`
  - : Một số nguyên đại diện cho lý do nút thuộc tính thay đổi. Đặt giá trị của {{domxref("MutationEvent.attrChange")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
